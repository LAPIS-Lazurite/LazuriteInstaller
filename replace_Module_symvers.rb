#! /usr/bin/ruby

require 'json'


fullver = `uname -r`
ver = fullver.gsub(/\-|\+/, "-" => " ", "+" => " ").split(" ");
#p ver[0]


result = `curl https://api.github.com/repos/raspberrypi/firmware/commits`
resultJson = JSON.parse(result)

for rj in resultJson do
    if (rj["commit"]["message"].match(ver[0]) != nil) then
        array = rj["commit"]["url"].split("/")
        sha = array[8]
#       p sha
    end
end


sampleurl = "https://raw.githubusercontent.com/raspberrypi/firmware/sample_sha/extra/Module7.symvers"
url = sampleurl.gsub("sample_sha",sha)
filename = "Module_symvers"
#p url


result = `find /home/pi/linux/ -maxdepth 1 -name Module.symvers`
if result != "" then
    result = `mv /home/pi/linux/Module.symvers /home/pi/linux/Module.symvers.backup`
end
result = `curl #{url} > /home/pi/linux/Module.symvers`


replace = `find /home/pi/linux/ -maxdepth 1 -name Module.symvers`

if replace != "" then
    printf("\n")
    printf("kernel version : %s",fullver)
    printf("sha code       : %s\n",sha)
    printf("replace file   : %s\n",replace)
end
