From: Bill Hendrickson <wjhendrickson@gmail.com>
Subject: Re: SSH Port Forwarding with iptables
Date: Thu, 1 Oct 2009 11:24:10 -0400
Message-ID: <a0017e7e0910010824x697f1e82h57abe8df7ca68208@mail.gmail.com>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
	 <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com>
	 <4AC4864E.4020404@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=639rHK+ll1tqFJ83zML0V6sizpX7Hg4bqxrh4SjqM3A=;
        b=ughgBnsQheUNi7tGOv6VWz35Ju+MW/4l+doNRTmwo1KTQwowyCt/Vq5jQ/B3nOpIm9
         YS2MHAKd6xXhdFG9AM2Z7UlK2jVvM9ZDUEd52nwhfb7K65h3gVtYKeoJiUH3hl3/mdem
         jDi85cvhY6/kA04mnVKQO/IkO8gBLPli/BPjc=
In-Reply-To: <4AC4864E.4020404@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter list <netfilter@vger.kernel.org>

Hi Pascal,

> Because MASQUERADE replaces the original source address (which the SSH
> server cannot reach due to a missing default or subnet route) with the
> address of the output interface eth1 (which the SSH server can reach).
>
> You don't need SNAT nor masquerade. It hides the real source address
> from the server. You just need to add a proper route on the server so it
> knows how to reach the client address via the router.

Yes, I really should have remembered the default gateway - that's
bitten me before.

> Besides, the SNAT rule proposed by Gaspar could not help because it
> works on the external interface, while the missing route on the server
> requires SNAT/MASQUERADE on the internal interface.

I'll remove that rule and try it out next chance I get - people are
already using the connection.

>>> $IPT -A OUTPUT -o $EXT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> $IPT -A OUTPUT -o $INT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> You don't need all the ACCEPT rules when the default policies are ACCEPT
> and there are no DROP/REJECT rules.

yeah, I set those default ACCEPT policies when I was trouble-shooting,
i need to remove them...

>>> $IPT -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport
>>> $SSH_PORT --sport 1024:65535 -j DNAT --to $SSH_HOST:22
>>> $IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
>>> --dport $SSH_PORT --sport 1024:65535 -m state --state NEW -j ACCEPT
>
> In the FORWARD chain the destination port has already been changed by
> the DNAT rule just like the destination address, so this rule must match
> on destination port 22, not on the original destination port.
>

So you're saying it needs to be this?

$IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
--dport 22 --sport 1024:65535 -m state --state NEW -j ACCEPT

For now, I've actually got it like this (which is working, but I
should lock it down):

-A FORWARD -p tcp -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

thx,
-bill
