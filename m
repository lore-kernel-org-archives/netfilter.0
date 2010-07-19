From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: question about esp and policy matching rule
Date: Mon, 19 Jul 2010 18:06:48 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007191806160.19191@obet.zrqbmnf.qr>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com> <alpine.LSU.2.01.1007191343430.13813@obet.zrqbmnf.qr> <OFA20E39F9.A75137E1-ON85257765.004A2DB2-86257765.004A90D4@us.ibm.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <OFA20E39F9.A75137E1-ON85257765.004A2DB2-86257765.004A90D4@us.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knight <rjknight@us.ibm.com>
Cc: netfilter@vger.kernel.org

On Monday 2010-07-19 15:34, Richard Knight wrote:
>>
>> Yes; -m policy applies to the in-tunnel packets only.
>
>Ah, thanks. so for instance to block telnet through my tunnel I could add a
>rule like this
>
>$IP6_TABLES -I INPUT  1 -i $EXIF -p tcp --destination-port 23 -m policy
>--dir in --pol ipsec -j REJECT

For something as evil^W insecure as telnet, I'd drop the -m policy 
portion and just always block it, tunneled or not :-)
