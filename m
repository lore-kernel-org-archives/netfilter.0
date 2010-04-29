From: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Subject: (Re)injecting extra packets?
Date: Wed, 28 Apr 2010 21:47:53 -0400
Message-ID: <201004282147.53374.morgon.j.kanter@dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Another question...

Let's say I grab a bunch of packets from kernel space. I make some 
modifications to them...but I also want to perhaps insert a packet into the 
end, or even the middle, of the stream (updating the sequence numbers 
appropriately, and the acknowledgment numbers appropriately on the way back). 
Is there a mechanism for then injecting this extra packet into the kernel as 
part of the stream? It seems like nfq_set_verdict() only works on packets 
you've actually stolen, not created.

The only way I see to do this is raw sockets -- and then, it looks like I'm 
probably better off giving a verdict of DROP each time, and sending the entire 
stream of packets out the raw socket anew. Is there a better or cleaner way to 
do this that I'm missing, or is raw sockets the best (or only) way?

Thanks,
-- Morgon
