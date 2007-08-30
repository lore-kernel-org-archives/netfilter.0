From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: RE: [nf-failover] conntrack and conntrackd
Date: Thu, 30 Aug 2007 15:11:00 +0200
Message-ID: <56FFE36FCA3A3842AE12EE8B3A32229D1B68CD@exbbc.stromtelecom.cz>
References: <56FFE36FCA3A3842AE12EE8B3A32229D1B681A@exbbc.stromtelecom.cz>
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
To: netfilter@lists.netfilter.org
Cc: netfilter-failover@lists.netfilter.org

Hi,

I observed that when creating conntrack record using conntrack tool, no
event is catched (using conntrack -E). That might be reason why the
record is not in conntrackd's cache. Is that true? If yes, does anybody
know why creating the record this way doesn't fire the event?

Thanks

Michal Filka

> -----Original Message-----
> From: netfilter-failover-bounces@lists.netfilter.org
[mailto:netfilter-failover-
> bounces@lists.netfilter.org] On Behalf Of Filka Michal
> Sent: 30. srpna 2007 13:41
> To: netfilter-failover@lists.netfilter.org
> Cc: netfilter@lists.netfilter.org
> Subject: [nf-failover] conntrack and conntrackd
>=20
> Hi,
>=20
> I've problem when using conntrack and conntrackd.
>=20
> I tried to create a record using conntrack. But, I didn't see the
record
> in conntrackd cache neither on MASTER even BACKUP. However, I can see
> the record in conntrack (conntrack -L)
>=20
> Does it meen that conntrackd isn't able to synchronize manually
created
> conntrack records?
>=20
> Michal Filka
>=20
>=20
> _______________________________________________
> https://lists.netfilter.org/mailman/listinfo/netfilter-failover

