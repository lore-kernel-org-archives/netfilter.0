From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Forward packets from one interface to another?
Date: Tue, 03 Feb 2009 14:13:44 -0800
Message-ID: <4988C198.2030802@mailinator.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com>	<200902031940.09273.Karlis.Repsons@gmail.com>	<49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>	<200902032004.44533.Karlis.Repsons@gmail.com> <Pine.LNX.4.58.0902031205200.13208@bolt.sonic.net> <4988B92D.8040201@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4988B92D.8040201@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rick Jones <rick.jones2@hp.com>
Cc: 'netfilter' <netfilter@vger.kernel.org>

Rick Jones wrote:
> bsilva wrote:
> 
>> You can use either routing/forwarding or bridging for this problem,
> 
> If instead, you further subnettted 192.168.1 with a /25 on the PCs (but 
> still a /24 on the router), the Router/Firewall wouldn't have to know 
> about the other subnet.  It could just blythly ass-u-me that the end-PC 
> was on the same network segment as the middle PC.  So long as the middle 
> PC was configured with a static, public ARP entry for the IP of the end 
> PC, and had ip_forwarding enabled, it would "front" for the end PC.

Hi Rick,

That's a nice tip.

How does the middle PC setup the static, public ARP entry?  Arptables? 
Example?

Very curious about how this is done.

tia,
Mike Wright :m)
