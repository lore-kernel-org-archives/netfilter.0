From: Jason Opperisano <opie@817west.com>
Subject: Re: How to debug nfmarking
Date: Mon, 15 Nov 2004 13:03:38 -0500
Message-ID: <1100541817.3591.10.camel@hubcap.ljm.dom>
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

On Mon, 2004-11-15 at 12:45, Eduardo Fern=C3=A1ndez wrote:
> Hi all,
>=20
> i'm trying to debug packet marking like this:
>=20
> iptables -t mangle -A PREROUTING -p icmp -j MARK --set-mark 0x1
> (...)
>=20
> But I don't know how to check if the packets are really being marked.
> ip_conntrack shows all packets with mark=3D0, and that's not possible.
> I've tried logging with netfilter but I don't know which option shows
> the nfmark in the log. Any ideas?
>=20
> Thank you very much in advance.
>=20
> Eduardo

add a log rule that matches on the mark:

  iptables -t mangle -A PREROUTING -p icmp -j MARK --set-mark 1
  iptables -t mangle -A PREROUTING -m mark --mark 1 \
    -j LOG --log-prefix "FW MARK 1: "

-j

--
"Beer. Now there's a temporary solution."
	--The Simpsons


