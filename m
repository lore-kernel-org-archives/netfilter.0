From: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't check out
Date: Tue, 4 Mar 2003 11:26:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <015401c2e273$31980d00$0a02010a@danbeck>
References: <OF3A1E747D.4950DEAF-ON80256CDF.005A4395@start-global.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

Yeah, I actually DNAT and SNAT private addresses to public addresses on the
public interface on the firewall for some of the developers here, so I know
that using that SNAT line *should* work, as it does in practice already.

To answer your questions, here is the interface setup on the firewall.

eth0 -- public interface (207.111.175.64/26) to the external router
(internet) and normal traffic from and to the 129.41.69.128/26 subnet comes
over this wire
eth1 -- private interface to local network using 10.1.2.0/24 address space
tun0 -- a openvpn tunnel between the remote 10.1.1.0/24 network and private
10.1.2.0/24 network

The remote network is a private address space behind a router in the public
129.41.69.128/26 address space.  The eth0 interface does not specifically
listen for traffic from 129.41.69.137, instead it's just the gateway for any
external public traffic incoming to the 207.111.175.64/26 subnet.  There are
also several eth0:N aliases for local private machines that are DNAT/SNAT'ed
to public addresses for different reasons.

I use the following lines to allow all traffic to be forwarded from the
private interface (eth1) and the openvpn tunnel (tun0):
$IPTABLES -A FORWARD -i tun+ -j ACCEPT
$IPTABLES -A FORWARD -i tap+ -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

The line for the tap device isn't really necessary for my setup, but it is
just there in case I decide to fool with bridging.

As far as I can tell, things should be working correctly.  And the funny
thing is that they do, sort of.  Responses to the DNAT'ed traffic initiated
by the client returns over the tunnel, but only part of the response traffic
by the client goes back out.  I.e. I can send very tiny emails, but nothing
large like a reply.  I can download files via ftp, but can not upload.   And
I've confirmed that traffic outgoing from the client is going over the
tunnel.

This is driving me crazy. =)

Daniel Beckham
dealnews.com


----- Original Message -----
From: <richardo@start-global.com>
To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Sent: Tuesday, March 04, 2003 10:32 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't
check out


