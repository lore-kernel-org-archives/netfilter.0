From: "Aaron P. Martinez" <ml@proficuous.com>
Subject: RE: PLEASE HELP with DNAT problem
Date: 31 Oct 2003 10:49:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067618946.12008.15.camel@aaron-rh9-ws.proficuous.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28ACB0@wardrive.citadelcomputer.com.a u>
	 <2751.209.134.141.210.1067578491.squirrel@webmail.proficuous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2751.209.134.141.210.1067578491.squirrel@webmail.proficuous.com>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-10-30 at 23:34, ml@proficuous.com wrote:
> > tcp --dport -d
> >            ^ - Where's the port number?
> >
> > iptables -t nat -A POSTROUTING -s 204.181.247.0/24 -p tcp \
> >     --dport 8001 -d 172.16.0.18 -j SNAT --to-source $NAT_SVR_IP
> >
> > Replace $NAT_SVR_IP with your firewalls IP address being 204.181.247.xxx
> 
> ahhh, hence the confusion...if i'm reading this properly...  there is no
> 204.181.247.xxx address on the internet side of my firewall..the serial0
> interface on my firewall is 209.134.141.xxx.  those 204. addresses are on
> my inside lan.  So i should put the 209.134.141.xxx in for $NAT_SVR_IP?
> 
As i was thinking about this later, i suspected that perhaps you were
talking about just the generic SNAT that has to be on the outgoing
serial0 interface of all traffic coming from the internal lan.  Yes..i
have always had that set up

iptables -t nat POSTROUTING -i eth0 -s 204.181.247.0/24 -o serial0 -j
SNAT --to-source <<serial0_outside_ip>>

> Sorry this is so hard to beat into my skull.

