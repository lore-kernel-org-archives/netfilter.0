From: Mike <1100100@gmail.com>
Subject: Re: One Nic; Multiple Subnets
Date: Mon, 27 Dec 2004 12:43:54 -0500
Message-ID: <8ca42282041227094371db2497@mail.gmail.com>
References: <41CC19DF.2766.F2FCB6D@localhost>
	<8ca4228204122708388845e28@mail.gmail.com>
	<1104166901.2008.51.camel@localhost>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104166901.2008.51.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

John,

Thanks for the prompt reply.
I'd like not to be weak on the fundamentals so I'll start down the
path by way of your suggested links.
It sounds like the situation would be much less complicated if I could
simply throw another NIC in the routerbox.  An inexpensive mobo,cpu,
and RAM combo. may save alotta headaches in this endeavor.

Best regards.

Mike


On Mon, 27 Dec 2004 12:01:42 -0500, John A. Sullivan III
<jsullivan@opensourcedevelopmentcorp.com> wrote:
> I'm afraid I do not have time to answer in depth today but I'll try to
> point you in the right direction.
> 
> On Mon, 2004-12-27 at 11:38, Mike wrote:
> > I've been looking through the monthly archives of this list, but I
> > can't find the needle in the haystack.  I saw this question answered
> > before, and I'm hoping I'll see it again.  :-)
> >
> > I have an old slackware routerbox that only has room for 2 nics.
> > Right now there are two nics. in it and they are set up like so:
> >
> > eth0 --> Internet (Dynamic IP: Assigned by ISP)
> > eth1 --> Lan  (Gateway Interface:  192.168.1.1)
> >
> > I will soon be joining some computers from another LAN into the one
> > mentioned above.
> > I will need to set up security measures so that the new computers will
> > not be hacked or viewed by the other users on the LAN.
> >
> > Even though I've only got one C-Class subnet (192.168.1.1 - 255), I
> > want to create 2 or more "virtual" subnets to reside in this address
> > range.
> >
> > How do I create the multiple subnets?
> You can break them into distinct subnets with subnet masking and bind
> multiple addresses to the same NIC using iproute2 (the "ip" command).
> > Do I need to use route command or ipsec.?
> > And what would the iptables rule look like, where Subnet "B" rejects
> > all packets coming from Subnet "A"?
> >
> > Is this even close? ---
> > $IPTABLES -t filter FORWARD -A -i eth1 -s 192.168.1.2/150
> > --to-destination 192.168.1.151/253 -j DENY
> You've got the basic idea but both your syntax and your grasp of some
> fundamental issues seems weak.  I would suggest a tour of Oskar
> Andreasson's iptables tutorial (you can find the link on the netfilter
> web site (http://www.netfilter.org).  You can also find some slide shows
> on using iptables and iproute2 in the training section of the ISCS
> network security management project page at http://iscs.sourceforge.net
> You may also want to brush up on subnet masking.
> 
> I apologize that this isn't a cook book solution but it sounds like you
> might be benefited by a little more information besides just the
> recipe.  Good luck - John
> <snip>
> --
> John A. Sullivan III
> Open Source Development Corporation
> Financially sustainable open source development
> http://www.opensourcedevel.com
> 
>

