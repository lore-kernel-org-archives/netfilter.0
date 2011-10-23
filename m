From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with log which are corrupted and need help with
 hitcount and FORWARD rules
Date: Sun, 23 Oct 2011 14:51:02 +0100
Message-ID: <1319377862.26402.6410.camel@andybev-desktop>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	 <1319289600.26402.6260.camel@andybev-desktop>
	 <CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	 <1319293517.26402.6312.camel@andybev-desktop>
	 <CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
	 <1319297250.26402.6316.camel@andybev-desktop>
	 <CACMGiwb3tXniJNt5vn6nBVqZjy8VUYWQkwg0GV=gVta5qzoaQw@mail.gmail.com>
	 <1319299307.26402.6352.camel@andybev-desktop>
	 <CACMGiwbCxg8a19r-wErFyh-KWDX9tx42GvFo20Pq2zF_Sr9cKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319377858;
	bh=ZdgLeNHss5TV9o8EOYbUB2uezAxDqeX64BnDO4Y279g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=TzEMV5m0pp63859Q+5B5yHNtesHhQBc35ut28TweosMH9QbyrxKjp6qDy+yEa1Ffi
	 kpE+wXueHevxNhkxJku0MOESOMdlXCNLthpPFL3FRtCCVUCvgfGpRomoGmJ9PmkATa
	 8uUBrft97P+lPIeOuyZgFwiH02q2DPtSkN24TvuQ=
In-Reply-To: <CACMGiwbCxg8a19r-wErFyh-KWDX9tx42GvFo20Pq2zF_Sr9cKg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Azerty Ytreza <007liamg007@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-22 at 18:21 +0200, Azerty Ytreza wrote:
> > Hitcount matches when the number of packets is greater than or *equal*,
> > so defining a number of "1" will always match.
> 
> I have try to increase that but it's the same thing.
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> NEW -m recent --update --seconds 600 --hitcount 10 -j DROP
> 
> >
> > Also, hitcount refers to number of packets, so you'll need a rule in
> > there to only apply the DROP to NEW connections, otherwise you'll block
> > a successful connection as soon as that number of packets has been sent.
> 
> Yes, I have modified this rules by removing "NEW" but the port is
> always blocked :(
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> RELATED,ESTABLISHED -j ACCEPT

Can you re-post all the rules please so that we can have a look at them?

> > This website is quite good:
> >
> > http://thiemonagel.de/2006/02/preventing-brute-force-attacks-using-iptables-recent-matching/
> >
> > Although you'll have to change INPUT to FORWARD.
> >
> 
> This website use blacklist and name but it's the same no in my rules ?

"Probably", although I've not looked closely. If you really have written
equivalent rules then it should work okay. If you can re-post all your
rules then we can check.

Andy

P.S. You forgot to copy the list again!


