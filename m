From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: does -p udp --dport 5060 not work with -j LOG?
Date: Fri, 2 May 2008 15:34:48 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805021534270.6463@fbirervta.pbzchgretzou.qr>
References: <fvarov$iq2$1@ger.gmane.org>  <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>  <fvdk6f$j6a$1@ger.gmane.org>  <05dd01c8abe6$7a65aa50$5000040a@skathlaptop> <1209689109.6381.20.camel@localhost.localdomain> <fvdpme$vrl$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvdpme$vrl$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean darcy <seandarcy2@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-02 03:10, sean darcy wrote:
>
> Wow. That worked.
>
> I always thought iptables -F flushed all the tables. Is there a command that
> does flush all the tables? Cleans the slate completely?

iptables-restore. It's even faster in applying rules and almost
always preferrable to raw iptables commands.
