From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: tc() not reporting burst values correctly
Date: Wed, 19 Nov 2014 20:40:52 -0500
Message-ID: <201411192040.52284.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Can anyone tell me where the burst values come from, or why they are not 
multiples of 1500? I specify multiples of 1500 in the tc() commands I use. I 
am at a loss....

----
[root@lanner ~]# uname -r
3.4.104
[root@lanner ~]# tc -V
tc utility, iproute2-ss130430
[root@lanner ~]# tc class show dev eth0
class htb 1:1 parent 1:feed rate 30000Kbit ceil 30000Kbit \
   burst 1593b cburst 1593b 
class htb 1:2 parent 1:1 leaf 2: prio 1 rate 3000Kbit ceil 30000Kbit \
   burst 5999b cburst 1593b 
class htb 1:feed root rate 1000Mbit ceil 1000Mbit \
   burst 1375b cburst 1375b 
class htb 1:3 parent 1:1 prio 0 rate 3000Kbit ceil 6000Kbit \
   burst 5999b cburst 1599b 
class htb 1:4 parent 1:1 leaf 4: prio 2 rate 3000Kbit ceil 30000Kbit \
   burst 5999b cburst 1593b 
class htb 1:5 parent 1:1 prio 0 rate 64000bit ceil 128000bit \
   burst 1499b cburst 1600b 
class htb 1:6 parent 1:1 leaf 6: prio 1 rate 3000Kbit ceil 30000Kbit \
   burst 11999b cburst 1593b 
class htb 1:7 parent 1:1 leaf 7: prio 1 rate 3000Kbit ceil 30000Kbit \
   burst 11999b cburst 1593b 
class htb 1:8 parent 1:feed leaf 8: prio 0 rate 970000Kbit ceil 1000Mbit \
   burst 1455b cburst 1375b 
class htb 1:9 parent 1:1 leaf 9: prio 1 rate 3000Kbit ceil 6000Kbit \
   burst 1499b cburst 15000b 
----
