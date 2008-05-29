From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Problem accessing to Windows Terminal Server in load balancing.
Date: Thu, 29 May 2008 12:17:42 +0200
Message-ID: <1212056262.32319.12.camel@enterprise.ims-firmen.de>
References: <34055.195.55.244.106.1211964862.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <34055.195.55.244.106.1211964862.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm guessing you're using Windows Network Load balancein (NLB)?

NLB relies on all incoming traffic being sent to all the nodes,
the way it does this is by either not sending outgoing ethernet
frames from the cluster MAC address (unicast mode, so that ordinary
switches don't learn its origin and broadcast all the data) or by using
a multicast ethernet address (multicast mode) as the cluster MAC. Either
way you are flooding you L2 broadcast domain with all incoming traffic, 
this is not always a clever idea.

Maybe this creates problems for Linux bridging?

     Regards,
              Thomas

