From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: sip voip traffic forwarding
Date: Mon, 5 Jan 2009 23:04:03 +0100
Message-ID: <20090105230403.6964e0e7@catlap>
References: <1231028358.31327.47.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1231028358.31327.47.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Barry R Cisna <brcisna@eazylivin.net>
Cc: netfilter@vger.kernel.org

>I would need to of course udp 5061, 10000-20000 forward to asterisk
>server from LinTS eth1,eth0?.
>Would someone be good enough to do a ,,1.,,2.,,3. how to accomplish
>this?

I hope I understand your post the way you meant. If so following
iptables rule on TS may do the job:

iptables -t nat -A PREROUTING -d 192.168.1.2 -p udp --dport 5060:5061 \
-j DNAT --to ASTERISK_ADDR

This would allow connections coming from internet to be redirected to
asterisk box. Rules above may not work in the desired way if you
already have some entries in PREROUTING chain or some of the traffic
is filtered.

Regards,
Marek Kierdelewicz
