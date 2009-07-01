From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: using iptables as a firewall to protect the network
Date: Wed, 1 Jul 2009 09:24:22 +0200
Message-ID: <33be4bb30907010024m28ead301m2e6f49b82e15c11e@mail.gmail.com>
References: <10128ef10906302358w4702e3c3h4a49cd9f47504cd3@mail.gmail.com>
	 <10128ef10907010014o484d66d1o6f712c707e38d835@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9oCOV5YhAYhHLy3S2GbvEKiOuEPJISN9dFIEMYRUN1s=;
        b=JSLcb9kksLmA1XtdR1afPZW1JtCLIg/SGPIN2WU4u9DUhTPf9aZ1TD2QUdJX6d67D/
         9BTFIlYLM5gHTlFEq7We//yhKwITGYI0zD7ZmuE/TZbVL+hdMOFKE/bsNjUCNqKEbnLZ
         xgn08LhtLYhYQS9NMcrfB/cRBRPxu7K5c7ZjE=
In-Reply-To: <10128ef10907010014o484d66d1o6f712c707e38d835@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tzury Bar Yochay <tzury.by@reguluslabs.com>
Cc: netfilter@vger.kernel.org

2009/7/1 Tzury Bar Yochay <tzury.by@reguluslabs.com>:
> hi,
>
> so far I have seen people using the iptables firewall to protect their
> own machine.

You haven't looked very far then. :)

> that is, protect the machine where the iptables runs.
> I wonder if this firewall can be used the same way as firewall
> appliance used that is to be placed in between the Internet link and
> the LAN switch.

Indeed! Make sure to place filtering rules in the FORWARD chain to
make them apply for traffic not destined to the firewall itself.

/Oskar
