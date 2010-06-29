From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 14:02:08 -0500
Message-ID: <4C2A4330.5020606@riverviewtech.net>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua> <4C29E8B4.5060205@plouf.fr.eu.org> <4C2A0703.5040007@riverviewtech.net> <alpine.LSU.2.01.1006291902280.1124@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006291902280.1124@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/29/10 12:03, Jan Engelhardt wrote:
> Sure it does just that, seems like a sensible thing. If one bridge 
> port is down, there is no point in keeping a now-stale entry for some 
> MAC address.

Agreed.

The point being that rebooting the external bridge is causing Linux to 
do something that could be solving the problem.  Thus you can't be sure 
that the problem is with the external bridge.



Grant. . . .
