require 'fileutils'

def name_from_url(url)
    a = url.split('/')
    a[a.size - 1].split('.')[0]
end

def print_name_start(url)
    puts "\e[32;1mStarting install of #{name_from_url(url)}\e[0m"
end

def print_name_end(url)
    puts "\e[32;1mInstalled #{name_from_url(url)}\e[0m"
end

def http(url, output)
    system "wget -O tmp.tgz #{url}"
    system "tar -zxpf tmp.tgz"
    system "make -C tmp"
    FileUtils.mv 'tmp/output.bin', "img/#{output}"
    FileUtils.rm_r 'tmp'
end

def github(repo, output)
    system "git clone https://github.com/#{repo} tmp"
    system "make -C tmp"
    FileUtils.mv 'tmp/output.bin', "img/#{output}"
    FileUtils.rm_r 'tmp'
end