From: george <gk@t-t-l.co.uk>
Subject: Re: Filtering in PREROUTING
Date: Thu, 18 Jan 2007 08:46:26 +0000
Message-ID: <1169109987.4789.7.camel@len.t-t-l.co.uk>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
	<web-4020726@bk3.webmaillogin.com> <45AED516.30800@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AED516.30800@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Thanks for the replies guys.

On Wed, 2007-01-17 at 20:01 -0600, Grant Taylor wrote:
> On 01/17/07 16:17, Jorge Davila wrote:
> > Why filter in the mangle table? Internet is wild land. There are many 
> > circunstances: an web browser generating anormal traffic because some 
> > security hole in the web browser has been sucessfully exploited. A host 
> > taken or contamined by a virus. In that circunstances, the tcp/ip 
> > traffice generated can have "illegal" headers or the traffice can be an 
> > attack to some other device in our networks or to a device in remote 
> > network.
> 
> You should really do your filtering in the filter table.  If you are 
> worried about a compromised host sending malicious / malformed traffic 
> out, you should filter in the filter table OUTPUT chain.  For forwarded 
> traffic, use the filter table FORWARD chain.
> 
> As we know, not all packets traverse the nat table thus we can not 
> reliably filter any and all packets there.
> 
> Likewise, the mangle table is used for special purposes in the Linux 
> kernel, namely to mangle or alter a packet in some way, say change the 
> ToS / DifServ fields.

This and other comments about convention read, understood and accepted
but... I still don't know if there are technical reasons why rather than
just convention.

> 
> There is also the fact that a kernel may not even have the mangle table 
> loaded in to the kernel.
> 
> You may know that you have filtered traffic in the mangle table, but 
> what about the guy / gal that replaces you when you are hit by a 
> Greyhound Buss?  Will they know that you were / are filtering in the 
> mangle table?
> 
> I think that some of the filtering match extensions will only work in 
> the filter table, thus you could not use them in the mangle table.

OK

> > Inspecting the packets headers in the mangle table and dropping the 
> > anormal traffic must be another mechanic for the "sanity" of the 
> > protected networks.
> 
> What can you do in mangle that you can not do in filter as far as 
> filtering traffic goes?

My thinking was to have the rules in one place, PREROUTING, rather than
the same ones in both INPUT and FORWARD.  Also drop junk packets as soon
as possible as PREROUTING is the first chain traversed.

> 
> > I hope that my few paragraphs gives you some help to understand why 
> > filter in the mangle table. Of course, you must decide in what chain 
> > inside the mangle put your rules to protect your networks.
> 
> There are ways that work and then there are the proper ways to do 
> things.  I can format an entire raw disk drive.  However, if any one 
> else works on the system and sees that there is not a partition table 
> they may assume that it is ok to use the disk.  Or, I could make a MD 
> device out of an entire disk, but the Linux kernel would not know that 
> the disk is a RAID AutoDetect drive b/c there is no partition table 
> there to tell it such.
> 
> Some times there are reasons to do non standard things for very special 
> reasons, usually very stringent performance reasons.  If you are wanting 
> to filter in the mangle table to prevent the connection tracking system 
> from seeing traffic (if even that will do so), you should consider the 
> raw table, which is used specifically to tell the kernel not to track 
> specific packets.  Oh, by the way, the raw table only has PREROUTING and 
> OUTPUT chains.
> 
> 
> 
> Grant. . . .
> 

Thanks again,
George.


