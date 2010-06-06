From: Tytus Rogalewski <tytanick@gmail.com>
Subject: Re: iptables slows tproxy SQUID with DNAT or REDIRECT
Date: Sun, 6 Jun 2010 12:38:55 +0200
Message-ID: <AANLkTingVZPy99_bYu6rOVDx6t1c4k_xe86293cJHGU4@mail.gmail.com>
References: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=LfgZM7uXdnYoUwjlMBJZ4OBdRmaOUVHxdZ/OuiAIxcE=;
        b=AeA6NYRF8B5gqOBqr6Wchsx+LYfIiYSe7etz4Lmm7V8jXZIhNGaTHwHkiggHCIUpnt
         +3YYPPu3FeTCzZ8iOs7v607D11ojKxJJBf3NiRBXZiIyf83X3zRusLZL+1nHYXtop3dB
         uyxWQ0PUbpvN85u4uHrCkrE65xZUWSBc6/MxQ=
In-Reply-To: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

[ if you dont know my problem, see flash movie from links few lines dow=
n]
> Just watch a movie that i made and you will see my problem clearly !
>
> You can download zipped html and swf(movie) file from rapidshare: (yo=
u
> can choose different resolutions)
> http://rapidshare.com/files/395636925/iptables_squid_slow_1600.rar
> http://rapidshare.com/files/395636761/iptables_squid_slow_1440.rar
> http://rapidshare.com/files/395634867/iptables_squid_slow_1024.rar
> http://rapidshare.com/files/395632385/iptables_squid_slow_800.rar
>
> OR if you cant download from rapidshare, here are direct links to my
> server (with SLOW UPLOAD 50 KB/s - so you will need to wait few mins
> :P)
> http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1600=
=2Ehtml
> http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1440=
=2Ehtml
> http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1024=
=2Ehtml
> http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_800.=
html

so tell me guys, if i used squid manyally (setting as normla proxy in
firefox) and that configuration works perfectly fine,
so that cant be squid issue right ?

only transparent mode makes issues (see movie) -
tell me what can i do to debug my problem ?
i cant disconnect people from internet longer than 1-2 mins (i can do
only reboot - when i change kernel or something)
so what you suggest ?

here is squid info - but it cant be bad configuration if it works as
normla proxy !

Squid Object Cache: Version 3.1.3
Start Time:     Sat, 05 Jun 2010 15:59:50 GMT
Current Time:   Sun, 06 Jun 2010 10:30:45 GMT
Connection information for squid:
        Number of clients accessing cache:      2
        Number of HTTP requests received:       3778
        Number of ICP messages received:        0
        Number of ICP messages sent:    0
        Number of queued ICP replies:   0
        Number of HTCP messages received:       0
        Number of HTCP messages sent:   0
        Request failure ratio:   0.00
        Average HTTP requests per minute since start:   3.4
        Average ICP messages per minute since start:    0.0
        Select loop called: 52573292 times, 1.268 ms avg
Cache information for squid:
        Hits as % of all requests:      5min: 0.0%, 60min: 0.0%
        Hits as % of bytes sent:        5min: 3.8%, 60min: 4.0%
        Memory hits as % of hit requests:       5min: 0.0%, 60min: 0.0%
        Disk hits as % of hit requests: 5min: 0.0%, 60min: 0.0%
        Storage Swap size:      13316 KB
        Storage Swap capacity:   0.0% used, 100.0% free
        Storage Mem size:       11824 KB
        Storage Mem capacity:    0.8% used, 99.2% free
        Mean Object Size:       4.63 KB
        Requests given to unlinkd:      0
Median Service Times (seconds)  5 min    60 min:
        HTTP Requests (All):   0.15048  0.15048
        Cache Misses:          0.15048  0.15048
        Cache Hits:            0.00000  0.00000
        Near Hits:             0.00000  0.00000
        Not-Modified Replies:  0.00000  0.00000
        DNS Lookups:           0.01852  0.01852
        ICP Queries:           0.00000  0.00000
Resource usage for squid:
        UP Time:        66654.993 seconds
        CPU Time:       33.691 seconds
        CPU Usage:      0.05%
        CPU Usage, 5 minute avg:        0.29%
        CPU Usage, 60 minute avg:       0.06%
        Process Data Segment Size via sbrk(): 11984 KB
        Maximum Resident Size: 261056 KB
        Page faults with physical i/o: 0
Memory usage for squid via mallinfo():
        Total space in arena:   12260 KB
        Ordinary blocks:        12130 KB     92 blks
        Small blocks:               0 KB      0 blks
        Holding blocks:         19996 KB    108 blks
        Free Small blocks:          0 KB
        Free Ordinary blocks:     129 KB
        Total in use:           32126 KB 100%
        Total free:               129 KB 0%
        Total size:             32256 KB
Memory accounted for:
        Total accounted:        22136 KB  69%
        memPool accounted:      22136 KB  69%
        memPool unaccounted:    10119 KB  31%
        memPoolAlloc calls:   1147149
        memPoolFree calls:    1033248
=46ile descriptor usage for squid:
        Maximum number of file descriptors:   1024
        Largest file desc currently in use:    135
        Number of file desc currently in use:  114
        Files queued for open:                   0
        Available number of file descriptors:  910
        Reserved number of file descriptors:   100
        Store Disk files open:                   0
Internal Data Structures:
          2917 StoreEntries
          2516 StoreEntries with MemObjects
          2514 Hot Object Cache Items
          2877 on-disk objects



2010/6/5 Tytus Rogalewski <tytanick@gmail.com>:
> hello guys
> i am having very strange problem with my SQUID and iptables.
> It is for sure NOT A SQUID ISSUE (i've tested 6 different versions of
> squid, 2.7.x , 3.0.x and 3.1.x - and =A0other people dont have this
> issue)
> In all versions there was one problem. When i use TRANSPARENCY mode
> (so i redirect 80 port in iptables via DNAT or REDIRECT)
> =A0 =A0 =A0 iptables -t nat -A PREROUTING -p tcp -s 192.168.0.2 ! -d
> 192.168.0.0/24 --dport 80 -j REDIRECT --to-port 8123 # Tytanick
> =A0 =A0 =A0 iptables -t nat -A PREROUTING -p tcp -s 192.168.0.2 ! -d
> 192.168.0.0/24 --dport 80 -j DNAT --to 192.168.0.1:8123 # Tytanick
> i am having problem that pages load SLOWLY - exacly few images load v=
ery slowly.
> In all cases, my browser cache and squid cache was cleaned.
>
> my kernel version: linux-2.6.34
> iptables: 1.4.3.2
> Linux Gentoo
> 3GHZ core2duo
> 4GB RAM
>
>
> --
> Z pozdrowieniami
> Tytus Rogalewski
> mail: tytanick{monkey}gmail.com
> www.sky-link.net
> gg: 210533
> skype: tytanick
>



--=20
Z pozdrowieniami
Tytus Rogalewski
mail: tytanick{monkey}gmail.com
www.sky-link.net
gg: 210533
skype: tytanick
