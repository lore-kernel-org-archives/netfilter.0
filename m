From: Stefan Keller <sk@open.ch>
Subject: Re: Virtual packet tracer for iptables
Date: Fri, 08 Jun 2012 15:36:49 +0200
Message-ID: <4FD1FFF1.1080604@open.ch>
References: <4FD1E2B1.80801@open.ch> <4FD1E87C.5020004@univ-nantes.fr> <4FD1F102.2010609@open.ch> <4FD1F728.8050107@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD1F728.8050107@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jean-philippe.menil@univ-nantes.fr
Cc: netfilter@vger.kernel.org

> But you do not have to enable TRACE for all your sessions, only
> the informations you are looking for.

Hi,

Yes, that's true, TRACE does not have to be enabled for all sessions.
But with TRACE I rely on real traffic and there is some interaction
necessary to create such traffic (if multiple parties are involved).

The idea I have is a bit the same as with routing. If I want to know
where a packet is routed to, then I use 'ip route get <dst_ip>' and
can even add other information such as incoming interface, source IP
address, FWMARK, etc. to consider my routing policy.
I don't wait or look for traffic that matches my requirements and
check with tcpdump where it is routed to - I ask the system for the
action based on my input.

It would be great to have a similar mechanism with iptables.

Best regards
Stefan Keller

-- 
stefan keller
product manager

open systems ag
raeffelstrasse 29
ch-8045 zurich
t: +41 44 455 74 00
f: +44 44 455 74 01
stefan.keller@open.ch

http://www.open.ch
