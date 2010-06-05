From: Tytus Rogalewski <tytanick@gmail.com>
Subject: Re: iptables slows tproxy SQUID with DNAT or REDIRECT
Date: Sat, 5 Jun 2010 22:28:50 +0200
Message-ID: <AANLkTimfV1wq9MP1zINoawNLdDwMNARuMI0Szw6diY1Q@mail.gmail.com>
References: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com> 
	<AANLkTileh4jCV5ILSUcEpcQ0ZZvKqXyOCKwpIhEhkEgG@mail.gmail.com> 
	<o2mqd7-hcr.ln1@chipmunk.wormnet.eu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type;
        bh=GB250imHHe8eZBUHVrZc1hx1eDvbJZidqgl+iJGXfkI=;
        b=Q479g2SYyv7DjRur4LHOZseKknHJ5qhk2jxz+cJ0ZXXh+OJ2LD1Zipl4XHjiVH1j23
         Tk8/P2VRyIV7NTS7h+5tNWz9lTZri5brq3xW3Dy09nd7eG5f1CPBWpq68fgf+iP2okKe
         0qasA7QuOXv+xvYdOYhF9tT0PD+Y/tY7x8jTY=
In-Reply-To: <o2mqd7-hcr.ln1@chipmunk.wormnet.eu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2010/6/5 Alexander Clouter <alex@digriz.org.uk>:
> ...I assume you tried removing all your iptables rules (including
> unloading all the iptables related modules) and configuring a client
> workstation to use squid manually and the problem disappeared?

i assumed that if configuring proxy manually in firefox is working
fine, that it cant be squid issue and it wont be an issue with bad
iptables rules .... hmmmm
isnt that right ? (i guess not :P)
You saw my movie rught ? - it is essential to see this movie, if you
guys didnt please see


-- 
Z pozdrowieniami
Tytus Rogalewski
mail: tytanick{monkey}gmail.com
www.sky-link.net
gg: 210533
skype: tytanick
