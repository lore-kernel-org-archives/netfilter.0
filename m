From: "Alexis" <alexis@attla.net.ar>
Subject: Re: Help: Iptables rules
Date: Thu, 15 Jan 2004 23:04:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c3dbd5$02fb0c70$0200000a@heretic>
References: <OFA9978756.6595C97C-ON88256E1C.007F4A93-88256E1C.007F9D29@statsus.com>
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
To: netfilter@lists.netfilter.org

maybe pptp patch.

if you plan to use all hosts inside the LAN as pptp clients, you will need
this patch

a better aproach is to convert your firewall box as a pptp client, in this
case you could restric who uses the tunnel and a patch is not necesary.

other case could be use a single host in the LAN as client, in this case
forward tcp/1723 and ip/47 (gre) to this host and pptp will work



----- Original Message ----- 
From: "Minh Cao" <caom@statsus.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, January 15, 2004 8:13 PM
Subject: Re: Help: Iptables rules


>
> Most of the net applications are working fine,  web browser, ftp, telnet,
> ssh, ping, Cisco VPN.
> I only have problem with VPN using PPTP protocol.
>
> Please let me know which modules to get pptp to work.
>
> Thanks
> Minh
>
>
>
>
>
>                       Antony Stone
>                       <Antony@Soft-Solutions.c        To:
netfilter@lists.netfilter.org
>                       o.uk>                           cc:
>                       Sent by:                        Subject:  Re: Help:
Iptables rules
>                       netfilter-admin@lists.ne
>                       tfilter.org
>
>
>                       01/15/2004 01:53 PM
>
>
>
>
>
>
> On Thursday 15 January 2004 7:57 pm, Minh Cao wrote:
>
> > > 3. You say the above has not worked - how have you tested it?
> >
> > Yes, I tested
> > I used VPN client, which connected to remote side. After connected, the
> > password authentication is timeout in 2 minutes.
>
> I really would recommend testing the setup with something a lot simpler
> than a
> VPN client :)
>
> For example, a web browser, email, ssh, ftp - something which uses fairly
> standard TCP connections, and is likely to work through NAT.
>
> Depending on what sort of VPN you are trying to use, you may have
> significant
> problems getting it work (but then again you may not - as I say it depends
> what sort of VPN it is).   For example, IPsec ESP (tunnel mode) is not too
> difficult to get working, IPsec AH (transport mode) will not work across
> NAT.
> PPTP requires a special helper module, and there are other sorts of VPN
> about
> which I have no idea.
>
> Start with something easy and work your way up to a VPN gradually.
>
> > > 6. Did the machine work as a simple router before you tried adding
> > > netfilter rules?
> >
> > Two NICs are on different subnet. Can I config as a router w/o using
> > netfilter ?
>
> Er, yes :)   You really should make sure the machine will route packets
> properly before setting up netfilter, which (basically) blocks things.
>
> It sounds as though you might benefit from reading the standard Linux
> Networking HOWTO befoer tackling Oska Andreassen's netfilter tutorial
which
> I
> recommended to you yesterday.
>
> Regards,
>
> Antony.
>
> --
> "Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
> Blaster].   However, these products are no longer supported.   Users of
> these
> products are strongly encouraged to upgrade to later versions."
>
> (which *are* affected by MS Blaster...)
>
> http://www.microsoft.com/security/security_bulletins/ms03-026.asp
>
>                                                      Please reply to the
> list;
>                                                            please don't CC
> me.
>
>
>
>
>
>
>
>
>



