From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: undefined symbol: lib_dir
Date: Thu, 8 Nov 2012 09:04:22 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211080903540.23481@nerf07.vanv.qr>
References: <alpine.LNX.2.02.1211072223430.2303@bigred.russwhit.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.02.1211072223430.2303@bigred.russwhit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Whitaker <russ@ashlandhome.net>
Cc: netfilter@vger.kernel.org

On Thursday 2012-11-08 07:33, Russell Whitaker wrote:

>
> Hi
>
> iptables -v gives me an error message: undefined symbol lib_dir
>
> Where do I find lib_dir?

Nowhere (it has been removed).
You must have updated some libraries without updating your actual 
binary.

