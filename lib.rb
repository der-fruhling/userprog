require 'fileutils'

def http(url, output)
    system "wget -O tmp.tgz #{url}"
    system "tar -zxpf tmp.tgz"
    system "make -C tmp output.bin"
    FileUtils.mv 'tmp/output.bin', "img/#{output}"
    FileUtils.rm_r 'tmp'
end

def github(repo, output)
    system "git clone https://github.com/#{repo} tmp"
    system "make -C tmp output.bin"
    FileUtils.mv 'tmp/output.bin', "img/#{output}"
    FileUtils.rm_r 'tmp'
end