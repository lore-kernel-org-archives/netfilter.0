From: Tvrtko Ursulin <tvrtko@ursulin.net>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Wed, 9 Jun 2010 23:05:26 +0100
Message-ID: <201006092305.26328.tvrtko@ursulin.net>
References: <201006082203.22238.tvrtko@ursulin.net> <201006091851.27924.tvrtko@ursulin.net> <201006092303.32923.tvrtko@ursulin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201006092303.32923.tvrtko@ursulin.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wednesday 09 Jun 2010 23:03:32 Tvrtko Ursulin wrote:
> Yes I was misunderstanding the results, or to better say I was not
>  thinking!
> 
> :) Point is for "Frag needed" message to go away _AND_ replies starting to
> 
> come back.
> 
> So I tracerouted it and found which hop stops replying to this specific
>  pings. Guess I can either find out whose router is it and see if they want
>  to fix it, or I can setup an explicit route with smaller MTU for
>  problematic web sites I care about.
> 
> Well this was one pretty educational exercise, thanks again for your help!

And I forgot this last point, this does not explain why Windows clients are 
not affected.

Tvrtko
