From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: question about esp and policy matching rule
Date: Mon, 19 Jul 2010 13:44:24 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007191343430.13813@obet.zrqbmnf.qr>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knight <rjknight@us.ibm.com>
Cc: netfilter@vger.kernel.org

On Monday 2010-07-19 05:29, Richard Knight wrote:
>rule ends up below the policy matching rule, will the ESP rule ever be
>checked?

Yes; -m policy applies to the in-tunnel packets only.

># allow all ipsec traffic into and out
>$IP6_TABLES -I INPUT  1 -i $EXIF -p esp -j ACCEPT
>$IP6_TABLES -I OUTPUT 1 -o $EXIF -p esp -j ACCEPT
>$IP6_TABLES -I INPUT  1 -i $EXIF -m policy --dir in  --pol ipsec  -j ACCEPT
>$IP6_TABLES -I OUTPUT 1 -o $EXIF -m policy --dir out --pol ipsec  -j ACCEPT
