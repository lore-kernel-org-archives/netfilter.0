From: Drew Leske <dleske@uvic.ca>
Subject: Re: Blocking HTTP source port from an IP
Date: Wed, 24 May 2006 09:49:56 -0700
Message-ID: <44748EB4.2090802@uvic.ca>
References: <426f2b4c0605240918m79243e89g229547a64132510a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426f2b4c0605240918m79243e89g229547a64132510a@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Feris Thia <feris.tia@gmail.com>
Cc: netfilter@lists.netfilter.org

When the Windows box contacts the web server on the Linux box, it comes from
an available port assigned by the operating system--random so far as the
Linux box and iptables are concerned.  On the other hand, the Windows box
(well actually the browser or whatever application) need to know where to go
on the Linux box.

The IP address of the Linux server is like the street address of an
apartment building.  The ports are like the apartment numbers.  The HTTP
port (port 80) is a "well-known port" in that all web servers by default
will answer on that port.  So that's like when all the kids in the
neighbourhood know that the nice old lady in apartment 80 gives out candy.

If you don't want the fat kid from down the street getting any more candy,
you tell the doorman to block him from ringing up the nice old candy lady.
And there's your firewall:

iptables -A INPUT -s fat_kid -p tcp --dport CANDY -j REJECT

Now substitute your Windows box for the fat kid (big stretch, har har) and
HTTP for CANDY:

iptables -A INPUT -s 192.168.0.30 -p tcp --dport HTTP -j REJECT

Hahaha worst analogy ev-ar.  Hope it helps!

By the way, the address of the Windows box would be 192.168.0.30, not
192.168.0.30/24.  The "/24" at the end specifies a network mask, so when you
say 192.168.0.30/24 you're not specifying a single address but a subnet.
Another post suggested you read up on basic networking and I respectfully
recommend you do that, or you're in for a lot of frustration and pain.

The Linux Documentation Project at www.tldp.org has a lot of useful
information.  I'd start with the Guides.  Check out "Introduction to Linux -
A Hands on Guide", which probably has a basic networking intro, then move on
to "The Linux System Administrators' Guide".  Also check out the how-to's.

Drew.




Feris Thia wrote:
> Hi All,
> 
> I'm quite new to iptables and actually.. how it works. I set up
> firewall on a server with IP 192.168.0.40/24 (with an Apache web
> server running) and then I have a windows client with IP
> 192.168.0.30/24 and then I try to block HTTP port request from this
> client using this command :
> 
> iptables -A INPUT -s 192.168.0.30 -p tcp --sport http -j REJECT
> 
> but it fails.... then I try this one :
> 
> iptables -A INPUT -s 192.168.0.30 -p tcp --dport http -j REJECT
> 
> why is it so ?? As my logic say the request come from http port, so I
> specify the -p tcp --sport http, but it doesn't work at all :(
> 
> 

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

