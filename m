From: Kevin Wilson <wkevils@gmail.com>
Subject: How to install xtables extension to arbitrary path when cross compiling iptables?
Date: Mon, 16 Apr 2012 15:19:00 +0000 (UTC)
Message-ID: <loom.20120416T170250-226@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

how to install xtables extension to arbitrary path when cross compiling?


I have this issue, which I cannot resolve, 
when cross compiling iptables 1.4.8 
with 
./configure --prefix=/home/kevin/fs/test1_iptables ... 
and running afterwards make and make install, and then 

on the target machine (which access the fs by NFS) I run: 

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT -s 10.1.1.25
The error I get is:

./iptables -A FORWARD -i eth1 -j SNAT
iptables v1.4.8: Couldn't load target `SNAT'
:/home/kevin/fs/test1_iptables/libexec/xtables/libipt_SNAT.so: cannot open
shared object file: No such file or directory


Of course I don't have /home/kevin/fs/ on the boards (this path is on the machine
on which I ran the cross compile).
I saw 
this post in gmane.comp.security.firewalls.netfilter.general.
http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/40914

but it seems that the problem persists.

I tried also to work with DESTDIR and with other ideas from this post, but
nothing helped. 

What is the problem here, does anybody know ? I believe that cross compiling 
iptables and setting a path to xtables libs not to an absolute path 
is possible. Any ideas ?  

