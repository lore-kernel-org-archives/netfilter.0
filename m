From: "Vernon A. Fort" <vfort@provident-solutions.com>
Subject: RE: Access to Internal server via public address
Date: 11 Dec 2003 04:45:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071139556.21440.35.camel@cosby>
References: <189F4CA4494FB344827F2A4FC0020C443906C7@stca437000.common.ecamericas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <189F4CA4494FB344827F2A4FC0020C443906C7@stca437000.common.ecamericas>
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
To: netfilter <netfilter@lists.netfilter.org>

My original reply does not look like it made the list.  I shall try
again :)

  First, I agree with all the responses.  I have been working with
iptables for quite awhile but am no expert.  I got caught up with the (I
just know I'm missing something) scenario - I thought I was just doing
something wrong.  Apparently not!
  I have toyed with the DNS server concept (I knew this was a easy way
around the problem) but never gave it much serious thought until Bill's
response which cleared up a few concepts for me.

  I have gone the direction of an internal dns server to get around this
problem and it s working like a champ!  I do appreciate ALL the input
and clarification.

Again - thanks for the imput!

Vernon Fort
On Wed, 2003-12-10 at 14:36, Hoeschen, Chris wrote:
> Can I ask why you want to access the internal server using the external
> IP address?
> 
> To get around this for myself I setup a internal only DNS server inside
> my network to resolve names to internal IP addresses.  This is separate
> from my externally facing DNS server that is resolving my external IP
> address to the DNS names.  This way all I need to do is access my
> internal server via the DNS name instead of the IP address.
> 
>  
> 
>                                         
> Chris Hoeschen 
> Distributed System Analysts         
> PrimeVest Financial Services                     
> Phone: (320) 656-4035 
> Fax: (320) 656-4088 
> E-Mail: chris.hoeschen@primevest.net
> 
> 
> "Only two things are infinite, the universe and human stupidity, and I'm
> not sure about the former."
>   -- Albert Einstein 
> 
> Hippopotomonstrosesquippedaliophobia is the fear of long words 
> 
> 
> 
> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk] 
> Sent: Wednesday, December 10, 2003 2:26 PM
> To: netfilter
> Subject: Re: Access to Internal server via public address
> 
> 
> On Wednesday 10 December 2003 8:16 pm, William Stearns wrote:
> 
> > Good afternoon, Vernon,
> >
> > On 10 Dec 2003, Vernon A. Fort wrote:
> > > Anyone,
> > >
> > >   The Problem:  I have an alias public address DNAT'ed to and 
> > > internal address - normal and working
> > >
> > >   What i need is to access this server using the PUBLIC address from
> 
> > > an internal workstation.
> 
> > 	If the client box and the internal server in question are on the
> same 
> > cable, you essentially can't do this direcdtly (but read on).
> >
> > 	Picture this as a triangle; the internal machines on the bottom,
> 
> > (client left, server right) and the firewall at the top.  The packets 
> > physically all travel over the same Ethernet segment shared by all 
> > three machines, I'm just demonstrating who's talking to whom.
> 
> Excellent answer, Bill.
> 
> I think this explains a common situation (and a common FAQ) in more
> detail, 
> and with more information, than I've seen before.   Hopefully it is
> clear to 
> a network non-expert as well (I don't use the term newbie here, because
> once 
> you've got DNAT working at all, you've clearly gone beyond that
> stage...)
> 
> Your reply is (IMHO) worthy of a FAQ entry in itself.
> 
> Antony


