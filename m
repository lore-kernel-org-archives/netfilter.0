From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Configuring netfilter for pptp connections
Date: Tue, 23 May 2006 10:33:13 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C401276A@knowledge.wizdom.nu>
References: <4472499F.2000200@uga.edu>
	<53942.193.173.147.3.1148372693.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

PPTP modules are included in FC3. You just need to load them.
=20
Do realize however, that PPTP/GRE connections are NOT considered safe. =
So it might be better to implement IPSEC, which only uses a single UDP =
port, but is a lot harder to set up in windows.
=20
For PPTP/GRE to work you need to add two rules:
1 for the PPTP connection (TCP Port 1723) and 1 for the GRE Protocol (IP =
proto 47).
=20
If you want your machine to connect to a PPTP server on the Internet, =
allow PPTP OUTBOUND towards that server and GRE INBOUND from that =
server.
If you want a client on the Internet connect to your PPTP server, allow =
both PPTP and GRE INBOUND to your server.
=20
When you search the Internet better include GRE in your search.
=20
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Rob Sterenborg
Sent: Tue 23-May-06 10:24
To: netfilter@lists.netfilter.org
Subject: Re: Configuring netfilter for pptp connections



On Tue, May 23, 2006 01:30, Harold Pritchett wrote:
> Sorry if this is a FAQ.  Searching the archives is very
> difficult.
>
> I have a small LAN, connected to the Internet via a Red
> Hat Fedora Core 3 firewall running netfilter.  I would like
> to run the Microsoft VPN software on a windows machine on this network =
and
> connect to a VPN server located on the Internet side of the firewall.  =
The
> windows server uses NAT to connect to the Internet.
>
> I configured the VPN client while it was directly on the
> Internet, and it works fine.  When I try to connect from
> behind the firewall it fails to connect.
>
> Searching for help on the Internet has not been very
> productive.  Everything I can find on the net is very old. Linux =
kernels 2.2
> and 2.4.  I'm currently running 2.6.12 with iptables 1.2.11.

From this I take it that the PPTP server is not behind a NAT situation. =
You
need to allow both port 1723/tcp and the GRE protocol (proto 47). You =
also may
need to compile additional Netfilter PPTP modules if they are not =
included
with your FC3 kernel.


Gr,
Rob






