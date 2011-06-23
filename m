From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables links
Date: Fri, 24 Jun 2011 01:44:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106240143500.20064@frira.zrqbmnf.qr>
References: <4E03BB34.70704@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E03BB34.70704@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Friday 2011-06-24 00:16, Jonathan Tripathy wrote:

> Hi Everyone,
>
> Is there any quick command that I can use with iptables to remove all links to
> a chain, as well as removing the chain itself?

No, -F would clean the chain, and -X would remove them, which are 
currently two separate operations with the iptables(8) frontend.
