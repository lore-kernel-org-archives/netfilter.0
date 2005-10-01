From: Lore <skizzo82@yahoo.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Sat, 1 Oct 2005 18:18:31 +0200 (CEST)
Message-ID: <20051001161831.75220.qmail@web52810.mail.yahoo.com>
References: <Pine.LNX.4.61.0510010319260.4320@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510010319260.4320@filer.marasystems.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

--- Henrik Nordstrom wrote:

> On Sat, 1 Oct 2005, Lore wrote:
> 
> > I'm facing the problem to understand the
> destination
> > of an OUTGOING tcp packet caught by the chain
> > iptables -t filter -A OUTPUT -j QUEUE
> >
> > The destination address field in the ip header has
> my
> > ip while the real destination is another.
> 
> Are you sure you look at the destination IP and not
> the source IP?
> 
> If unsure send a hex dump of the packet for us to
> ponder at.
> 
> Regards
> Henrik
> 
Hi, At the moment I'm not able to run the program as
root. But what follow is the code that shows me the
wrong IP.
//START OF CODE
--CUT--
ipq_set_mode(QHandle,IPQ_COPY_PACKET,256);
--CUT--
ipq_read(QHandle,pacchetto,256,0);
--CUT--
    pckfiltrato=ipq_get_packet(pacchetto);
    iph=((struct iphdr *)pckfiltrato->payload);
    printf("S_ADDR:%s,D_ADDR:%s\n",
                    inet_ntoa(iph->saddr),
                    inet_ntoa(iph->daddr));
--CUT--
//END OF CODE

As I'm in a Lan trying to connect to one of the
computers at univiersity I should read 
S_ADDR:192.168.0.2,D_ADDR:130.136.4.234

but I read:
S_ADDR:192.168.0.2,D_ADDR:192.168.0.2

I Compared my code with a lot of similar examples on
the net and they all look similar.
because of this I thought it was a feature that could
be switched in iptables.
If it isn't so please, let me know and I'll try to
post the Hex Dump you requested ASAP.

Thank you very much.

Lore


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

