From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: how to use eficiently  CLASSIFY, MARK, CONNMARK, CONNLIMIT  ?
Date: Sat, 07 Jun 2008 11:01:51 +0200
Message-ID: <484A4E7F.9060206@zensoluciones.com>
References: <4849A942.9030204@zensoluciones.com> <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr> <4849BB1E.7060704@zensoluciones.com> <alpine.LNX.1.10.0806070131140.20733@fbirervta.pbzchgretzou.qr> <484A3918.1080806@zensoluciones.com> <alpine.LNX.1.10.0806070945360.20733@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806070945360.20733@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello


I've build a traffic shapper base on debian lenny with 2.6.24 customised 
kernel.
I'm not sure that the netfilter list is appropiate  for get an answer  
so  I will post this on LARTC mailing list.

I'm searching more information  about CLASSIFY and MARK and CONNMARK. 
I'm not sure to understand everything !

I've got various doubts  :

- What achieve exactly CLASSIFY vs MARK.   Because  seems that  you can 
have   "-j CLASSIFY --set-mark" or  "-j CLASSIFY --set-class"   ? isn't it ?
So What is the exact difference between  CLASSIFY and MARK ?  CLASSIFY 
target  can "classify" and "mark"  and MARK just "mark"  ?

- Should I use CONNMARK  to optimise matching on an heavy loaded traffic 
shapper ?

-  In the example code bellow I've classified VoIP traffic using another 
custom chain  (QOS_out_voip ...)   and p2p directly. Which method give 
best performance ?
Make a jump through another custom chain may slowdown  matching ?  I 
will prefer to use a custom chain  but performance  is the first ...  My 
traffic shapper must
support  90Mbits of bandwith with  20000 packets/s

-  I would like to limit to 4096 P2P connection foreach  IP. Does it 
relevant to use a rule  like this :   ...  --connlimit-mask 32  
--connlimit-above 4096  --jump drop  ?

Please take a look to my example and give me some feedback.


MY SCENARIO

1) My box is setup as transparent bridge as this 


eth0/LAN  -------------------   eth1/WAN
-------------- |   SHAPPER  | -------------
                   -------------------
                            br0

2) I've setup  various HTB qdisc and classes to matches my need :

for eth0 (download)

1:  root
1:10    main
1:100  icmp
1:200  interactive
1:300  voip
1:400  web
1:500  bulk

... and for eth1  (upload)

2: root
2:10 main
2:100 icmp
...


2) I've created two CUSTOM chains  to get  outgoing traffic (egress) of 
each interfaces

IPTABLES=/usr/local/sbin/iptables

${IPTABLES} --table mangle --new QOS_in
${IPTABLES} --table mangle --append POSTROUTING --out-interface br0 --match physdev --physdev-out eth0 --jump QOS_in

...

${IPTABLES} --table mangle --new QOS_out
${IPTABLES} --table mangle --append POSTROUTING --out-interface br0 --match physdev --physdev-out eth1 --jump QOS_out

... 

3) I'm trying to use CONNMARK to

${IPTABLES} --table mangle --append QOS_in --jump CONNMARK --restore-mark
${IPTABLES} --table mangle --append QOS_in --match mark ! --mark 0 -j RETURN

...

#voIP
#(1st way with another custom chain)
 
${IPTABLES} --table mangle --new QOS_out_voip
${IPTABLES} --table mangle --append QOS_out_voip --jump CLASSIFY --set-class 1:300
${IPTABLES} --table mangle --append QOS_out_voip --jump RETURN

${IPTABLES} --table mangle --append QOS_in --match mark --mark 300 --jump QOS_out_voip
${IPTABLES} --table mangle --append QOS_in --match mark --mark 0 --jump MARK --set-mark 300 --match helper --helper sip 
${IPTABLES} --table mangle --append QOS_in --match mark --mark 0 --jump MARK --set-mark 300 --proto tcp --sport 5060 



#p2p 
#(2nd way without use custom chain)

${IPTABLES} --table mangle --append QOS_in --match mark --mark 500 --m connlimit --connlimit-above 4096 --connlimit-mask 32 --jump DROP
${IPTABLES} --table mangle --append QOS_in --match mark --mark 500 --jump CLASSIFY --set-class 1:500
${IPTABLES} --table mangle --append QOS_in --match mark --mark 500 --jump RETURN

${IPTABLES} --table mangle --append QOS_in --match mark --mark 0 --jump MARK --set-mark 500 --match ipp2p --ipp2p
...

${IPTABLES} --table mangle --append QOS_in --jump CONNMARK --save-mark



Thank you for your help 


