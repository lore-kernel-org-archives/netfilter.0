From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: IPTables routing
Date: 29 Nov 2003 09:38:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070095114.1657.17.camel@kermit>
References: <35733.141.150.249.168.1070044358.squirrel@mail.plobe.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <35733.141.150.249.168.1070044358.squirrel@mail.plobe.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: mailinglist@plobe.com
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-11-28 um 19.32 schrieb mailinglist@plobe.com:
> I have a network which has a gateway wwith iptables on it.  I want
> iptables to send all data bound for a external server (Ex. server.com or
> 20.20.20.20) to a third server (server_mirror.com).  So iptables needs to
> rewrite the header on every packet bound for the intended server
> (server.com) so that the packets get routed to the third server
> (server_mirror.com).
This is easy. You just do DNAT in PREROUTING.

>   Also, the third server and person making the request
> are making a socket connection that sends data two ways.
Is this an additional connection? Which end will initiate the
connection? If it is the client(person) and you know the used ports, it
is easy (see above).
If you do not know the ports and the client initiates the connection, it
is easy but somehow unsafe.
If the server initiates the connection it becomes even more unsafe.
If you do not know the server (any server on the internet) it is
completely unsafe unless you write a conntrack_helper module for
iptables (C-hacking).

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

