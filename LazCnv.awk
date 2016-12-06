#! /usr/bin/nawk -f
# 概要：
#   このスクリプトは文字列の置き換えスクリプトです。
#   Linuxバージョンアップ時にLazuriteInstallerで使用します。
#
# 主な機能：
#   条件に従って対象ファイルを探します。
#   条件に従って文字列を第一引数で指定された文字列に置き換えます。
#   改修ファイルを一時保存ファイル("~"付きのファイル)に保存します。
#   コメントアウト行を有効にするとbackup/フォルダにバックアップします。
# 
# 実行方法:
#   % LazCnv.awk [change word]
BEGIN {
    cnvstr = ARGV[1]
    flg = 0
    i=n=0
    while (("grep -l spidev0 bcm*rpi*"| getline var) > 0){
        getfiles[i++] = var
    }
    print "Linuxの定義ファイルを更新中" 
#   system("mkdir backup")
    for(n=0; n < i; n++){
#       system("cp "getfiles[n]" backup/.")
        while(getline < getfiles[n]){
            ouput = "~"getfiles[n]
            cnv(ouput)
        }
        system("mv "ouput" "getfiles[n])
    }
}

function cnv(output) {
    if ($0 ~ /spidev0/) flg = 1
    else if (flg == 1 && $0 ~ /compatible/) {
        sta = match($0,/"/) + 1
        len = match($0,/";/) - sta
        before = substr($0,sta,len)
        gsub(before,cnvstr)
    }
    else flg = 0
    print > ouput
}
