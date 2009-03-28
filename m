From: "G. Skillen" <g@imagination.eu.org>
Subject: Re: NAT and openvpn
Date: Sat, 28 Mar 2009 14:49:51 +0000
Message-ID: <20090328144951.8cca38ee.g@imagination.eu.org>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>
	<1238207986.285131659@192.168.1.202>
	<20090328025132.56657521.g@imagination.eu.org>
	<000501c9af87$0f47cfa0$2dd76ee0$@ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000501c9af87$0f47cfa0$2dd76ee0$@ath.cx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

> These rules should be:
> 
> iptables -t nat -A PREROUTING -d $PUBIP -j DNAT --to-destination $VPNIP		# for incoming traffic
> iptables -t nat -A POSTROUTING -s $VPNIP -j SNAT --to-source $PUBIP			# for outgoing traffic

hi,

these rules get added without any problems, but when i try to connect to connect to the http server i have running locally, it just times out. is there anything i should set up on the local machine?

thanks,

g
