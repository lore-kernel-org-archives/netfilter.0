From: Dan Barron <dbarron@ddive.com>
Subject: Re: RTSP & RTP w/ Darwin Thru iptables
Date: Thu, 22 Jul 2004 17:15:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040722165744.0394d0c8@arctictern.ddive.com>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407212150.39176.Antony@Soft-Solutions.co.uk>
 <6.0.0.22.0.20040721171320.03983e78@arctictern.ddive.com>
 <200407221502.41890.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407221502.41890.Alistair@nerdnet.ca>
References: <6.0.0.22.0.20040721132755.037c5bb8@arctictern.ddive.com>
 <200407212150.39176.Antony@Soft-Solutions.co.uk>
 <6.0.0.22.0.20040721171320.03983e78@arctictern.ddive.com>
 <200407221502.41890.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

Thanks for the help - you have helped me get part way to a solution!

The private LAN ip on the Darwin was certainly causing problems - I took it 
of the mix - it was a short term setup to help understand my problem, but 
your advice is well taken - there's a reason the DMZ is separate from the 
LAN, so I'll keep them that way.

After doing that, oddly enough, now my LAN pc can get the streamed media 
using the url that resolves to the public IP, but not someone else out in 
the Internet.  I now have captured a snapshot of the conversation needed 
between the Darwin server and my PC.  BTW, as for the 'hearsay" - I saw no 
control reply on a random port - all setup occurs on the RTSP port, in my 
case 7070.

I'm still trying to wrap my brain around why my LAN works and nothing else.

Dan

At 12:02 PM 7/22/2004, you wrote:
>On July 22, 2004 11:19 am, Dan Barron wrote:
>
>         Please note -- this is somewhat edited for brevity!!!
>
>
> >  >> I have been struggling with setting up my iptables firewall to allow
> >  >> for RTSP & RTP connections to a Darwin Streaming Server.
> > TCP/UDP Ports 554 & 7070 (RTSP) and UDP ports 6790:6999 (RTP) - the way I
> > believe it to work is that the stream is asked for and controlled using the
> > TCP port then the video is streamed over the UDP port.
> >
> >  >> I have a firewall with a public Internet connection and a DMZ and
> >  >> private LAN.  The Darwin server lives on its own server in the DMZ.
>
> > After more configuration tries, I am seeing that the RTSP TCP packets on
> > port 7070 get DNAT'd fine to the Darwin Server - but it never responds back
> > with either a TCP packet or a UDP packet.  To make sure the Darwin Server
> > Linux box allows for Darwin to work properly,  the Darwin server has two
> > eth ports, one on the DMZ, and one on the private LAN, and if I use its
> > private LAN ip addr in quicktime viewer the Darwin server works fine and
> > answers back with streaming media no problems.  So, this tells me that I
> > have a firewall issue of some kind.
> >
>
>         Ummm... Private LAN ip on a DMZ box???  not a good thing .
>         What is the Darwin box's default gateway??, and what
>         IP does it see the connections originating from?
>
>         Can you LOG packets coming off the Darwin box at the
>         firewall in reply to the inbound RTSP requests? ...
>         I'd suggest LOGging both the DMZ ip an LAN ip of
>         the Darwin box *grin*
>
>         At this moment I'd bet that the Darwin box is replying on the
>         LAN side of the network.
>
>
>         Further comments below in the rules:
>
> >
> > (internet) ------ firewall ------ (DMZ) ----- Darwin Server
> >
> >                   (Private LAN)             +- Web Server
> >
> >                     W2K PC
> >
> > Here is my current set of relevant rules.
> >
> > #~~~ Additional udp_packets Chain ~~~
> >
> > $IPTABLES -N udp_packets
> >
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 554 -j ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 7070 -j ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 6970:6999 -j
> > ACCEPT
>         Why do you accept these on the firewall?? you want to route them 
> to the
>         Darwin Box right? --- these should jumped to from FORWARD, not INPUT.
> > #~~~ INPUT Chain ~~~
> >
> > $IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
> > $IPTABLES -A INPUT -p UDP -i $DMZ_IFACE -j udp_packets
> >
> > #~~~ FORWARD Chain ~~~
> >
>
>
>
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \
> >    -d $DMZ_STREAMING --dport 554 -j ACCEPT
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p tcp \
> >    -d $DMZ_STREAMING --dport 7070 -j ACCEPT
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
> >    -d $DMZ_STREAMING --dport 554 -j ACCEPT
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
> >    -d $DMZ_STREAMING --dport 7070 -j ACCEPT
> > $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -p udp \
> >    -d $DMZ_STREAMING --dport 6970:6999 -j ACCEPT
> >
>^^^^    This will NOT allow LAN_IFACE origin packets to make the translation
>         to the DMZ. -- thus testing from your LAN will not work when pointed
>         at the outside IP.
>
>
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 6970:6999 -m state --state NEW -j ACCEPT
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 7070 -m state --state NEW -j ACCEPT
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 554 -m state --state NEW -j ACCEPT
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 6970:6999  -j ACCEPT
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 7070 -j ACCEPT
> > $IPTABLES -A FORWARD -i $DMZ_IFACE -p udp \
> >    --dport 554 -j ACCEPT
> >
>^^^^^Why not allow the Darwin box to reply on *any* port ...
>         At least until you've pinned down the problem? -- I'm
>         not sure but I believe that there is a control reply on a
>         random port before the connection is correctly setup,
>         --- *BUT* that is hearsay... so I might be wrong.
>
>
>
> > #~~~ PREROUTING ~~~
> >
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp \
> >    --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554
> > $IPTABLES -t nat -A PREROUTING --dst $INET_IP -p tcp \
> >    --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp \
> >    --dport 554 -j DNAT --to-destination $DMZ_STREAMING:554
> > $IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \
> >    --dport 7070 -j DNAT --to-destination $DMZ_STREAMING:7070
> > $IPTABLES -t nat -A PREROUTING --dst $INET_IP -p udp \
> >    --dport 6970:6999 -j DNAT \
> >    --to-destination $DMZ_STREAMING:6970-6999
>
>^^^^Again, in respect of LAN connections, this will not mangle any
>         connections from your LAN, since it includes $INET_IFACE.
>
> >>
> > And here's my log rules and what I see when trying to connect via my
> > private LAN pc and the public domain address pointing to my public IP.
> >
>
>         For the time being, log everything from BOTH IP addesses of the
>         Darwin box and keep in mind that if you want to test the Darwin
>         box's functionality from the LAN using the PUBLIC addess, you 
> will need
>         to setup a weird set of rules --
>
>         on the way to the DARWIN box you need to BOTH DNAT and SNAT the
>         connection so that the Darwin box will reply BACK to the firewall 
> for
>         your LAN connection (where the connection will be unDNATted and
>         unSNATted)
>
>         At the moment your Darwin box is NOT going to route the connection
>         back through the firewall for a LAN based client because he can talk
>         DIRECTLY to the LAN client through his own LAN nic.  Thus your client
>         wont see things correctly ... nor will the firewall see the 
> return packets
>         *ever*
>
>         As I said ... a box on both DMZ and LAN is not a good thing *tm*
>
>
>         *grin*
>
>         Alistair Tonner


