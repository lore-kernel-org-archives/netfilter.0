From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sat, 22 Sep 2007 22:27:24 -0400
Message-ID: <46F5CF0C.3060004@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F5C161.7090908@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gerry Reno wrote:
> Well, I'm just forging ahead.  Hopefully someone can answer my 
> original question about user chains.
>
> Right now I tried starting the fwknop daemon and was greeted with 
> these errors:
>
> # service fwknop start
> Starting the fwknop daemons: Can't load 
> '/usr/lib/fwknop/i386-linux-thread-multi/auto/Net/Pcap/Pcap.so' for 
> module Net::Pcap: libpcap.so.0.9.4: cannot open shared object file: No 
> such file or directory at 
> /usr/lib/perl5/5.8.8/i386-linux-thread-multi/DynaLoader.pm line 230.
> at /usr/sbin/fwknopd line 47
> Compilation failed in require at /usr/sbin/fwknopd line 47.
> BEGIN failed--compilation aborted at /usr/sbin/fwknopd line 47.
>
>
> What I have installed is the latest rpm from CipherDyne:  
> fwknop-1.8.2-1.i386.rpm 
> <http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2-1.i386.rpm> 
> and I guess this rpm either doesn't have the right dependencies and 
> did not perform something necessary during %post.
>
> help...
>
> Gerry
Well, I found out that the problem is that Fedora 7 has libpcap 0.9.5 
installed and fwknop is looking specifically for libpcap 0.9.4.  So I 
just created a symlink from 0.9.5 to 0.9.4 in /usr/lib.  We'll see if 
this will work.

----------------------------------
So then we get to the next error:

# service fwknop start
Starting the fwknop daemons: [*] /etc/fwknop/access.conf: source ANY 
missing PORT_OFFSET, defaulting to 61000. at /usr/sbin/fwknopd line 2911.
                                                           [FAILED]

Ok, so it defaulted to 61000 but then why not start at this point?

----------------------------------
next try:

put in a PORT_OFFSET

# service fwknop start
Starting the fwknop daemons: [*] /etc/fwknop/access.conf: source ANY 
missing KNOCK_INTERVAL, defaulting to 60. at /usr/sbin/fwknopd line 2973.
                                                           [FAILED]

----------------------------------
next try:


put in a KNOCK_INTERVAL

# service fwknop start
Starting the fwknop daemons:                               [  OK  ]

Finally!

But, when I check the log I see this:

Sep 22 21:57:48 grp-01-00-50 fwknopd: starting fwknopd
Sep 22 21:57:50 grp-01-00-50 fwknopd: flushing existing iptables 
IPT_AUTO_CHAIN chains
Sep 22 21:57:50 grp-01-00-50 fwknopd: warning, could not find iptables 
state tracking rules in INPUT chain   <------- here I think it is 
confused about RH/Fedora iptables structure
Sep 22 21:57:50 grp-01-00-50 fwknopd: imported access directives (1 
SOURCE definitions).
Sep 22 21:57:50 grp-01-00-50 kernel: device eth0 entered promiscuous mode
Sep 22 21:57:52 grp-01-00-50 setroubleshoot:      SELinux is preventing 
/sbin/iptables (iptables_t) "write" to /var/log/fwknop/fwknopd.iptout 
(var_log_t).      For complete SELinux messages. run sealert -l 
13ca6c50-c04a-4602-9464-9a01ec6a0ba5

I tried to restorecon -v the file but no luck, still same error.

# ls -l /var/log/fwknop/
total 16
dr-x------ 2 root root 4096 2007-09-22 21:57 errs
-rw-r--r-- 1 root root    0 2007-09-22 22:22 fwknopd.ipterr
-rw-r--r-- 1 root root    0 2007-09-22 22:22 fwknopd.iptout

????


