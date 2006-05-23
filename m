From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Configuring netfilter for pptp connections
Date: Tue, 23 May 2006 10:24:53 +0200 (CEST)
Message-ID: <53942.193.173.147.3.1148372693.squirrel@webmail.sterenborg.info>
References: <4472499F.2000200@uga.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4472499F.2000200@uga.edu>
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
To: netfilter@lists.netfilter.org

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
> productive.  Everything I can find on the net is very old. Linux kernel=
s 2.2
> and 2.4.  I'm currently running 2.6.12 with iptables 1.2.11.

From this I take it that the PPTP server is not behind a NAT situation. Y=
ou
need to allow both port 1723/tcp and the GRE protocol (proto 47). You als=
o may
need to compile additional Netfilter PPTP modules if they are not include=
d
with your FC3 kernel.


Gr,
Rob



