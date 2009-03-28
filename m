From: "G. Skillen" <g@imagination.eu.org>
Subject: Re: NAT and openvpn
Date: Sat, 28 Mar 2009 02:51:32 +0000
Message-ID: <20090328025132.56657521.g@imagination.eu.org>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>
	<1238207986.285131659@192.168.1.202>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1238207986.285131659@192.168.1.202>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jason.faulkner@mailtrust.com
Cc: netfilter@vger.kernel.org

> % iptables -t nat -A PREROUTING -s $VPNIP -j SNAT --to-source $PUBIP
> % iptables -t nat -A POSTROUTING -s $PUBIP -j DNAT --to-destination $VPNIP 

Thanks for the reply ... when I try that I get:

	mothership:~# iptables -t nat -A PREROUTING -s 10.8.0.2 -j SNAT --to-source <ip omitted>
	iptables: Invalid argument

(same for the next line)

Any ideas?

-- 
G. Skillen <g@imagination.eu.org>
