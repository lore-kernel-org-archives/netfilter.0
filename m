From: Unknown <unknown@unknown.invalid>
Subject: Re: Interaction of Ethereal and iptables?
Date: Mon, 12 Apr 2004 08:46:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7000.79349703646$1081775642@news.gmane.org>
References: <065601c41f87$34f209e0$9701a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <065601c41f87$34f209e0$9701a8c0@office>
Content-Disposition: inline
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
To: Jay Levitt <lists-netfilter@shopwatch.org>, netfilter@lists.netfilter.org

On April 11, 2004 01:38 am, Jay Levitt wrote:
> I'm occasionally seeing lines like the following, always to the same
> machine which is on my internal network:
>
> Apr 11 01:11:52 linux kernel: Rejected output by default:IN= OUT=eth0
> SRC=192.168.1.150 DST=192.168.1.151 LEN=40 TOS=0x00 PREC=0x00 TTL=64
> ID=30662 DF PROTO=TCP SPT=993 DPT=3736 WINDOW=6432 RES=0x00 ACK FIN URGP=0
>
> This corresponds to a LOG and then a DROP rule.  So I set up Ethereal to
> capture the packet trace.  I didn't see the packet there, so I changed the
> DROP to an ACCEPT, assuming that iptables is probably dropping the outbound
> packet before Ethereal (ok, libpcap) can see it.
>
> The weird thing is - even with just a LOG/ACCEPT rule, the packet is STILL
> missing from Ethereal's trace!  All other packets from that time frame are
> there, but this particular one isn't.  Could iptables be imagining it
> somehow?  I'm using libpcap 0.7.2, which was current till a few days ago...
>  I've done an iptables --list OUTPUT and verified that the last item on the
> OUTPUT chain is an ACCEPT of all packets, although the default policy is
> still technically DROP.


	Umm == This packet appears to be outbound from your system ... 
	What service do you have running at port 993? (by default is IMAP + SSL)
	--> what do your IMAP server logs show?
	Are you monitoring *all* traffic on *all* interfaces with ethereal? -- is eth0 your LAN interface
	or your INET interface? -- when I last used ethereal (admittedly the GUI) I was in a 
	siimilar situation when I noted that the missing data was actually on a different interface than
	I was first looking at. --- 
	Also -- are you accepting at the end of the OUTPUT? -- where else are there drop rules in the OUTPUT chain?
	Are they catching this guy?
	Try setting up a LOG rule to catch this packet at the top, and bottom of OUTPUT and slowly move the LOG packet from 
	bottom up to see where it shows up ... then you will know which rule is dropping the packet.

	If iptables is dropping the packet on a connection out from the box -- (someone correct me if I'm wrong)
	it WONT make it OUT the interface in question, thus will not appear on the wire, thus not making an
	appearance to ethereal 

	(ducks the logic arrows)

	Alistair Tonner


>
> Any clues?
>
> Jay Levitt

