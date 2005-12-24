From: "Dave Beach" <drbeach@rogers.com>
Subject: RE: Networking question
Date: Sat, 24 Dec 2005 15:00:23 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAkXeKJZCCWEyVwObovQgKIAEAAAAA@rogers.com>
References: <65aa6af90512241117m3838db30g29c4795cac0d90c0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90512241117m3838db30g29c4795cac0d90c0@mail.gmail.com>
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
To: 'Edmundo Carmona' <eantoranz@gmail.com>
Cc: netfilter@lists.netfilter.org

I don't have iptables configured to pass ICMP traffic through the firewall,
other than specifically to the inside interface of the router. I can ping
that, and all internal hosts.

========
C:\>ipconfig /all

Windows IP Configuration

        Host Name . . . . . . . . . . . . : xxxxxxxx
        Primary Dns Suffix  . . . . . . . :
        Node Type . . . . . . . . . . . . : Unknown
        IP Routing Enabled. . . . . . . . : No
        WINS Proxy Enabled. . . . . . . . : No

Ethernet adapter Local Area Connection:

        Connection-specific DNS Suffix  . :
        Description . . . . . . . . . . . : Realtek RTL8139/810x Family Fast
Ethernet NIC
        Physical Address. . . . . . . . . : 00-50-FC-4F-F1-B7
        Dhcp Enabled. . . . . . . . . . . : Yes
        Autoconfiguration Enabled . . . . : Yes
        IP Address. . . . . . . . . . . . : 192.168.2.98
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 192.168.2.1
        DHCP Server . . . . . . . . . . . : 192.168.2.2
        Lease Obtained. . . . . . . . . . : December 24, 2005 2:36:55 PM
        Lease Expires . . . . . . . . . . : February 22, 2006 2:36:55 PM
========

========
C:\>route print
===========================================================================
Interface List
0x1 ........................... MS TCP Loopback interface
0x2 ...00 50 fc 4f f1 b7 ...... Realtek RTL8139 Family PCI Fast Ethernet NIC
- Packet Scheduler Miniport
===========================================================================
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0      192.168.2.1    192.168.2.98       20
        127.0.0.0        255.0.0.0        127.0.0.1       127.0.0.1       1
      192.168.2.0    255.255.255.0     192.168.2.98    192.168.2.98       20
     192.168.2.98  255.255.255.255        127.0.0.1       127.0.0.1       20
    192.168.2.255  255.255.255.255     192.168.2.98    192.168.2.98       20
        224.0.0.0        240.0.0.0     192.168.2.98    192.168.2.98       20
  255.255.255.255  255.255.255.255     192.168.2.98    192.168.2.98       1
Default Gateway:       192.168.2.1
===========================================================================
Persistent Routes:
  None
========

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Edmundo Carmona
Sent: December 24, 2005 2:18 PM
To: netfilter@lists.netfilter.org
Subject: Re: Networking question

sure.... as long as there's layer three traffic.

Pinging? Pinging hosts in your network? pinging hosts in internet?

What's the output of ipconfig /all and route print? (ugh!!! :-) )

On 12/24/05, Dave Beach <drbeach@rogers.com> wrote:
> Yes, and if it were a DNS problem you'd (sorry, *I'd*) think I'd see 
> DNS-related traffic from the XP box. But... Nothing. At all. Zip. Zilch.
> Nada. No web-related traffic whatsoever originating from the XP box 
> when the proxy settings in IE are de-selected.
>
> -----Original Message-----
> From: Edmundo Carmona [mailto:eantoranz@gmail.com]
> Sent: December 24, 2005 2:06 PM
> To: Dave Beach
> Subject: Re: Networking question
>
> and say... if you ping a host outside of your network, the ping is 
> routed through the GW box?
>
> It could be a DNS problem, because IE will try to resolve a domain 
> name before sending a HTTP request.
>
> On 12/24/05, Dave Beach <drbeach@rogers.com> wrote:
> > Thanks for the reply. The default gateway for the internal network 
> > is the firewall box.
> >
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Edmundo 
> > Carmona
> > Sent: December 24, 2005 1:59 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: Networking question
> >
> > Probably there's no gateway in the XP box setup... or the gateway is 
> > plain wrong.
> >
> > Merry Xorg-mas to everyone around! ;-)
> >
> > On 12/24/05, Dave Beach <drbeach@rogers.com> wrote:
> > >
> > > This is undoubtedly off-topic in oh-so-many ways; I'd be quite 
> > > happy to be redirected to another, more appropriate mailing list 
> > > should someone be so kind as to suggest one.
> > >
> > > Internal, home, private network, WinXP boxen and a Squid proxy, 
> > > connecting through an iptables box to my router and cable modem.
> > > Everything works peachy.
> > >
> > > While trying to poke bittorrent holes through my iptables setup (see?
> > > Some vague evidence of relevance), I encountered problems and 
> > > decided to take the proxy out of the picture. VERY much to my 
> > > surprise, when I reconfigured IE to not use the proxy (and 
> > > configured iptables to allow for a direct connection), I see no 
> > > HTTP traffic whatsoever leaving the XP box destined for the 
> > > firewall. In fact, no TCP traffic either (all traffic analysis 
> > > done with ethereal on the XP box). I can ping to/from the XP box, 
> > > and see THAT via
> ethereal.
> > >
> > > I am considerably confused by this. My presumption was that IE 
> > > would just happily send HTTP traffic directly to the firewall, but 
> > > this is NOT the behaviour I'm seeing.
> > >
> > > I know it's Christmas Eve day, and I was out a bit late last 
> > > night, but there's clearly something VERY obvious I'm missing.
> > >
> > >
> > >
> >
> >
> >
>
>


