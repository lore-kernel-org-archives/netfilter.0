From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnatted interface showing up as FW interface
Date: Thu, 11 Dec 2003 16:53:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111653.18292.Antony@Soft-Solutions.co.uk>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57C06@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57C06@OST_EXCH_USR5>
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

On Thursday 11 December 2003 4:38 pm, Knight, Steve wrote:

> Ah, OK - so I need to do a SNAT rule for JUST that host?

If you want packets from one host to have a specific source address when they 
leave the firewall, and packets from other machines to have a different 
source address, then yes, you need two SNAT rules.

> Never read about DNAT and SNAT - although I did consider it to be a logical
> way of dealing with it...

I highly recommend the tutorials and Howtos listed on the netfilter website.   
Understanding what you're doing and why you're doing it is rather important 
with firewalls - otherwise you might not have the security you think you 
have....

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: 11 December 2003 4.31
> To: netfilter@lists.netfilter.org
> Subject: Re: dnatted interface showing up as FW interface
>
> On Thursday 11 December 2003 4:20 pm, Knight, Steve wrote:
> > Why would an address that DNATs quite happily inbound
> >
> > 217.x.x.138 -> 192.168.1.2
> >
> > show up as the router address when performing outbound traffic - for
> > example when delivering mail it is connecting from 137, instead of 138?
>
> Probably because you have a general-purpose SNAT rule for outbound packets,
> setting the source address on everything to 217.x.x.137?
>
> > Is there a forward rule I've forgotten?  Or do I need to do another DNAT
> > rule translating 192.168.1.2 -> 217.79.119.138?
>
> Change DNAT into SNAT in the above sentence, and yes.
>
> Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


