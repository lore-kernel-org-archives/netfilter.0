From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: =?UTF-8?Q?ipt=5Frecent=3A=20how=20long=20does=20a=20violater=20stay?=
 =?UTF-8?Q?=20in=20the=20bad=20guys=20list=3F?=
Date: Mon, 26 May 2008 19:21:21 +0200
Message-ID: <ff7734792942c4556be2db3610afedd8@localhost>
References: <462705.29117.qm@web37105.mail.mud.yahoo.com> <alpine.LNX.1.10.0805261437050.19084@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805261437050.19084@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Mon, 26 May 2008 14:40:02 +0200 (CEST), Jan Engelhardt

<jengelh@medozas.de> wrote:

> On Thursday 2008-05-22 17:16, Akhil Sharma wrote:

> 

>>Question: in ipt_recent, if a client is added to a hitlist

>>(/proc/net/ipt_recent/hitlist) after having violated a rule of sending

>>over 10 packets in a minute, how long is the entry maintained in the

>>list? Does it ever get removed from the hitlist? Instead, would it just

>>track the last time the packets arrived and never get removed from the

>>hitlist until the PC is rebooted?

> 

> The list keeps a number of timestamps the client last sent a packet (at

> least it seems so); when a new timestamp is added to the head of the

> list, one gets evicted at the tail if the list has already reached

> its maximum length.

> Whether or not a packet subsequently matches the rule depends not on the

> number of timestamp values recorded, but on the parameter you specified

> in your rule (--seconds, etc.).



As a matter of fact, on a local network, you can remove yourself from the

list

by overloading the table with spoof addresses, since by default a table 

remember ip_list_tot=100 ip adresses, and then attempt a new connection

with your own ip :p! It works fine.



---

Franck Joncourt

http://www.debian.org/ - http://smhteam.info/wiki/



