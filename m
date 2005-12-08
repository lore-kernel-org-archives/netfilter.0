From: "Eray Aslan" <eray.aslan@caf.com.tr>
Subject: RE: connect to different port
Date: Thu, 8 Dec 2005 15:00:52 +0200
Message-ID: <4FE82EE778704E4D9D31E9CE0BEC14650D2DAB@caf02.caf.local>
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
To: Netfilter <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org <> wrote:
> Hi all
>=20
> I would like to have it so that a connection (destined for
> port 8080) comes in on eth0 and jumps to port 3389
>=20
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to
> 192.168.111.248:3389 $IPT -t filter -A FORWARD -i eth0 -p tcp --dport
> 8080 -d 192.168.111.248 -j ACCEPT=20
>=20
Try

$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to =
192.168.111.248:3389=20
$IPT -t filter -A FORWARD -i eth0 -p tcp --dport 3389 -d 192.168.111.248 =
-j ACCEPT=20

--=20
Eray

