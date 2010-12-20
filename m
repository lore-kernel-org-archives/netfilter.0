From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipsets: examples?
Date: Mon, 20 Dec 2010 16:45:36 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012201622001.14191@blackhole.kfki.hu>
References: <201012192237.43878.reuben.m@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201012192237.43878.reuben.m@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reuben Martin <reuben.m@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Sun, 19 Dec 2010, Reuben Martin wrote:

> I'm trying to put together an extension to forward udp packets to an 
> arbritary set of destinations using ipsets. Specifically I want the 
> extension to be able to take either an ipmap or iphash as a set of 
> destinations for the forwarded udp packets. (I'm starting with the 
> rawdnat, stripping out the tcp code, and changing it so that it 
> duplicates the packet as needed for destinations instead of changing the 
> dest address in the origional packet.

I don't really see why you need to embed ipset. Why don't you call it as a 
normal match and use your extension as a target?

> But I'm having a hard time finding code examples of how to use ipsets. 

Have a look at kernel/xt_set.c. That contains the API by which application 
can use the sets.

> How do I take an ipset as an argument for an extension?

You have to use the index of the set, because that's its identifier, and 
must get a reference to it too (ip_set_nfnl_get or 
ip_set_nfnl_get_byindex).

> How do I test the set type to make sure it's an ipmap or iphash?

That is an internal data and not exported to the application. Unneeded 
as well, because the access to the sets is independet from the set type.

> How do I iterate over the set? Is it an array, linked list, etc?

There's no iterators but functions to test, add or delete elements in the 
sets, based on the data in the packet: ip_set_test[|add|del]. Therefore 
the type of the set is indifferent for the application.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
