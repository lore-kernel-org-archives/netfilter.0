From: =?ISO-8859-1?Q?J=F6rg_Esser?= <jackfritt@boh.de>
Subject: Re: Some advice for QoS setup ...
Date: Thu, 09 Jan 2003 09:20:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D30DD.3030608@boh.de>
References: <1042094506.26551.111.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042094506.26551.111.camel@rayw.knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>



Raymond Leach wrote:

>Hi all
>
>Am I going about this in the right way?
>
>This is what I plan to do :
>
>1. Outgoing www traffic originating from our web servers has priority 1
>with min 30% bandwidth and max 60% bandwidth.
>2. Outgoing mail traffic (smtp and pop3) originating from our mail
>servers has priority 2 with min 5% bandwidth and max 20% bandwidth.
>3. Outgoing ftp traffic originating from our ftp servers has priority 3
>with min 5% bandwidth and max 10% bandwidth.
>4. All other traffic has priority 4 with min 0% bandwidth and max 10%
>bandwidth.
>
>I was thinking of using htb and sfq. What should my 'tree that is not a
>tree' look like?
>
>I was also planning to use netfilter iptables to mark the traffic and
>use tc to filter the packets based on the mark (let's say 1,2,3,4
>corresponding to the priorities above).
>
>Any suggestions?
>
>I thought my tree would look something like this:
>
>                              10: (htb)
>                                 |
>                              10:1 (htb)
>                       (rate 512kbps, ceil 512kbps)
>                                 |
>    ________________________________________________________
>   |                  |                  |                  |
>10:10 (htb)        10:20 (htb)        10:30 (htb)        10:40 (htb)
>(rate 153kbps,     (rate 25kbps,      (rate 25kbps,      (rate 0kbps,
> ceil 306kbps)      ceil 102kbps)      ceil 50kbps)       ceil 50kbps)
>   |                  |                  |                  |
>  SFQ                SFQ                SFQ                SFQ
>
>Does my tree look correct? Will this tree honour the priorities I want
>to set? Is netfilter FWMARK the right way to go here?
>
>Regards
>
>Ray
>
Found this in german journal ct.
Maybe you can use it.
You need this:
http://luxik.cdi.cz/~devik/qos/htb/v3/htb3.6-020525.tgz
(The tc binary is needed without the right version it won=B4t work)
Insert all QOS stuff from kernel sources in your kernel.
put this as qos-on script.
-----------------------------------------
#!/bin/sh
#
# Shell-Skript fuer Quality of Service mit HTB
#

EXTIF=3Dppp0
INTIF=3Deth0

############
# Outgoing
############
## Root
tc qdisc add dev $EXTIF root handle 1:0 htb default 12
## Hauptklasse
tc class add dev $EXTIF parent 1:0 classid 1:1 htb rate 125kbit ceil 125kbit
## Klasse fuer ACK
tc class add dev $EXTIF parent 1:1 classid 1:10 htb rate 10kbit ceil=20
125kbit prio 0
## Klasse fuer VPN/SSH
tc class add dev $EXTIF parent 1:1 classid 1:11 htb rate 30kbit ceil=20
125kbit prio 1
## Klasse fuer normalen Traffic
tc class add dev $EXTIF parent 1:1 classid 1:12 htb rate 75kbit ceil=20
125kbit prio 2
## Klasse fuer Bulk
tc class add dev $EXTIF parent 1:1 classid 1:13 htb rate 10kbit ceil=20
100kbit prio 3

# ACKs
#iptables -A OUTPUT -t mangle -o $EXTIF -p tcp -m length --length :64 -j=20
MARK --set-mark 10
# VPN/IPsec
iptables -A POSTROUTING -t mangle -o $EXTIF -p 50 -j MARK --set-mark 11
# SSH
iptables -A POSTROUTING -t mangle -o $EXTIF -p tcp --dport 22 -j MARK=20
--set-mark 11
## lokaler SSH Server auf Port 4444
## iptables -A OUTPUT -t mangle -o $EXTIF -p tcp --sport 4444 -j MARK=20
--set-mark 11
## SMTP
iptables -A POSTROUTING -t mangle -o $EXTIF -p tcp --dport 25 -j MARK=20
--set-mark 13
# eDonkey
iptables -A POSTROUTING -t mangle -o $EXTIF -p tcp --dport 4662 -j MARK=20
--set-mark 13
iptables -A POSTROUTING -t mangle -o $EXTIF -p tcp --sport 4662 -j MARK=20
--set-mark 13

tc filter add dev $EXTIF parent 1:0 prio 0 protocol ip handle 10 fw=20
flowid 1:10
tc filter add dev $EXTIF parent 1:0 prio 0 protocol ip handle 11 fw=20
flowid 1:11
# default: 1:12
tc filter add dev $EXTIF parent 1:0 prio 0 protocol ip handle 13 fw=20
flowid 1:13


###########
# Incoming
###########
tc qdisc add dev $INTIF root handle 2:0 htb default 20
tc class add dev $INTIF parent 2:0 classid 2:2 htb rate 750kbit ceil 750kbit
tc class add dev $INTIF parent 2:2 classid 2:20 htb rate 500kbit ceil=20
700kbit prio 1
tc class add dev $INTIF parent 2:2 classid 2:21 htb rate 150kbit ceil=20
750kbit prio 0
tc class add dev $INTIF parent 2:2 classid 2:22 htb rate 100kbit ceil=20
500kbit prio 3

# ACKs
#iptables -A POSTROUTING -t mangle -o $INTIF -m length --length :200 -j=20
MARK --set-mark 21
# SSH
#iptables -A POSTROUTING -t mangle -o $INTIF -p tcp --sport 22 -j MARK=20
--set-mark 21
# eDonkey
iptables -A POSTROUTING -t mangle -o $INTIF -p tcp --dport 4662 -j MARK=20
--set-mark 22
iptables -A POSTROUTING -t mangle -o $INTIF -p tcp --sport 4662 -j MARK=20
--set-mark 22
# zu drosselnder Rechner
#iptables -A POSTROUTING -t mangle -o $INTIF -d 192.168.111.1 -j MARK=20
--set-mark 22

tc filter add dev $INTIF parent 2:0 prio 0 protocol ip handle 21 fw=20
flowid 2:21
tc filter add dev $INTIF parent 2:0 prio 0 protocol ip handle 22 fw=20
flowid 2:22


#########
# SFQ
#########
tc qdisc add dev $EXTIF parent 1:10 handle 10: sfq perturb 10
tc qdisc add dev $EXTIF parent 1:11 handle 11: sfq perturb 10
tc qdisc add dev $EXTIF parent 1:12 handle 12: sfq perturb 10
tc qdisc add dev $EXTIF parent 1:13 handle 13: sfq perturb 10

tc qdisc add dev $INTIF parent 2:20 handle 20: sfq perturb 10
tc qdisc add dev $INTIF parent 2:21 handle 21: sfq perturb 10
tc qdisc add dev $INTIF parent 2:22 handle 22: sfq perturb 10
-----------------------------------------------------------------------
and this as qos-off script.
-----------------------------------------------------------------
# /bin/sh
EXTIF=3Dppp0
INTIF=3Deth0

iptables -F -t mangle

tc qdisc del dev $EXTIF root    2> /dev/null > /dev/null
tc qdisc del dev $EXTIF ingress 2> /dev/null > /dev/null
tc qdisc del dev $INTIF root    2> /dev/null > /dev/null
tc qdisc del dev lo root      2> /dev/null > /dev/null
 ----------------------------------------------------------------

Have a nice day,

Joerg Esser