>
> Hi Daniel.
>
> The second rule you mention below would be correct and needed for these
> connections to work properly, so keep it in there ..... a couple of things
> I thought about, though ..... .did you setup an alias on the firewall
box's
> 'external' network card to listen for packets destined for 129.41.69.137 ?
> ..... as follows :
>
> ifconfig ethWHATEVER:0 129.41.69.137 netmask your.mask.goes.here
>
> ... also, what does your filter table look like, is the FORWARD chain
setup
> correctly to allow the connection through the firewall ?
>
> Regards,
> Richard.
>
> Richard Oatridge
> Head of IT, Start-global Ltd
> http://www.start-global.com
> tel :  +44 1564 779297
> email : richardo@start-global.com
>
>
> |--------+----------------------------------->
> |        |          "Daniel Beckham"         |
> |        |          <danbeck-netfilter@dealne|
> |        |          ws.com>                  |
> |        |          Sent by:                 |
> |        |          netfilter-admin@lists.net|
> |        |          filter.org               |
> |        |                                   |
> |        |                                   |
> |        |          04/03/2003 15:29         |
> |        |                                   |
> |--------+----------------------------------->
>
>---------------------------------------------------------------------------
----------------------------------------------|
>   |
|
>   |       To:     "Netfilter" <netfilter@lists.netfilter.org>
|
>   |       cc:
|
>   |       Subject:     Re: DNAT and VPN Tunnel problems, traffic checks
in, but doesn't check out                           |
>
>---------------------------------------------------------------------------
----------------------------------------------|
>
>
>
>
> Thank you for your help, but I don't really understand what you are trying
> to tell me.  The first config line makes sense and that is similar to what
> I'm doing now.  Although, I'm not using any specific ports because I'm
> testing at the moment.
>
> The second line is confusing though.  Why would I SNAT a 10.1.1.0/24
> address
> to another 10.1.1.0/24 address?  I was thinking you may have meant a
> 10.1.2.0/24 address, but that makes even less sense as that is the client
> trying to connect in the first place.  Also, why would you use a 10.1.1.7
> as
> the -d option, the destination address?  Btw, I tried several combinations
> including your example just for the hell of it, but none of them work. =)
>
> Something that I did not mention before though is that I have tried this:
> iptables -t nat -A POSTROUTING -s 10.1.1.7 -p tcp -j SNAT --to
> 129.41.69.137
>
> I would think this would solve the problem, but this doesn't help.  Anyone
> else have any ideas?
>
> Thank you for your help,
>
> Daniel Beckham
> dealnews.com
>
>
>
> ----- Original Message -----
> From: "Pavan Gokarn" <pavang@techknowledge.ws>
> To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
> Sent: Tuesday, March 04, 2003 12:15 AM
> Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't
> check out
>
>
> > yes daniel you'll need a rule to get the packets back from the remote
> > network back into your network.
> > these will be the rules substitute them eoth you desired ip addresses
> > for outgoing connection
> > # iptables -t nat -A PREROUTING -d 129.41.69.137 -p tcp --dport 25 -j
> > DNAT --to 10.1.1.7
> > for incomming replies
> > # iptables -t nat -A POSTROUTING -d 10.1.1.7 -p tcp --dport 25 -j
> SNAT --to
> > 10.1.1.something
> >
> > remember not to allow all types of connections to in and out because
this
> > might cause a security threat. substitute the 10.1.1.something ip
address
> > with the ip that connects/talks to the 10.1.1.7 address.
> > this might work
> > hope this was helpful
> > regards
> >
> > ----- Original Message -----
> > From: Daniel Beckham <danbeck-netfilter@dealnews.com>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Tuesday, March 04, 2003 3:53 AM
> > Subject: DNAT and VPN Tunnel problems, traffic checks in, but doesn't
> check
> > out
> >
> >
> > > I'm seeing a strange issue with DNAT'ed traffic over a VPN.  Incoming
> > > packets arrive just fine, but outgoing traffic has trouble for large
> > streams
> > > of tcp data.
> > >
> > > My setup is fairly simple.   A group of machines on a private network
> > behind
> > > a gateway/firewall (netfilter) connect through an OpenVPN tunnel to a
> > remote
> > > group of machines on a different private network.
> > >
> > > Local subnet: 10.1.2.0/24
> > > Remote Subnet 10.1.1.0/24
> > >
> > > Client machines on the local subnet can freely talk to servers on the
> > remote
> > > subnet through the vpn with out any problems.
> > >
> > > Until the vpn tunnel was functional, client machines on the local
> private
> > > network connected to mail.dealnews.com to retrieve and send mail, a
> public
> > > interface of the mail server on the remote private network.  Now that
> the
> > > vpn is working, they need to retrieve and send mail using the private
> > > address 10.1.1.7.
> > >
> > > For several reasons, one being laptop administration, I don't want to
> > change
> > > all of the mail client's ip addresses to 10.1.1.7.  I want to use
> iptables
> > > to DNAT packets headed for the public mail address (mail.dealnews.com)
> to
> > > the private mail address 10.1.1.7 so that packets are routed over the
> vpn
> > > instead of the internet.
> > >
> > > This is how I attempted to configure iptables:
> > > iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -p all -j
> > > DNAT --to-destination 10.1.1.7
> > >
> > > The -s option is there so that I can test the config myself without
> > Borking
> > > the rest of the network.
> > >
> > > This seems to work at first as I can see traffic sent from the client
> to
> > > mail.dealnews.com over the tunnel interface on the remote network.
> What
> > > happens though, is although that I can connect to the remote mail
> server
>
> > > just fine through IMAP and even send out a very small email message
> > through
> > > SMTP, large mail messages just stall and fail.  Ftp is the same way.
I
> > can
> > > transfer files from the remote server, but I can not send any sizeable
> > file
> > > to the server.  I know for sure that traffic is traveling over the vpn
> > > tunnel because I'm dumping the tunnel interface up at the remote
> network.
> > > This sounds like something to do with fragmentation or possibly
> something
> > > along that line of thinking, but I can not for the life of me figure
> out
> > > what this is.
> > >
> > > I wondered if possibly, I needed another rule to DNAT packets coming
> from
> > > the remote network over the tunnel back to the public
mail.dealnews.com
> ip
> > > address:
> > > iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p all -j
> > > DNAT --to-destination 129.41.69.137
> > >
> > > But this didn't seem to help anything.
> > >
> > > Could anyone help me figure out how I can work around this?  Again,
> > incoming
> > > traffic through the tunnel seems to work just fine, but outgoing
> traffic
> > > only half seems to work.  As strange as that sounds.
> > >
> > > Thanks,
> > >
> > > Daniel
> > > dealnews.com
> > >
> > >
> > >
> > >
> >
> >
>
>
>
>
>
>
>
>
>





