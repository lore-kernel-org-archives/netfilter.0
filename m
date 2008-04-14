From: "Peter Boughton" <boughtonp@gmail.com>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 20:39:42 +0100
Message-ID: <5d97c170804141239t1ea0a2c0j6a7f865b508fccb2@mail.gmail.com>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
	 <4801622E.1060407@bofhland.org>
	 <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>
	 <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>
	 <48030D4B.1040204@bofhland.org>
	 <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>
	 <48033984.9060206@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=iRCUk4m5eHsr/Ix8yNg3NyVyScrbFcFRqEJFlX9nfbo=;
        b=sPV0gG8Q5S75jDHR4AXLCx4f9OaAma5cqNg/wpporIb3c9ZAlySYKSy80ZqBhJwkRiJPL2ADgjAgazTlDiuQS3tTUHaBYVM5FMbvaOegtkTeIJmyBDz30x5PuHyn3aziyUHeG325CeRhqQW+rCpUhoeTcwCH/C1DIcHFY5bXIx8=
In-Reply-To: <48033984.9060206@bofhland.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: whiplash <whiplash@bofhland.org>, Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

> > Then again, why not just use the default route [if it fits]?-
> > still needs no extra routes :)
> >
>
>  Because I didn't know if the mentioned linux box was the default gateway
> for the two XP boxes...:)
It is for one, but not the other - can change that if necessary?


I've had to fiddle the IPs to try and get Internet Connection Sharing
(Windows requires 192.168.0.1 be the internet machine), so I've
currently got this:

 - main machine -
ip=192.168.1.2
gateway=192.168.0.1
route add 192.168.0.0 mask 255.255.255.0 192.168.1.10

- internet machine -
ip=192.168.0.1
gateway=192.168.0.10
route add 192.168.1.0 mask 255.255.255.0 192.168.0.10

 - linux machine -
eth0 = 192.168.0.10
eth1 = 192.168.1.10
packet filtering enabled

pinging, ssh, remote desktop all work, but I can't get internet from
the main machine, only the other two.


Aha! I changed the default gateway of my main machine to the linux one
and now I can get online with it again!

Not really sure what it means to change the gateway though - why that
allows it to work online when going direct to the other machine
doesn't?
