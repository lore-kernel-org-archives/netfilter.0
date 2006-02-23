From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: netfilter Digest, Vol 19, Issue 31
Date: Thu, 23 Feb 2006 09:49:02 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CB9DA@mailbox.vikus.com>
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
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Bob Sully
> Sent: Wednesday, February 22, 2006 6:41 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: netfilter Digest, Vol 19, Issue 31
>=20
> Suggestion for the Netfilter admins:
>=20
>=20
> <<>> DiG 9.3.1 <<>> bwdow.com
>=20
> ;; ANSWER SECTION:
> bwdow.com.              86400   IN      A       66.90.92.192
>=20
> /sbin/iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp -s=20
> 66.90.92.192 -d
> $EXTERNAL_IP -j DROP
>=20
>=20
> deneme@bwdow.com wrote:
> > Best Web Designs of World:  http://www.bwdow.com
>=20
> --=20
> ________________________________________
> Bob Sully - Simi Valley, California, USA
> http://www.malibyte.net
> http://www.malibyte.com
>=20

A look at the mail headers (minus my own of course) confirms this
originating IP:

Received: from localhost ([127.0.0.1] helo=3Dvishnu.netfilter.org)
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1FC3Zf-0002Ju-8C; Thu, 23 Feb 2006 00:39:11 +0100
Received: from usr1-114.sharktech.net ([66.90.92.192]
	helo=3DFDC-P4XQ35QSLNU.home)
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1FC3ZB-0002Dn-Mr
	for <netfilter@lists.netfilter.org>; Thu, 23 Feb 2006 00:38:42
+0100
Received: from fdcp4xq35qslnu ([127.0.0.1]) by home with MailEnable
ESMTP;
	Thu, 23 Feb 2006 07:27:28 -0800

It would be nice not to have to delete these emails every day.

Derick Anderson

