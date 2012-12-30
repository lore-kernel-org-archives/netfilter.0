From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Re: Mirroring traffic with iptables TEE target
Date: Sun, 30 Dec 2012 20:54:44 +0800
Message-ID: <CAJZVxRkB2OzBdWR=H4d8vXC1SFfJWWyW+Uj5ffB14Ud5-d5K5w@mail.gmail.com>
References: <20121230091048.GA4575@devnull.qunarservers.com>
	<alpine.LNX.2.01.1212301224240.30402@nerf07.vanv.qr>
	<CAJZVxRnvbPQfXJRQOLx8tjjP8ee8D6F8Mt=4U8GFBdN_iKCbjA@mail.gmail.com>
	<alpine.LNX.2.01.1212301319030.7798@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=708iX9jmK9v0Sh+fNSKPxRpxikpgWt31sWoShtIVTYw=;
        b=vPPmbgAlZkw0Lj+Of2aSPmVwdp0W1iVc1DNuiz2Kx5pb9Dy+vSp1uLtM/KCg3GyVNX
         xqgsls+nk4F57WZOO6cJYo/Vqj4gU7zW00TMn1xfPFfdU9fj0Skc0F55Vmo3NtxwrCDu
         o6MTCaIcC2qdf8gevQVfy7EMv1yLKSUB6NRyjq8zT6R8r3ZBTvyCDtl7kUsp3fHurCTX
         2u1pGeCAXMQ7EzkMnP4eYiCIqeaRElb15pPpWMiSmohjI4GJun0BXq/Zm9fiPzx2pj4Y
         s4Xf6KeP+TUPpBld4xkZEFH8SEFXFCf07uJIzUM0Kp0n7TixRMC3KQ+2qhDGDLk6mspv
         7wMw==
In-Reply-To: <alpine.LNX.2.01.1212301319030.7798@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hi Jan,

How should the debugging process began?

In wireshark I see no traffic between the two hosts ...

On Host A (That accept the duplicate, IP: 192.168.56.178):
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
--to-destination 192.168.56.178:80

On Host B (The duplicate & forward the connection, IP 192.168.56.39):
iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 80 -j TEE
--gateway 192.168.56.178

And I start nc on both machine,  nc -l 80

Then finally on my machine, I connect to Host B and type come text, it
works on Host B, but no traffic between A & B (vboxnet0 interface),
and direct connection from Host B to Host A works

On Sun, Dec 30, 2012 at 8:19 PM, Jan Engelhardt <jengelh@inai.de> wrote:
>
> On Sunday 2012-12-30 13:13, Aaron Lewis wrote:
>
> >Hi Jan
> >I tried to duplicate UDP packets and that works!
> >
> >So I guess you can't mirror TCP traffics, since it's connection oriented,
> > am
> >I right?
>
> Mirroring does not discriminate against protocol. People successfully
> use it for logging, and I am sure they have TCP as well.




--
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
