From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: rate limits
Date: Sun, 19 Jan 2014 15:49:16 -0500
Message-ID: <201401191549.17016.neal.p.murphy@alum.wpi.edu>
References: <CAMD-=VLUemcvn4GG6cP9SEyMP4O605s=ZK2-OGDUN=hYd2g9vQ@mail.gmail.com> <20140119040111.GA22074@home>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140119040111.GA22074@home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Saturday, January 18, 2014 11:01:11 PM Phil Oester wrote:
> Yes, don't use -I to insert the limit rules at the very top of the INPUT
> chain.  But if you insist upon doing so, exempt your LAN from the rules
> by adding "-s ! 199.x.x.x/22" to the two recent rules.

Or "! -s 199.x.x.x/22" since 'infix' notation has been removed from recent 
versions of iptables.
