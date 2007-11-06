From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables NAT logging
Date: Tue, 06 Nov 2007 12:07:56 -0600
Message-ID: <4730AD7C.6090302@riverviewtech.net>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net> <4730989C.4020301@bristol.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4730989C.4020301@bristol.ac.uk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/06/07 10:38, Jonathan Gazeley wrote:
> Yes that's correct. Per connection is fine; we just need to know which 
> users were talking to what, when. Logging every packet simply isn't 
> feasible (or useful) on a network that shifts 38TB every single day!

That's a LOT of traffic and will equally be a LOT of logs.

> Yes, knowing when the connection terminates is also useful, otherwise we 
> won't know how long a user is connected to a server for.

That may be more problematic to detect, especially with UDP.  For TCP 
streams that shut down normally, you could watch for the FIN packets and 
log them.  However I'm not sure how to detect the non continuance of a 
UDP stream, much less other protocols.  The only thing that I can think 
of is to watch for the lack of traffic for a specific amount of time and 
presume that the connection is terminated.

I suppose you could augment the connection tracking code to log when it 
expired a tracked connection.  You could at least get the end of a 
connection this way.  However this is probably kernel coding.

> I'll let you know how this goes, although this isn't my highest priority 
> project at the moment so I may not get a chance to play for a few days.

Please do, I'm interested to know fore future projects.

> Thanks a lot for your help.

You are welcome.



Grant. . . .
