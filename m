From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Force traffic
Date: Sun, 13 Jun 2010 20:15:16 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006132013330.20055@obet.zrqbmnf.qr>
References: <4C1513F3.5010508@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1513F3.5010508@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Sunday 2010-06-13 19:22, Jonathan Tripathy wrote:

>Hi Everyone,
>
>Does anyone know any rules that I could use (using iptable, ebtables, 
>or otherwise) that could force all traffic coming from an interface to 
>go out via a particular interface?

For link/ether, you have to specify a target to send to. Just interface
won't cut it.

>I am lead to believe that in a linux bridge, all frames are sent to all 
>ports (a bit like the old-school hubs), so it could just be a matter of 
>blocking all traffic, except those which are for the firewall 
>interface, using ebtables.

btw, a bridge/switch is not a hub/electrical repeater by its very definition.