I'm wondering too, if possibly i could avoid this routing issue by
allowing the packets destined for the 172.16.0.16/28 to go out through
the serial0 interface instead of DNATing them to 10.1.1.16/28 so they
would be source natted to the external interface of the firewall, then
coming back they would be correctly routed because they would get
un-SNATed?
> 
> Thanks,
> 
> Aaron
> 
> 
> >
> > Thanks,
> > ____________________________________________
> > George Vieira
> > Systems Manager
> > georgev@citadelcomputer.com.au
> >
> > Citadel Computer Systems Pty Ltd
> > http://www.citadelcomputer.com.au
> >
> > Phone   : +61 2 9955 2644
> > HelpDesk: +61 2 9955 2698
> >
> >
> >> -----Original Message-----
> >> From: ml@proficuous.com [mailto:ml@proficuous.com]
> >> Sent: Friday, 31 October 2003 4:15 PM
> >> To: netfilter@lists.netfilter.org
> >> Cc: George Vieira
> >> Subject: RE: PLEASE HELP with DNAT problem
> >>
> >>
> >> >> Ok. I'm getting there... I'm drawing on a piece of paper
> >> and combinging
> >> >> your emails onto it.. but it still seems you have a SNAT problem..
> >> >>
> >> >> 204.181.247.x/24 ----> 172.16.0.18:8001 --->  DNAT to
> >> 204.181.247.34:80
> >> >>
> >> >> When you DNAT the above, the source still says
> >> 203.181.247.x/24 on it so
> >> >> the DNAT machine which is 204.181.247.34:80 responds
> >> directly back to
> >> >> the
> >> >> source and bypasses the NAT server which then the client
> >> (source) is
> >> >> waiting on 172.16.0.18:8001 to respond but only gets a packets from
> >> >> 204.181.247.34:80 so it drops it..
> >> >>
> >> >> Also, if you can use it.. try using the NETMAP patch..
> >> it'll say you a
> >> >> hell of alot of rules ;)
> >> >>
> >> >> *looks at original email rule list*
> >> >>
> >> >> Looks like you have a split DMZ zone, some ports/ips go
> >> into 1 network,
> >> >> some others go to the other network.. he he man this is
> >> confusing . ha
> >> >> ha
> >> >>
> >> >> I think you really need a SNAT rule like this..
> >> >>
> >> >> iptables -A POSTROUTING -t nat -s 203.181.247.0/24 -d
> >> 172.16.0.18:8001
> >> >> -j
> >> >> SNAT --to <NATSERVERIP>
> >>
> >> iptables -t nat -A POSTROUTING -s 204.181.247.0/24 -p tcp
> >> --dport 8001 -d
> >> 172.16.0.18 -j SNAT --to-source
> >> AND
> >> iptables -t nat -A POSTROUTING -s 204.181.247.0/24:8001 -p
> >> tcp --dport -d
> >> 172.16.0.18 -j SNAT --to-source
> >> AND
> >> iptables -t nat -A POSTROUTING -s 204.181.247.0/24 -d
> >> 172.16.0.18:8001 -j
> >> SNAT --to-source
> >> returns....
> >>
> >> iptables-restore v1.2.5: Unknown arg `--dport'
> >> Try `iptables-restore -h' or 'iptables-restore --help' for
> >> more information.
> >>
> >> are you sure that you can specify destination and source
> >> ports on the SNAT?
> >>
> >> Thanks
> >> >
> >> > so essentially i'd be sending the packet back out to the internet?
> >> > there's no way to just keep it on the lan and in the forward chain?
> >> >
> >> > that's a real drag.
> >> > I'm running RH 2.1 ES and i have downloaded their kernel
> >> source, did a
> >> > make menuconfig (without changing one single thing) i exit
> >> out..save the
> >> > new image.  make dep works...but make modules ALWAYS
> >> bombs... so until i
> >> > can get some time..of which i have none becuause of this, i
> >> doubt i can
> >> > get that patch to work.
> >> >
> >> > Thanks again,
> >> >
> >> > Aaron
> >> >
> >> > P.S.  if i misinterpreted your comments on the SNAT, please
> >> let me know.
> >> >>
> >> >> this way the 204.181.247.34:80 server will respons back via
> >> >> <NATSERVERIP>
> >> >> which eventually renats to 203.181.247.x/24
> >> >>
> >> >> Thanks,
> >> >> ____________________________________________
> >> >> George Vieira
> >> >> Systems Manager
> >> >> georgev@citadelcomputer.com.au
> >> >>
> >> >> Citadel Computer Systems Pty Ltd
> >> >> http://www.citadelcomputer.com.au
> >> >>
> >> >> Phone   : +61 2 9955 2644
> >> >> HelpDesk: +61 2 9955 2698
> >> >>
> >> >>
> >> >>> -----Original Message-----
> >> >>> From: ml@proficuous.com [mailto:ml@proficuous.com]
> >> >>> Sent: Friday, 31 October 2003 3:28 PM
> >> >>> To: George Vieira
> >> >>> Cc: ml@proficuous.com
> >> >>> Subject: RE: PLEASE HELP with DNAT problem
> >> >>>
> >> >>>
> >> >>>
> >> >>> > AARGH!! ASCI ART.. ;P he he... I have 15 networks in my
> >> >>> head and I need a
> >> >>> > 1GB memory upgrade in my brain to fit more.. just 1 GB
> >> will do ;P
> >> >>> >
> >> >>> > I don't understand this part :
> >> >>>
> >> >>> I tried the ascii art, i really did..but UGHHHH..
> >> >>>
> >> >>> let me try to explain it more clearly, and also, the  "it
> >> hits another
> >> >>> one" was just my interpretation...it surely could be wrong.
> >> >>>
> >> >>> as i say the traffic from the internet is getting DNATed
> >> perfectly, so
> >> >>> i'll concentrate on what's NOT working.
> >> >>>
> >> >>> my "protected" lan has the 204.181.247.0/24 addresses this is
> >> >>> eth1...my
> >> >>> DMZ has (actual) 10.1.1.16/28 addresses and that is on
> >> >>> eth0.....now__since
> >> >>> i have 16 public addresses from my ISP, the 172.16.0.16/28
> >> >>> addresses from
> >> >>> the original post...I have to get the traffic from the
> >> >>> internet there and
> >> >>> also the traffic from my lan there for servers.
> >> >>>
> >> >>> I have rules DNATing one to one the 172.16.0.16/28 address to the
> >> >>> 10.1.1.16/28 addresses for incoming connections from
> >> serial0 and eth1.
> >> >>> i.e.
> >> >>>
> >> >>> iptables -t nat -A PREROUTING -i serial0 -d 172.16.0.17 -j DNAT
> >> >>> --to-destination 10.1.1.17
> >> >>> and
> >> >>> iptables -t nat -A PREROUTING -i eth1 -d 172.16.0.17 -j DNAT
> >> >>> --to-destination 10.1.1.17
> >> >>>
> >> >>> both of which seems to work just fine.
> >> >>>
> >> >>> now....before i put these rules however, i put more
> >> >>> "specific" rules with
> >> >>> port assignments.
> >> >>>
> >> >>> i.e.
> >> >>> iptables -t nat -A PREROUTING -i serial0 -d 172.16.0.17
> >> -p tcp --dport
> >> >>> 8021 -j DNAT --to-destination 204.181.247.80:80
> >> >>> and
> >> >>> iptables -t nat -A PREROUTING -i eth1 -d 172.16.0.17 -p tcp
> >> >>> --dport 8021
> >> >>> -j DNAT --to-destination 204.181.247.80:80
> >> >>>
> >> >>> The first one works fine, but the second one which should
> >> >>> essentially tell
> >> >>> the backet to just go right back onto it's local network
> >> to find the
> >> >>> destination, actually ends up connecting to the 172.16.0.17
> >> >>> address...which then the routing is messesd up and i never
> >> >>> see it again.
> >> >>>
> >> >>> i try this:
> >> >>> telnet 172.16.0.18:8001
> >> >>>
> >> >>> here is a tcpdump
> >> >>>  tcpdump -n -i any host 204.181.247.21 and port 8001 -v
> >> -w telnet-in
> >> >>> tcpdump -r telnet-in
> >> >>>
> >> >>> 22:10:22.073457 204.181.247.21.1602 > 204.181.247.80.http: S
> >> >>> 1454746041:1454746041(0) win 5840 <mss
> >> 1460,sackOK,timestamp 4064028
> >> >>> 0,nop,wscale 0> (DF) [tos
> >> >>> 0x10]
> >> >>> 22:10:25.069786 204.181.247.21.1602 > 204.181.247.80.http: S
> >> >>> 1454746041:1454746041(0) win 5840 <mss
> >> 1460,sackOK,timestamp 4064328
> >> >>> 0,nop,wscale 0> (DF) [tos
> >> >>> 0x10]
> >> >>> 22:10:31.069457 204.181.247.21.1602 > 204.181.247.80.http: S
> >> >>> 1454746041:1454746041(0) win 5840 <mss
> >> 1460,sackOK,timestamp 4064928
> >> >>> 0,nop,wscale 0> (DF) [tos
> >> >>> 0x10]
> >> >>> 22:10:43.068733 204.181.247.21.1602 > 204.181.247.80.http: S
> >> >>> 1454746041:1454746041(0) win 5840 <mss
> >> 1460,sackOK,timestamp 4066128
> >> >>> 0,nop,wscale 0> (DF) [tos
> >> >>> 0x10]
> >> >>>
> >> >>>
> >> >>> Thanks,
> >> >>>
> >> >>> Aaron
> >> >>>
> >> >>> >
> >> >>> >> after the first DNAT
> >> >>> >> rule that DNATS it back to the lan, it hits "another one" one
> >> >>> >> that the DNATs it to the DMZ,
> >> >>> >
> >> >>> > Once you DNAT, it won't pass any more DNAT rules and exits
> >> >>> the chain?? Or
> >> >>> > did I misunderstood it AGAIN.. *reads original mail again* ;)
> >> >>> >
> >> >>> > Thanks,
> >> >>> > ____________________________________________
> >> >>> > George Vieira
> >> >>> >
> >> >>> >
> >> >>> >> -----Original Message-----
> >> >>> >> From: ml@proficuous.com [mailto:ml@proficuous.com]
> >> >>> >> Sent: Friday, 31 October 2003 2:03 PM
> >> >>> >> To: George Vieira
> >> >>> >> Cc: ml@proficuous.com; netfilter@lists.netfilter.org
> >> >>> >> Subject: RE: PLEASE HELP with DNAT problem
> >> >>> >>
> >> >>> >>
> >> >>> >> >> I tried to DNAT the lan back
> >> >>> >> >> to itself and
> >> >>> >> >> it just isn't working..
> >> >>> >> >
> >> >>> >> > If I think I know what your trying to do, you are doing
> >> >>> a LAN to LAN
> >> >>> >> > connection right?
> >> >>> >> >
> >> >>> >> > Don't forget that a LAN to LAN DNAT also must have a
> >> >>> >> POSTROUTING SNAT rule
> >> >>> >> > so the destination server replies back via the
> >> >>> firewall/NAT server.
> >> >>> >> > otherwise it'll reply directly to the client and the client
> >> >>> >> will drop the
> >> >>> >> > packet immediately.
> >> >>> >> Ok..i guess this is what i'm missing.  I'm not sure where
> >> >>> i should be
> >> >>> >> source natting to however.
> >> >>> >>
> >> >>> >> the packet starts at lan....destined for
> >> >>> internet...now..it supposedly
> >> >>> >> should get DNATED back to lan..... now like i say..after the
> >> >>> >> first DNAT
> >> >>> >> rule that DNATS it back to the lan, it hits another one one
> >> >>> >> that the DNATs
> >> >>> >> it to the DMZ, but this one doesn't have the port specific
> >> >>> >> information, as
> >> >>> >> normally i'd want it ending up in the DMZ.
> >> >>> >>
> >> >>> >> i just don't see how a SNAT fits in here.  but then that's
> >> >>> >> why i'm asking
> >> >>> >> fr help.
> >> >>> >>
> >> >>> >> Thanks agagin
> >> >>> >> Aaron P. Martinez
> >> >>> >> >
> >> >>> >> > Have you done any tcpdumping or -j LOGing??
> >> >>> >> >
> >> >>> >> > Thanks,
> >> >>> >> > ____________________________________________
> >> >>> >> > George Vieira
> >> >>> >> > Systems Manager
> >> >>> >> > georgev@citadelcomputer.com.au
> >> >>> >> >
> >> >>> >> > Citadel Computer Systems Pty Ltd
> >> >>> >> > http://www.citadelcomputer.com.au
> >> >>> >> >
> >> >>> >> > Phone   : +61 2 9955 2644
> >> >>> >> > HelpDesk: +61 2 9955 2698
> >> >>> >> >
> >> >>> >> >
> >> >>> >> >> -----Original Message-----
> >> >>> >> >> From: ml@proficuous.com [mailto:ml@proficuous.com]
> >> >>> >> >> Sent: Friday, 31 October 2003 1:18 PM
> >> >>> >> >> To: netfilter@lists.netfilter.org
> >> >>> >> >> Subject: PLEASE HELP with DNAT problem
> >> >>> >> >
> >> >>> >>
> >> >>> >>
> >> >>> >
> >> >>>
> >> >>>
> >> >>
> >> >
> >> >
> >> >
> >>
> >>
> >
> 
> 


