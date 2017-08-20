From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Unable to create set -- neftilter v0.5 on Ubuntu
Date: Sat, 19 Aug 2017 19:50:01 -0700
Message-ID: <78d387b7-25bf-3ae9-3b1e-7d6acc5c0d6a@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Coming from experience with Cisco and FreeBSD, it was a welcome relief 
to see that the relatively inscrutable _iptables_ had a successor with a 
much more readable syntax and greater power and flexibility. Having sets 
and dictionaries are crucial for ease of understanding, robustness, and 
maintainability for me, as is the ability to do an atomic swap of rules.

After spending quite some time reading <https://wiki.nftables.org/>, the 
installed man page, 
<http://www.netfilter.org/projects/nftables/manpage.html> and the few 
examples I could find, I did my best to fill in the gaps in the 
documentation and resolve inconsistencies between the official 
documentation and the examples out there, such as 
<https://wiki.gentoo.org/wiki/Nftables/Examples>


With what I believed to be something that was close to what would parse 
and compile, I started working through the syntax errors reported. 
Eventually it became clear that there were some core problems somewhere 
and I started with the simplest parts first. Create a set...

jeff@ubuntu:~$ sudo nft list ruleset
jeff@ubuntu:~$ sudo nft flush ruleset
jeff@ubuntu:~$ sudo nft add table inet global
jeff@ubuntu:~$ sudo nft list ruleset
table inet global {
}
jeff@ubuntu:~$ sudo nft add set global some_addrs { type ipv4_addr \; }
<cmdline>:1:1-46: Error: Could not process rule: Table 'global' does not 
exist
add set global some_addrs { type ipv4_addr ; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
jeff@ubuntu:~$ sudo nft list ruleset
table inet global {
}


Ummm, it sure looks like _Table 'global'_ exists to me!

What am I missing here?


Are there any gotchas in building netfilter against kernel 4.4 or 4.9?

Is my reading correct that netfilter v0.7 requires kernel 4.10, or is 
that just for some of the new features, such as fib access for 
determining reverse path and reachability?


Thanks,

Jeff


nftables installed through apt on Ubuntu, on both an amd64 and an armv7l 
machine. Same behavior on both.
Fails similarly either from the command line or within an nft-processed 
file.


jeff@ubuntu:~$ lsb_release -a
No LSB modules are available.
Distributor ID:    Ubuntu
Description:    Ubuntu 16.04.3 LTS
Release:    16.04
Codename:    xenial

jeff@ubuntu:~$ uname -a
Linux ubuntu 4.4.0-91-generic #114-Ubuntu SMP Tue Aug 8 11:56:56 UTC 
2017 x86_64 x86_64 x86_64 GNU/Linux

jeff@ubuntu:~$ dpkg -s nftables | fgrep Version
Version: 0.5+snapshot20151106-1


jeff@xu4-devel:~$ lsb_release -a
No LSB modules are available.
Distributor ID:    Ubuntu
Description:    Ubuntu 16.04.3 LTS
Release:    16.04
Codename:    xenial

jeff@xu4-devel:~$ uname -a
Linux xu4-devel 4.9.28-38 #1 SMP PREEMPT Mon May 15 22:34:14 UTC 2017 
armv7l armv7l armv7l GNU/Linux

jeff@xu4-devel:~$ dpkg -s nftables | fgrep Version
Version: 0.5+snapshot20151106-1




