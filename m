From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Doubt about FTP
Date: Wed, 21 Sep 2005 13:54:57 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2D2B@farmer.vikus.com>
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

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Alexandre Cavaler Correa
> Sent: Wednesday, September 21, 2005 1:28 PM
> To: netfilter@lists.netfilter.org
> Subject: Doubt about FTP
>=20
> I have a Gateway based on linux and behind this a I have a=20
> IIS in a WIndows 2003 Server, the IIS is working fine, but=20
> the FTP is not working.
>=20
> and when I put the WIndows 2003 out of the gateway, it works fine.
>=20
> S I think my problem is on my firewall (iptables)
>=20
> What can I do to liberate the FTP??
>=20
> Thanks,=20
>=20
> Alex

You can start by posting the output of iptables-save. It also makes a
difference if you're using connection tracking for FTP or not - I don't
remember the exact name of the module... ipt_conntrack_ftp?

Derick Anderson

