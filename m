From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: udp port 135
Date: 14 Aug 2003 12:12:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060855924.1717.75.camel@kermit>
References: <001201c36225$e166d270$0401000a@sterenborg.info>
	 <3F3B404A.7060400@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3B404A.7060400@belfordhk.com>
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
To: cc <cc@belfordhk.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, 'Netfilter Group' <netfilter@lists.netfilter.org>

Am Don, 2003-08-14 um 09.54 schrieb cc:
> Rob Sterenborg wrote:
> >=20
> > No. I am interested too in why udp shows "open" from a foreign host,
> > while tcp shows filtered.
> > How can I check if an udp port is really closed/filtered or opened ?
>=20
> I'm completely stumped on this issue.
There are three possible responses to an udp probe as nmap sends it:

1. Port is closed. OS hopefully sends an ICMP-Port-Unreachable

2. Port is open. Either the application sends an error via UDP or does
not answer at all

3. Port is filtered. No response since the original packet is dropped.

When you compare 2 and 3, you will see that nmap cannot distinguish
between an open and an filtered port. Thus nmap will mark all (drop)
filtered and open ports as open and will recognize only closed and
rejected ports as closed.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

