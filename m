From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with log which are corrupted and need help with
 hitcount and FORWARD rules
Date: Sat, 22 Oct 2011 14:20:00 +0100
Message-ID: <1319289600.26402.6260.camel@andybev-desktop>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319289598;
	bh=VxASEKIm1a9ZysXF2+4ck7D2DNPT37+aiRQx9lnA4TQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=LUpiosjiOv6tRjote+gxhIa4Z041+q+RLuuROLWRy/HsrtlMwiuJzFJCy+55ikhO8
	 i9Yu7UHxfAhmMVdYNxx5Sv1N00ziQOQbYSJjZRBJAMFJvy0ctTkgiJE0JK4EOcddFb
	 HqUvfANkEK27lTpj5dqy5Kbp7wMlmdeGWTOTLf3I=
In-Reply-To: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Azerty Ytreza <007liamg007@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-22 at 10:43 +0200, Azerty Ytreza wrote:
> I use these rules by the past for limit number of connections during
> some seconds and block connections if they are too many attempt.
> 
> Old rules which work very well :
> ***************************************
> iptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state NEW -m
> recent --set
> iptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state NEW -m
> recent --update --seconds 60 --hitcount 10 -j DROP
> #ptables -A INPUT -i eth1 -p tcp --dport 443 -m state --state
> NEW,ESTABLISHED -j ACCEPT
> ***************************************
> 
> I have adapted this rules for a FORWARD rules and doesn't work :

What exactly are you trying to achieve? If you're changing to a FORWARD
rule then I assume that you are trying to adapt your rules in order to
block connections destined for a remote server, rather than the local
host?

> ***************************************
> iptables -A INPUT -i eth1 -p udp -m udp --dport 443 -m state --state
> NEW -m recent --set
> iptables -A INPUT -i eth1 -p udp -m udp --dport 443 -m recent --update
> --seconds 60 --hitcount 10 -j DROP

Do you really mean UDP?

> iptables -A FORWARD -i eth1 -p udp -m udp --dport 443 -m state --state
> NEW,ESTABLISHED -j ACCEPT

You've got a mixture of INPUT and FORWARD. Is that what you want?
Remember that packets will never transverse both the INPUT and FORWARD
chains.

> iptables -t nat -A PREROUTING -i eth1 -p udp -m udp --dport 443 -j
> DNAT --to-destination 192.168.1.2:443
> ***************************************
> 
> Someone can explain me why these rules doesn't block request when
> hitcount is reached ?
> I have try other method and put "hitcount" on the FORWARD rules
> directly but it's not work, I have an error from iptables which
> doesn't accept "--set" on a FORWARD request. I doesn't remember error
> but it's probably not the good method.
> 


