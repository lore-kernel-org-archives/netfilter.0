From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: block yahoo messenger
Date: Wed, 26 Feb 2003 12:03:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0860BEE9@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

One of the IM technologies was going through my web proxy.  I had to block a
specific MIME type to shut it of.  I think it was MSN though.

Thanks,
Preston

-----Original Message-----
From: Rob Sterenborg [mailto:rsterenborg@xs4all.nl]
Sent: Wednesday, February 26, 2003 10:51 AM
To: netfilter@lists.netfilter.org
Subject: RE: block yahoo messenger


> I had this same problem and realized that other servers on 
> those nets provided news articles that some of my users 
> wanted to read.  I feel like Corp America should ask Yahoo to 
> publish a list of servers used to support Instant Messaging.  
> Actually MSN and AOL should do the same.

But I don't think they'll give that information. (Well, I didn't try so
I'm not sure..)
Besides, it should be Corp World since I can not imagine that only Corp
America is having this problem... But although that would give a lot of
pressure, it would be even harder to arrange.

AFAIK we don't have the problem because here, normal users can only
browse the web using squid. SNAT is only available for us, admins and
servers :o).
They are using OUTPUT and INPUT chains as squid is running locally.
However, that might go wrong when a messenger is able to use IE's proxy
settings in which case I'd have to block in the other chains too.


Gr,
Rob




