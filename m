From: <iptables@kilsgaard.dk>
Subject: NAT, ports and iptables
Date: Sun, 2 Jun 2002 03:53:34 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000101c209d8$5183e720$6401a8c0@GKXP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


I am quite new to LINUX and Iptables,  i have worked some with FreeBSD
and ipfw, but now i am werry confused by the way iptable handles the
roules.

I hope that some of you can help me.

I have made the script listed below, from pieces found on the internet,
and it also works fine, with NAT and no ports are open out to the
internet.

But can anyone tell men how i can open for ports, so they can bee
accessed from the internet.
	I would like joust to open some ports (80,21,22.).
	And then i would linke to translate a port to an local Ip
address, so i can access a PC on my local LAN from the internet.
Is the rules i have made okay, or is there an better way to doo the
trick.

Is there a place where there is a description of iptables and its
posibilities?

Thanks (and sorry for by bad english)

/Graves Kilsgaard


Here is my script:
--------------------------------------------------------------------
#!/bin/bash

# Variables
FWCMD="/sbin/iptables"
FWSAVE="/sbin/iptables"

OUTIP="***.***.***.***"
OUTEth='eth1'

#Flush all rules
$FWCMD -t nat -F
$FWCMD -F
$FWCMD -X block

#Stopping service
/etc/rc.d/init.d/iptables stop

#Enable nat
$FWCMD -t nat -A POSTROUTING -o $OUTEth -j SNAT --to-source $OUTIP

#Setting rules
$FWCMD -N block
$FWCMD -A INPUT -j block
$FWCMD -A FORWARD -j block
$FWCMD -A block -m state --state RELATED,ESTABLISHED -j ACCEPT
$FWCMD -A block -i ! eth1 -m state --state NEW -j ACCEPT
$FWCMD -A block -j DROP

#Saving rules
/etc/rc.d/init.d/iptables save
#Starting service
/etc/rc.d/init.d/iptables start

--------------------------------------------------------------------



