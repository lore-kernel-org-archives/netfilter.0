From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to differentiate packets generated locally or received from the network using the NF_IP_PRE_ROUTING filter
Date: Tue, 6 Apr 2004 00:31:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404060031.36959.Antony@Soft-Solutions.co.uk>
References: <2F1FC1DEA077D5119FAD00508BCFD6D20BBB0110@zsc3c030.us.nortel.com>
Reply-To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2F1FC1DEA077D5119FAD00508BCFD6D20BBB0110@zsc3c030.us.nortel.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 05 April 2004 11:02 pm, George Gao wrote:

> Hi there,
>      I'm working on the sample Netfilter driver to put something together
> for a prototype. I ran into a problem which I wish you can help me out.
> When I set my input filter hook number to NF_IP_PRE_ROUTING, I saw local
> generated IP multicast/Broadcast packets and inbound packets from network.
> Is there any way to differentiate a local IP Multicast or IP brocast from
> an inbound mal-formed packet with the exact same content? Thanks much in
> advance!

Um, what do you mean by "malformed"?

The most obvious difference I can think of between a Multicast packet, a 
Broadcast packet, and a "normal" (Unicast) packet is the destination address, 
so is there some reason why you can't use this to distinguish them?

Regards,

Antony.

-- 
"Linux is going to be part of the future. It's going to be like Unix was."

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the list;
                                                           please don't CC me.


