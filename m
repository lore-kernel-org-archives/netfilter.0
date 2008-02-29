From: "Marc Franquesa" <marc.franquesa@gmail.com>
Subject: Re: iptables error limit match: invalid size
Date: Fri, 29 Feb 2008 13:58:58 +0100
Message-ID: <5db5e03e0802290458r56b165f1i2ec161d7d3c8edc9@mail.gmail.com>
References: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
	 <20080229081348.GB18864@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=mP3lKC+OPglCKiYclifg+yq5cbHrd+SUuXpgkzezxKA=;
        b=SqGzHpmpvLMQ44QBcpWxsOS0g4GCsJmn0+hnlPaPtRoeA/aEWsglT7a+hVX5uFbo+E8cxUaoKVDdWLGoEYWSxOBd3YEFDi/E6FOeAP0Aymw/QxeT/aJUBTHUDGUpt9LIYYU0SMHLreSePTi8QQOIel9lZc4G3MN34wMHKjJt7Kc=
In-Reply-To: <20080229081348.GB18864@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2008/2/29, Eric Leblond <eric@inl.fr>:

> Could you confirm the kernel version and iptables version you are usi=
ng ?

# iptables --version
iptables v1.3.6
# uname -a
Linux idoru 2.6.18-6-r5k-ip32 #1 Mon Feb 11 15:57:56 GMT 2008 mips64 GN=
U/Linux

> Googling a bit give me this:
>  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D316201

Ok, but this is for Sparc64, I'm using SGI O2 (mips) 32. This link
talk about very old versions of iptables and the reported bugs are 4
years old. =BFDo you belive that's the same bug?

>  Upgrade kernel and iptables to latest versions :/ and report bug to
>  netfilter-devel ML if bug persists.

I'm worry about this:
http://lists.netfilter.org/pipermail/netfilter-devel/2003-November/0130=
22.html

Thanks
