From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Difficulties with ulog / NFCT
Date: Sun, 14 Jun 2020 13:33:16 +0200
Message-ID: <23359a19-b348-cf6d-eb96-623ea466babe@tana.it>
References: <ef15f5cc-1fa3-fe40-3e5e-a463e3f95314@tana.it>
 <ee17e7ef-8e26-4062-5c2c-b666e9525d59@tana.it>
 <CAEzD07JoH=KN4z0hN+UXqPr3AJW6cc3maVwMRZUcahSkfL+8WQ@mail.gmail.com>
 <98ae7d6e-f9f5-477e-469a-7ea7182060db@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1592134396; bh=D4VlA8de8KpUmB/3m31AmZsXrofzT0YwHFzDcJIANtQ=;
        l=2101; h=From:To:Cc:References:Date:In-Reply-To;
        b=B+iIA3m9IZNb9nrup7qBpJ0BV0E+7YerVvakucNg1/wClfjOqWogsL0TXvYVWQCS2
         jfg7rG7F5+/NAEOlTgBEkEctyjKthKyyb07LOnDXKz3Xm7SD/Odxy4+OCm0nYy161C
         cYVFw7V149JyWSrNLwtYBse+Q/9wWFbqMbtemrrh4Eo88ClBmcy8F93HjdSHl
In-Reply-To: <98ae7d6e-f9f5-477e-469a-7ea7182060db@tana.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon 17/Feb/2020 19:01:00 +0100 Alessandro Vesely wrote:
> On Mon 17/Feb/2020 16:53:23 +0100 Anton Danilov wrote:
>> Have you enabled the conntrack accounting and conntrack timestamps via sysctl?
> 
> 
> Nope.  [...]
> 
> Now I set nf_conntrack_timestamp=1 and I'm starting to get some non-NULL
> timestamps.  Great!


At the time, I also wrote a file:

# ls -labt /etc/sysctl.d/timestamps*
-rw-r--r-- 1 root root 65 Feb 17 18:27 /etc/sysctl.d/timestamps_in_nfct_ulog.conf

# cat !$
cat /etc/sysctl.d/timestamps*
# start timestamp in ulog
net.netfilter.nf_conntrack_timestamp=1

Yet, upon reboot, I found:
net.netfilter.nf_conntrack_timestamp = 0

The only (cryptic) message I found in the logs was:
[  168.919868] nf_conntrack: default automatic helper assignment has been turned off for security reasons and CT-based firewall rule not found. Use the iptables CT target to attach helpers instead.

Any idea what went wrong?


For a second warning to people on this path, the LSB headers in my ulog2 init script missed the following:
# Should-Start:      mysql
# Should-Stop:       mysql

I wrote an amended LSB in /etc/insserv/overrides/ulog2

Before doing so, ulogd erred out:
Jun 12 08:47:59 29 north ulogd[5681]: building new pluginstance stack: 'log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU'
Jun 12 08:47:59 27 north ulogd[5681]: can't find requested plugin PRINTPKT
Jun 12 08:47:59 29 north ulogd[5681]: building new pluginstance stack: 'ct1:NFCT,ip2str1:IP2STR,mysql1:MYSQL'
Jun 12 08:47:59 29 north ulogd[5681]: (re)configuring
Jun 12 08:47:59 27 north ulogd[5681]: can't connect to db: Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2 "No such file or directory")
Jun 12 08:47:59 27 north ulogd[5681]: error in open_db
Jun 12 08:47:59 27 north ulogd[5681]: error during configure of plugin MYSQL
Jun 12 08:47:59 26 north ulogd[5681]: not even a single working plugin stack

I restarted it by /etc/init.d/ulogd2 start.  Could that error have cleared nf_conntrack_timestamp??


Best
Ale
-- 

























