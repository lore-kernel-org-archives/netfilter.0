From: Ben Swartzlander <ben@swartzlander.org>
Subject: IPv6 policy routing not working on Ubuntu 8.04.3
Date: Mon, 21 Sep 2009 09:46:29 -0400
Message-ID: <4AB783B5.2000802@swartzlander.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to setup some routing policy rules for IPv6 on Ubuntu 8.04.3, 
and it appears to be broken.

root@asura /root
% uname -a
Linux asura 2.6.24-23-generic #1 SMP Wed Apr 1 21:47:28 UTC 2009 i686 
GNU/Linux

root@asura /root
% ip -6 rule list

root@asura /root
% ip -6 rule add from fd2e:51e9:65d3::/48 table 17 prio 700
RTNETLINK answers: Unknown error 4294967199


Notice how there are no rules listed when I run "ip -6 rule list", not 
even the normal local/main rules. I have no idea what the unknown error 
is from RTNETLINK. Anyways I have no problem with ip6tables, ipv6 
routing, or ipv4 policy routing on this machine, and ipv6 policy routing 
does work on some of my other machines (with newer kernels). I'm 
wondering if I'm missing some module or if I have bad configuration, or 
is upgrading the kernel my only hope?


thanks,
Ben Swartzlander

