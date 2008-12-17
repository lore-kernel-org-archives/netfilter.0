From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Bug in limit match?
Date: Wed, 17 Dec 2008 10:44:25 +0100
Message-ID: <4948C9F9.5010803@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello netfilter user mailing list!

I think i discovered a small problem with the limit match of iptables:

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 
1/day -j LOG
iptables: Invalid argument
eris:~#

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 
2/day -j LOG
eris:~# echo $?
0
eris:~#

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 
3/day -j LOG
iptables: Invalid argument
eris:~#

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit 
4/day -j LOG
eris:~# echo $?
0
eris:~#

the invalid argument error, happens with 1/d(ay) or 3/d(ay) limt rate value.
not that i really want to log 1 or 3 packets a day, but... looks like a 
bug to me.

eris:~# iptables -V
iptables v1.3.6

debian etch:
eris:~# uname -a
Linux eris 2.6.18-6-686 #1 SMP Mon Oct 13 16:13:09 UTC 2008 i686 GNU/Linux


Also the man page says:
 A rule using this extension will match until this limit is  reached  
(unless  the  `!' flag is used).

well...:

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit ! --limit 
3/s -j LOG
iptables v1.3.6: limit does not support invert
Try `iptables -h' or 'iptables --help' for more information.
eris:~#

eris:~# iptables -A INPUT -i eth2 -s 123.123.123.123 -m limit --limit ! 
3/s -j LOG
iptables v1.3.6: limit does not support invert
Try `iptables -h' or 'iptables --help' for more information.
eris:~#

Either the man page, or the program is wrong. Or does the man page refer 
to negating any other value in the rule? I could not think about 
anything reverting the limit match.

Please correct me if i'm wrong!
If this should be bug reported, what would I need to do?
Maybe this is fixed in newer releases of iptables. I don't know.

Good day

Mart


