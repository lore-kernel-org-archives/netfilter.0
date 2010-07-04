From: Andrew Beverley <andy@andybev.com>
Subject: Re: QoS weirdness : HTB accuracy
Date: Sun, 04 Jul 2010 18:50:07 +0100
Message-ID: <1278265807.1506.86.camel@andybev>
References: <067c83163988908ef546d7ff7f560a17@localhost>
	 <4BF32BB0.7010700@redfish-solutions.com>
	 <e6bd0cff8dafc8b3af0760facb5fdc8c@localhost>
	 <1276204948.1403.13.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1278265832; bh=svrmyMV80NHcvM9CxHxMIU/LzHZ+JI0JbP2i4
	EmlAIM=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=Z5J4OqAl
	PN7yIJlRUIWdP10x/exzQqckfbC82DDo3EAdpCCnGPl2oGiH4vP0OYpfiE/HRo1Mt1d
	tWZyyDMgEaKQvKUm6UFODykZOSbtN71PtV3ciqjJL1J4dwh7UPN08JQ50hb4KuyPc/k
	QXfDEnNN513hOD5tecsLTC9Hycqz4=
In-Reply-To: <1276204948.1403.13.camel@andybev>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: "Philip A. Prindeville" <philipp_subx@redfish-solutions.com>, Netdev <netdev@vger.kernel.org>, netfilter <netfilter@vger.kernel.org>

> > I was, in fact, an error in my ruleset. I had put the 'linklayer atm' at
> > both the branch and leaf levels, so the overhead was computed twice,
> > creating those holes in the bandwidth.
> 
> I am seeing similar behaviour with my setup. Am I making the same
> mistake? A subset of my rules is as follows:
> 
> 
> tc qdisc add dev ppp0 root handle 1: htb r2q 1
> 
> tc class add dev ppp0 parent 1: classid 1:1 htb \
>     rate ${DOWNLINK}kbit ceil ${DOWNLINK}kbit \
>     overhead $overhead linklayer atm                   <------- Here
> 
> tc class add dev ppp0 parent 1:1 classid 1:10 htb \
>     rate 612kbit ceil 612kbit prio 0 \
>     overhead $overhead linklayer atm                   <------- And here
> 
> tc qdisc add dev ppp0 parent 1:10 handle 4210: \
>     sfq perturb 10 limit 50
> 
> tc filter add dev ppp0 parent 1:0 protocol ip \
>     prio 10 handle 10 fw flowid 1:10

I removed the overhead option on the first leaf, and the speeds change
to what I expect. However, the rules above are taken straight from the
ADSL Optimizer project, which was the source of the original overhead
patch for tc. So is the ADSL Optimizer project wrong?

Andy


