From: Georgi Alexandrov <g.alexandrov@bgservice.net>
Subject: Re: DHCP and Ident
Date: Mon, 12 Jul 2004 11:36:37 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F24D95.9030402@bgservice.net>
References: <20040710141220.GA22967@itstud.chalmers.se> <200407101551.35291.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407101551.35291.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

>On Saturday 10 July 2004 3:12 pm, Erik Wikstr=F6m wrote:
>
> =20
>
>>Hi
>>
>>I've been thinking for some time now about the rules needed to allow the
>>firewallbox to receive its public IP from a DHCP-server but everywhere I
>>look it's done in different ways.
>>   =20
>>
>
> =20
>
>>But then I realised that since I don't have a source or destination
>>address netfilter will probably not be able to track the connection.
>>   =20
>>
>
>You'll find it (almost?) impossible to use netfilter to control DHCP reque=
sts.
>
>You can do all the usual stuff with follow-up lease renewals and so on, bu=
t as=20
>you already said, before the first DHCP request, you don't have an IP=20
>address, and you're right - the IP stack and netfilter don't do much under=
=20
>those circumstances.
>
>Another way to look at what I'm saying is "you don't have to do anything=20
>special with netfilter to allow your machine to get an address by DHCP", s=
o I=20
>wouldn't worry about it.
>
> =20
>
>>$IPTABLES  -I INPUT -i $LAN_IFACE -p udp --dport 67:68 --sport \
>>	67:68 -j ACCEPT
>>
>>But this opens two ports and the only protocol I know of that uses two
>>ports is FTP, so If someone could give me some hints I'd be happy.
>>   =20
>>
>
>UDP 67 is used by the DHCP server - this is the port the client sends requ=
ests=20
>to, and it's the port the responses (and, often, informational messages on=
ce=20
>you have your lease) come from on the server
>
>UDP 68 is used by the DHCP client - this is the port the client sends requ=
ests=20
>from, and it's the port the response from the server are sent to.
>
>So, if you're running the client end, you only need to allow packets in to=
=20
>port 68 (and they'll be coming from the server's port 67)
>
>RFC2131 is the definitive reference.
>
>Just as a point of information, by the way, I get a DHCP address from my I=
SP=20
>on a cable modem, and I allow the requests out from my firewall, and the=20
>replies back again, but I block any new connections initiated from the=20
>outside (including the ISP).   My logs show a DHCP packet from ISP port 67=
 to=20
>my firewall port 68 about every 20 seconds (the lease time is 86400 second=
s =3D=20
>24 hours).
>
> =20
>
>>I was also wondering if about Ident, today I use it only when connecting
>>to IRC-servers and have port 113 forwarded to the computer running the
>>IRC-client but this solution is not so good if another computer on my
>>network should have a need of Ident. So I was wondering: If I install an
>>Identd on my firewallbox and let it take care of requests would it work,
>>considering that the connection does not origin from the firewallbox?
>>   =20
>>
>
>My experience of most things which want an ident response is that if they =
get=20
>any response at all, they're happy.   It doesn't matter whether it's accur=
ate=20
>or not - they just want some sort of response.
>
>This may depend on the particular IRC server, however, and as always, YMMV.
>
>For some "fake identd" software, see for example:
>
>http://www.guru-group.fi/~too/sw/identd.readme
>http://hangout.de/fakeidentd
>
>And even a trivial Perl script to do it for you:
>
>http://www.bovine.net/~jlawson/coding/fake-identd/identd.txt
>
>Regards,
>
>Antony.
>
> =20
>
About the identd stuff:
If you're DROPing it (or like most cases - default DROP policies), not=20
forwarding it to the clients or not having identd server that will=20
probably cause slow irc connecting. The irc server will wait for some=20
kind of response (any kind in most cases ;-) as -j DROP really drops=20
requests without replying.
So the solution is to forward identd requests to the clients or use=20
something like on the router/gw/fw:
iptables -A INPUT -p tcp --dport 113 -j REJECT
that will return icmp-port-unreachable (or just port-unreachable, not=20
sure) to the server and will resolve the irc issue.

regards,
Georgi Alexandrov


