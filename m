From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: TFTP Connection Tracking Issue...
Date: Wed, 29 Oct 2003 22:41:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031029224146.43cbe928.netfilter@schuetter.org>
References: <NGNKFNPLIENKNDAA@mailcity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGNKFNPLIENKNDAA@mailcity.com>
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
To: netfilter@lists.netfilter.org

Hallo Gautham,

On Wed, 29 Oct 2003 17:14:11 -0400
"Gautham Thavva" <gautham.thavva@lycos.com> wrote:

>=20
> I have enforced a firewall, using iptables-1.2.6a, on a Redhat 7.2
> host (Kernel version is 2.4.7-10).
>=20
> I have applied the *tftp* patch available in the patch-o-matic. The
> patch has not helped in tracking the TFTP session.
>=20
> The TFTP client sends the Read request to the server. The server sends
> the Data block but there is no acknowledgement from the client.
>=20
> After enabling the debug prints, I have noticed that: 1. the tuple for
> the connection is created 2. enters and exits out of
> *ip_conntrack_expect_related* function 3. through the netfilter hook,
> enters the *resolve_normal_ct* function. It however doesn't find the
> connection tracking tuple. It finds that the incoming packets are
> *related* packets and it accepts that packet.
>=20
> However, the TFTP transfer times out.
>=20
> ----------------
> Later I added a rule specifying the destination port of the tftp
> session and noticed that the *related* packets became *normal* packets
> for that connection.
>=20
> The following is a snippet of the iptable rules for the TFTP protocol:
>=20
> ### TFTP ###
> $IPTABLES -A allowed_udp -p UDP -m state --state RELATED -j ACCEPT
> $IPTABLES -A udp_packets -p UDP -s 0/0 --sport 69 -j allowed_udp

If your server is 5.6.7.8 and the client is 1.2.3.4 the following lines
should be enough after loading the tftp_conntrack module.

$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Just allow tftp to the server, further packages of the
# tftp-session and tftp-data are permitted by the line above.
$iptables -A FORWARD -p UDP -s 1.2.3.4 -d 5.6.7.8 --dport 69 \
    -m state --state NEW -j ACCEPT


Gru=DF
  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


