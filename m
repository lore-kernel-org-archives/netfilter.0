From: Eric Leblond <eric@inl.fr>
Subject: Re: How to debug nfmarking
Date: Mon, 15 Nov 2004 21:44:10 +0100
Message-ID: <1100551451.3612.2.camel@coati>
References: <1100540726.2796.23.camel@laserite>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100540726.2796.23.camel@laserite>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Mon, 2004-11-15 at 18:45 +0100, Eduardo Fern=E1ndez wrote:
> Hi all,
>=20
> i'm trying to debug packet marking like this:
>=20
> iptables -t mangle -A PREROUTING -p icmp -j MARK --set-mark 0x1
> (...)
> But I don't know how to check if the packets are really being marked.
> ip_conntrack shows all packets with mark=3D0, and that's not possible.

yes, you need to explicitly save mark with CONNMARK to have the mark
being propagated through the connection.
See http://home.regit.org/connmark.html for details.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL


