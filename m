From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: RE: TC QoS for different sources/destinations
Date: Mon, 7 Jun 2010 09:26:06 +0100
Message-ID: <117F5E7DA31C17478948DC39E01B948B013BD446@frost.PlumSoftwareLtd.local>
References: <3833.213.228.140.150.1275843887.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <3833.213.228.140.150.1275843887.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jorge Bastos <mysql.jorge@decimal.pt>, netfilter@vger.kernel.org

Hi,

Yes you can. Set up classes for each IP with commands such as:

tc qdisc add dev eth1 root handle 1: htb default 10
tc class add dev eth1 parent 1: classid 1:1 htb rate 1000kbit ceil 1000kbit
tc class add dev eth1 parent 1:1 classid 1:10 htb rate 500kbit ceil 500kbit
tc class add dev eth1 parent 1:1 classid 1:11 htb rate 700kbit ceil 700kbit

Then filter traffic by source IP

tc filter add dev eth1 protocol ip parent 1:0 u32 match ip src 1.1.1.1/32 flowid 1:10
tc filter add dev eth1 protocol ip parent 1:0 u32 match ip src 2.2.2.2/32 flowid 1:11

or use some of the filtering tricks from here:

http://lartc.org/howto/lartc.qdisc.filters.html#LARTC.FILTERING.SIMPLE

More info here:

http://lartc.org/howto/lartc.cookbook.html#LARTC.COOKBOOK.SLA


Note that is outbound traffic only. Inbound traffic you have to do Ingress Policing - search the Advanced Routing Howto - but it is less controllable

http://lartc.org/howto/lartc.adv-filter.policing.html




-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org]On Behalf Of Jorge Bastos
Sent: 06 June 2010 18:05
To: netfilter@vger.kernel.org
Subject: TC QoS for different sources/destinations


Howdy People,

I'd like to know it something like this is possible using TC:

-I'd like to define a rate for download, but for each connection IP/source
(whatever the name is), instead of defining a rate for the interface.
 This way i could guarante a fixed rate for each destination.

Is this possible?

Jorge,

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
