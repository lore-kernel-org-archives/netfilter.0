From: "Martin McKeay" <mmckeay@stillsecure.com>
Subject: RE: NAT rules for VPN only allowing one user?
Date: Wed, 30 May 2007 10:12:13 -0600
Message-ID: <5C9E8CCEEB81ED498AC0C3B0054704F302937827@webmail.latis.com>
References: <000001c7a2ce$6d4a5860$dededede@neilhp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <000001c7a2ce$6d4a5860$dededede@neilhp>
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
To: Neil Aggarwal <neil@JAMMConsulting.com>, netfilter@lists.netfilter.org

I took a quick look at the user guide but didn't see a lot of
information on the VPN.  Does Linksys have a forum or mailing list that
addresses this?  Maybe someone there's run into a similar problem.=20
=20

Martin McKeay, CISSP, GSNA=20
Cobia Product Evangelist=20
StillSecure=20
martin@stillsecure.com <mailto:mmckeay@stillsecure.com> =20
707-495-7926=20
http:// <http:///> www.cobiablog.com=20

=20

________________________________

From: Neil Aggarwal [mailto:neil@JAMMConsulting.com]=20
Sent: Wednesday, May 30, 2007 9:23 AM
To: Martin McKeay; netfilter@lists.netfilter.org
Subject: RE: NAT rules for VPN only allowing one user?



Martin:

I am using the LinkSys RV042:
http://www.linksys.com/servlet/Satellite?c=3DL_Product_C2&childpagename=3D=
US
%2FLayout&cid=3D1123638171618&pagename=3DLinksys%2FCommon%2FVisitorWrappe=
r&l
id=3D7161822279B01
<http://www.linksys.com/servlet/Satellite?c=3DL_Product_C2&childpagename=3D=
U
S%2FLayout&cid=3D1123638171618&pagename=3DLinksys%2FCommon%2FVisitorWrapp=
er&
lid=3D7161822279B01>=20

Neil

--
Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
FREE! Eliminate junk email and reclaim your inbox.
Visit http://www.spammilter.com <http://www.spammilter.com>  for
details.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org
<mailto:netfilter-bounces@lists.netfilter.org> ] On Behalf Of Martin
McKeay
Sent: Wednesday, May 30, 2007 10:17 AM
To: netfilter@lists.netfilter.org
Subject: RE: NAT rules for VPN only allowing one user?

So this is a limitation of the Linksys router, correct?  What are the
real requirements for user connections?=20

Linksys has the BEFVP41, that supports up to 50 VPN connections.  Maybe
an upgrade to this box is in order.  It's on Amazon for $99.  What
router are you using right now?  If it's a WRT54 series wireless router,
there might even be an image you can flash it with to do what you want
right now.

Martin


Martin McKeay, CISSP, GSNA
Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://cobia.stillsecure.com/mckeay
<http://cobia.stillsecure.com/mckeay>=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org
<mailto:netfilter-bounces@lists.netfilter.org> ] On Behalf Of Michael
Gale
Sent: Wednesday, May 30, 2007 8:37 AM
To: Neil Aggarwal
Cc: netfilter@lists.netfilter.org
Subject: Re: NAT rules for VPN only allowing one user?

Hey,

This sounds like a problem on the VPN gateway device, you should remove
the rule:

"/sbin/iptables -t nat -A POSTROUTING -o eth1
        -d $LINKSYS_VPN_IP -p tcp --dport 1723
        -j SNAT --to-source $ETH1_IP"

And resolve that issue, what is most likely currently happening. Your
VPN router is only setup for or only supports 1 VPN connection per IP
address. So a second connection would over write the first one.

Michael



