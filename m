From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 17:10:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101710.17698.Alistair@nerdnet.ca>
References: <D5C9032B2B09C64EA2409D6214E91AC9051263@asimail2.alphanumeric.com> <20040810205631.797831f1.monk@geotronic.hu> <200408102018.51515.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408102018.51515.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org
Cc: oan@frozentux.net

On August 10, 2004 03:18 pm, Antony Stone wrote:
> On Tuesday 10 August 2004 7:56 pm, Meszaros Gergely wrote:
> > Dear Antony and Jason! Many thanks for the quick response! I'm
> > enthralled.
> >
> > Unfortunately "tcpdump -n -nn -p -i ppp0 icmp" gives nothing (I hope i
> > did it well :)). (what is -nn ? I cannot find that in the manpage.)
> >
> > Are you sure this is a ICMP related problem? I can ping everything very
> > quickly and correctly from the internal net. The things go wrong
> > somewhere during the connections. :-( However you must be right, im not
> > guru.
> >
> >
> > Anthony, my ext interface is the following:
> >
> > ppp0      Link encap:Point-to-Point Protocol
> >           inet addr:xxx.xxx.xxx.xxx  P-t-P:192.168.0.254
> > Mask:255.255.255.255 UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492
> > Metric:1 RX packets:2255 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:3300 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0
> >           RX bytes:133634 (130.5 KiB)  TX bytes:1083394 (1.0 MiB)
> >
> > MTU: 1492.  But I dunno it is bad or good :)
>
> That means you cannot put packets bigger than 1492 bytes down the
> interface.
>
> If you have stupid internal client machines (eg: Windows O/S) which don't
> understand that MTUs between client and server can be less than the local
> subnet, then you will not be able to communicate from those clients without
> changing the MSS (maximum segment size) at the firewall.
>
> > Its less than 1500 bytes, however by only 8. Its bad?
>
> 8 bytes is enough to cause the problem.
>
> > And whats  that clamp-mss-to-mtu thing ? :)
>
> iptables -t mangle -A POSTROUTING -o EXTIF -j TCPMSS --clamp-mss-to-mtu
>
> Regards,
>
	Again Antony -- bang on the money as always Thanks for all your work.


	For the record, I use this rule *always* -- but then I don't deal with really 
large LANs behind the firewall -- anyone care to comment on the affect of 
this in large bandwidth implementations?

	
	Alistair Tonner


	Please note that I have cc: Oskar directly -- if I have done something 
brutally wrong in the below, beat me over the head with a LART and let Oskar 
know I haven't the faintest clue what I'm doing *grin*


	For Oskar Andreasson ---->

	Oskar:

	For iptables-tutorial 6.5 section "Targets Jumps"

	6.5.16 TCPMSS targe

		This target takes the options --clamp-mss-to-mtu or --set-mss (value)
	The objective of this target is to ensure that packets are no larger than a 
	certain MSS (Maximum Segment Size) or (Maximum Transfer Unit - 40 )
	for a specific route.  This is commonly used when firewalling a LAN made up 
	of systems that may not correctly perform Path MTU discovery, or may not be
	recieving ICMP messages that indicate there is an Path MTU problem.  
	It may be advantageous to put rules with this target in the mangle
	POSTROUTING table, with filters to specific output devices i.e.

	iptables -A POSTROUTING -t mangle -o ${EXTERNAL_INTERFACE} -j TCPMSS  \ 
--clamp-mss-to-pmtu

	in order to ensure that your client connection(s) packet(s) will always
	fit in the MTU of the device which they go out to the internet through.

	when used:

	iptables -A POSTROUTING -t mangle -o ${ANY_DEVICE} -j TCPMSS \
--set-mss 596

	it will lock the Maximum Segment Size for that device.  This is useful when 
tunneling TCP/IP through other protocols where the frame size may be smaller 
or larger than 1500 bytes.  Please note that MSS is not the packet size, but 
rather MTU - 40 bytes.
	
	This cures the problems that many folks have had with DSL (typical MTU of DSL 
connections is 1492 -- 1500 byte ethernet frame - 8 byte ppp packet header.)  
If your connections through the firewall start normally but hang abruptly 
without returning complete data, you might look into this feature. 


	

