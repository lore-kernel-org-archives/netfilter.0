From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipsets: examples?
Date: Tue, 21 Dec 2010 10:36:59 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012211032420.15250@blackhole.kfki.hu>
References: <201012192237.43878.reuben.m@gmail.com> <alpine.DEB.2.00.1012201622001.14191@blackhole.kfki.hu> <201012201418.14281.reuben.m@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201012201418.14281.reuben.m@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reuben Martin <reuben.m@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 20 Dec 2010, Reuben Martin wrote:

> On Monday, December 20, 2010, Jozsef Kadlecsik wrote:
> > 
> > On Sun, 19 Dec 2010, Reuben Martin wrote:
> > 
> > > I'm trying to put together an extension to forward udp packets to an 
> > > arbritary set of destinations using ipsets. Specifically I want the 
> > > extension to be able to take either an ipmap or iphash as a set of 
> > > destinations for the forwarded udp packets. (I'm starting with the 
> > > rawdnat, stripping out the tcp code, and changing it so that it 
> > > duplicates the packet as needed for destinations instead of changing the 
> > > dest address in the origional packet.
> > 
> > I don't really see why you need to embed ipset. Why don't you call it as a 
> > normal match and use your extension as a target?
> 
> I think I have misunderstood what can be done with ipsets. I knew you 
> could use it as a match, but for some reason I though it had an API to 
> allow other extensions to use sets as targets. (i.e. my intention is, as 
> you suggested, to use the extension as a target)

But what is the difference between

... -m set --match-set foo src -j YOUR_TARGET

and

... -j YOUR_TARGET

where your target calls internally the same or hardcoded ipset match?
 
> Is there any way via the standard API to request the contents of a named 
> set? That's really what I want to do. Basically for each packet I would 
> request I want to be able to check what addresses are in the set named 
> in the parameters of my extension, and then copy the packets to each of 
> those addresses, and hence have a dynamic list of destination addresses.

In my previous mail I wrote about the current API and possibilities.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
