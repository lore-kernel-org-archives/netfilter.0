From: Richard Knight <rjknight@us.ibm.com>
Subject: Re: question about esp and policy matching rule
Date: Mon, 19 Jul 2010 08:34:27 -0500
Message-ID: <OFA20E39F9.A75137E1-ON85257765.004A2DB2-86257765.004A90D4@us.ibm.com>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com> <alpine.LSU.2.01.1007191343430.13813@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007191343430.13813@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



>
> Yes; -m policy applies to the in-tunnel packets only.
>

Ah, thanks. so for instance to block telnet through my tunnel I could add a
rule like this

$IP6_TABLES -I INPUT  1 -i $EXIF -p tcp --destination-port 23 -m policy
--dir in --pol ipsec -j REJECT



