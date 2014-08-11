From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables with Classify target
Date: Mon, 11 Aug 2014 12:51:04 +0200
Message-ID: <CAOkSjBig5P2E4w=Ty4K_e6vPJR_XghvyrpTnMFSm+fD3Z5+9Uw@mail.gmail.com>
References: <CACjDgAO2_hVx=uRFSrrB5z+sykifWE8bc6i1uRy94NofgDpQ4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=WJujPqGE3cR8erRvOzi9ryxyOqEDsQP71OlR2sGEFbY=;
        b=tgK+1D4/tvNPMojYN7Hs0soJzS92lSuLQgs8WSgevTWbHxBRoh7yB7TZW3M2z/aj/D
         Exr6xrtJiEPOXaj1plYHnmRHrqvYyQ8VZHAMx+Bz81Poa6RniWXDqxtB6/tkYnQHxg24
         xiGTkUNFOO54tj5bD6OpxexWqah/OXXTzcoiZHMInMvBSORlx6QAR18x9ZvjiQGLFxqq
         VNK/f31ww1FcKsI3COtprADVvxpIRLRJ+R1fQNxD0c+Rm4oUfHUzRQPfxM2Zsxi6ih6s
         nLOPlps0qJlYzNiU99AREyl1hX5p5AplsWRC1doagICec6+Yt1J6iQOxQmSIxqxLbKVB
         PZ/A==
In-Reply-To: <CACjDgAO2_hVx=uRFSrrB5z+sykifWE8bc6i1uRy94NofgDpQ4A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Albert K <alberk@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 11 August 2014 12:25, Albert K <alberk@gmail.com> wrote:
> Hi,
>
> I am trying out nftables and at a loss on how to achieve the followin=
g
> iptables systax. I have eth0 and eth1 in bridge mode and classifying
> traffic to a TC classid.   Any help would be appreciated.  Thank you.
>
> iptables -t mangle -A POSTROUTING -p tcp -m multiport --sports
> 80,443,8080 -m physdev --physdev-out eth0 -j CLASSIFY --set-class 1:2
>

We have support in kernel space,

Try something like:

nft add table mangle
nft add chain postrouting {type route hook output priority -150\; }
nft add rule mangle postrouting tcp sport {80,443,8080} meta priority s=
et XXX

It would be nice if you come back to share your experience, and/or
report bugs if any.

regards.

--=20
Arturo Borrero Gonz=C3=A1lez
