From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: RE: NAT and openvpn
Date: Sat, 28 Mar 2009 12:24:51 +0300
Message-ID: <000501c9af87$0f47cfa0$2dd76ee0$@ath.cx>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>	<1238207986.285131659@192.168.1.202> <20090328025132.56657521.g@imagination.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090328025132.56657521.g@imagination.eu.org>
Content-Language: ru
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'G. Skillen'" <g@imagination.eu.org>, jason.faulkner@mailtrust.com
Cc: netfilter@vger.kernel.org

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

SNAT is only valid in POSTROUTING chain, DNAT - in PREROUTING. 

These rules should be:

iptables -t nat -A PREROUTING -d $PUBIP -j DNAT --to-destination $VPNIP		# for incoming traffic
iptables -t nat -A POSTROUTING -s $VPNIP -j SNAT --to-source $PUBIP			# for outgoing traffic

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of G. Skillen
Sent: Saturday, March 28, 2009 5:52 AM
To: jason.faulkner@mailtrust.com
Cc: netfilter@vger.kernel.org
Subject: Re: NAT and openvpn

> % iptables -t nat -A PREROUTING -s $VPNIP -j SNAT --to-source $PUBIP
> % iptables -t nat -A POSTROUTING -s $PUBIP -j DNAT --to-destination $VPNIP 

Thanks for the reply ... when I try that I get:

	mothership:~# iptables -t nat -A PREROUTING -s 10.8.0.2 -j SNAT --to-source <ip omitted>
	iptables: Invalid argument

(same for the next line)

Any ideas?

-- 
G. Skillen <g@imagination.eu.org>
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

