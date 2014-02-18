From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 16:29:20 -0300
Message-ID: <5303B490.6070606@solutti.com.br>
References: <loom.20140218T183628-993@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=muvIZSHSv4qeEtCMuxeX/tqDfOkNFGUZrWWpDhM861k=;
        b=CeoRKPRChDD4Vq7D9/4xtd8pweoRaKBy9UgIHPhsBGNE554LvGxS5bPSfJO5/iqPP9
         c/9lV2/J8NHEXPWOa4OI3yxJsRGEX1KgPmeidhp7WW93yccegcj6TwCMf4L3ZwtNZip2
         KGO3dbIdxePK6tHqnd3gXH+h+FzE5IHFJ0ks4=
In-Reply-To: <loom.20140218T183628-993@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>

Em 18/02/14 14:53, Mark Fox escreveu:
> I've been waffling over a permissive or restrictive FORWARD chain and=
 have
> realized that my understanding of the implications is lacking. So I'l=
l just
> ask: What are the implications of a permissive FORWARD chain?
>
> My situation is that I am deploying a virtualization/containerization=
 host
> at a facility that has one big network for everything (servers, deskt=
op
> workstations, etc.). There is no DMZ. As one would expect, the networ=
k is
> really chatty.
>
> Traffic has to be forwarded to/from the VM/container host to/from the=
 VMs or
> containers, so a DROP policy on the FORWARD chain means carefully cra=
fting
> rules to allow traffic to be forwarded to the VMs/containers. I have =
no
> issues with that, but it does mean that the future users of the VM/co=
ntainer
> host would have to craft their own rules when they add new VMs/contai=
ners.
>

     There's no right or wrong on how your FORWARD default rule should=20
be. Being DROP or ACCEPT depends on your network security policies.

     Being ACCEPT the default action for FORWARD, your linux router wil=
l=20
forward anything from one side to the other, unless it's explicity=20
DROPped on the rules. Being DROP the default action, everything will be=
=20
dropped, except explicitely ACCEPTed by your rules.

     Which one fullfit you demands ? So that's the right one for you !=20
No one can tell you, giving only the information you wrote, that DROP o=
r=20
ACCEPT is right or wrong. There's really no right or wrong here, there'=
s=20
what fullfilts your demands/needs and what doesnt.



--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



