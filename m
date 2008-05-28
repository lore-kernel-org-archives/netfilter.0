From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Fwd: IPTABLES and SAMBA behind NAT
Date: Wed, 28 May 2008 13:52:47 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805281351290.1470@fbirervta.pbzchgretzou.qr>
References: <3f88e2aa0805280226l3a229469lbff78c20cbd3d9f6@mail.gmail.com> <3f88e2aa0805280227y5a88d899n365fa4d6c24d8cb1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3f88e2aa0805280227y5a88d899n365fa4d6c24d8cb1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ad marginem <admarginem@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2008-05-28 11:27, ad marginem wrote:

>Dear experts,
>
>we have a samba server (windows 2k3) behind the linux box (dapper) running NAT.
>
>I am trying to configure iptables port forwarding from external
>network to internal samba server but without success.


"Without success" is quite broad...
speaking of broad, nmb uses broadcasts time and again, which cannot be 
nated.
(Also, you could switch to iptables-restore which is a bit more 
efficient.)
