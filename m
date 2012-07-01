From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 01 Jul 2012 11:46:43 +0100
Message-ID: <4FF02A93.8080603@googlemail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=XnpjoicJd7LDEAvKVCXbwJqQVK4QNLQGQzhfCdNaUjQ=;
        b=ynXGYFbofO13/I7T5G189Sc0hc6V9OpOOO3aVupzbxTpb1xF3W/wYNWeLNPRe5jhwN
         OPgd1sNwDmyjDI2b54dquxD0pH/O4B5xBjsIeOHlO9H/jnX4wjO6/C/S73Kz6fwTv4jb
         +IX7JGX5PnZd3N1VzK5Ne5Hqwvz3pj2O3HJAFXTg3jIqP5tSj140AumaKfO73cNtGfhf
         VX7M4LVnlUDLA20NjQsDQYBlfpmWH2vP5GHBI1/NiwYdkeUJl54vwFAutsLwD6EOmBEv
         1QBjOWC9d/3dy/qRpXMEI/XgReP2LYzvzf9ZD+ycgMAm3HjSbnRTEj5gFvgWpkH6p53M
         JJtQ==
In-Reply-To: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> I have just released ipset 6.13 with a few bugfixes and some new features.
>
> Userspace changes:
>  - Explain in more detail src/dst for hash:net,iface
>   
Assuming this is what you've had in mind (taken from "man ipset"):

The second direction parameter of the set match and
SET target modules corresponds to the incoming/outgoing interface:
src to the incoming one (similar to the -i flag of iptables), while
dst to the outgoing one (similar to the -o flag of iptables). When
the interface is flagged with physdev:, the interface is interpreted
as the incoming/outgoing bridge port.

I think that is plain wrong!

You refer to the incoming interface (interface on which packets arrive) 
as the "source". That cannot be right. To me, it should be a 
"destination", not  "source" as the very definition of a "destination" 
is where something ends, this is where a packet arrives and where the 
journey of the packet "stops" (or where the packet is "destined" to 
arrive anyway). It should definitely not be a "source" as the packet 
does not originate there, nor does it start its journey there.

Similarly for the outgoing interface - this isn't a "destination" 
interface as the packet doesn't arrive there - it is where it starts its 
journey from!

So, I think you should reverse both definitions and match "src" with the 
outgoing interface and "dst" with the incoming interface - exactly the 
opposite of what you have now. Documenting something which was done 
wrong in the first place doesn't make it right.
