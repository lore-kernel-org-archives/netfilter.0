From: Andrew Beverley <andy@andybev.com>
Subject: Re: netfilter pecularities
Date: Fri, 25 Mar 2011 18:02:54 +0000
Message-ID: <1301076174.2891.114.camel@andybev>
References: <20110325090527.M18530@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1301076185; bh=n0GDWRQm7nSTy08cCps1noVANruHjf7ZY00n+
	g7/yFk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=MpSlbwbf
	hyRznfam0Nhm9e2fwBcvDc5/Tu60/T8BZwusabn/j2ADHoAj/ZNf99DLGMzOs2XBxDW
	zy0FFhpszXCMeV94v9UDsJy6z8zFRF5kLo1mk/fZBLnjOEwMYkKD8WlIcpDVK8k88tJ
	KqEGTNWw54jt5uulOmonGz7tQk6Ko=
In-Reply-To: <20110325090527.M18530@kdtc.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cc <cc@kdtc.net>
Cc: netfilter@vger.kernel.org

On Fri, 2011-03-25 at 17:05 +0800, cc wrote:
> I have a filter that forwards (via NAT prerouting) SMTP packets
> to my e-mail server behind the firewall.  Here are the
> following rules:
> 
> $IPT -t nat -A PREROUTING -p tcp -i $INET_IF -d $INET_IP \
>            --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP
> $IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
>            --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP
> 
> $IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
>             -s $LAN_NET --dport $SMTP -j DNAT --to $DMZ_EM:$SMTP
> 
> These rules are the only one that has anything to do with
> SMTP port forwarding and it doesn't include SNAT as it's
> obvious from the rules.  If you can bear with me for a bit.
> 
> Now theoretically speaking, if I comment out the above lines,
> NONE of the SMTP traffic will be going anywhere, am I correct?

Well it depends if you've got any other routing set up. Are you sure
that the clients are using the firewall's IP address, and not the IP
address of DMZ_EM? If they are using the latter, and you have ip_forward
enabled, then the packets can be forwarded with no involvement of
iptables.

It would be worth changing the target of the above rules to LOG to see
if the packets are matching them.

Andy


