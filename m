From: "H.Suzuki" <suzuki@tokyo.eeyo.jp>
Subject: dscp module on ip6tables
Date: Thu, 28 Aug 2008 08:04:52 +0900
Message-ID: <F3BE45CBC8EB41568B558470FD291FE2@gillsPC>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm using Ip6tables(v1.4.2-rc-1) on RHEL5 standard kernel-2.6.18-e15.

I'd like to use "dscp" module on "MATCH EXTENSION" but getting error
as follows.

It looks like it's there by looking at help message but "libip6t_*dscp* is
not created. I compiled by executing " make config ; make install".

Please let me know how can I use "dscp" option on ip6tables.


Error Messages:
# /usr/local/sbin/ip6tables  -t mangle -A OUTPUT -p tcp -j DSCP -m 
dscp --dscp-class EF
ip6tables v1.4.2-rc1: DSCP target: Parameter --set-dscp is required
Try `ip6tables -h' or 'ip6tables --help' for more information.
# /usr/local/sbin/ip6tables  -t mangle -A OUTPUT -p tcp -j DSCP -m 
dscp --set-dscp 1
ip6tables v1.4.2-rc1: DSCP match: Parameter --dscp is required
Try `ip6tables -h' or 'ip6tables --help' for more information.


Enviroment::
# /usr/local/sbin/ip6tables -V
iptables v1.4.2-rc1

# /usr/local/sbin/ip6tables -m dscp -h

dscp match options
[!] --dscp value                Match DSCP codepoint with numerical value
                                This value can be in decimal (ex: 32)
                        or in hex (ex: 0x20)
[!] --dscp-class name           Match the DiffServ class. This value may
                                be any of the BE,EF, AFxx or CSx classes

# ls /usr/local/libexec/xtables/libip6t_*dsc*
ls: /usr/local/libexec/xtables/libip6t_*dsc*: No such file or directory


Thank you!

----
H.Suzuki 


