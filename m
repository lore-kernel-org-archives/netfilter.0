From: "Sussman, Scott" <ssussman@starentnetworks.com>
Subject: RE: queue_max_length configuration
Date: Tue, 14 Aug 2007 09:37:47 -0400
Message-ID: <7CCD07160348804497EF29E9EA5560D702233DFB@exchtewks2.starentnetworks.com>
References: <7CCD07160348804497EF29E9EA5560D702233DD3@exchtewks2.starentnetworks.com><7CCD07160348804497EF29E9EA5560D702233DD4@exchtewks2.starentnetworks.com>
	<20070811080314.B0CAB90257@mx0.starentnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20070811080314.B0CAB90257@mx0.starentnetworks.com>
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
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@lists.netfilter.org

Hi Eric,

Thanks for the response, I am using the 2.6.18 kernel. For the =
nfq_set_queue_maxlen you mentioned below is this an env variable in =
userspace or do I set it in my app code?

Thanks again!

Scott

-----Original Message-----
From: Eric Leblond [mailto:eric@inl.fr]=20
Sent: Saturday, August 11, 2007 4:03 AM
To: Sussman, Scott
Cc: netfilter@lists.netfilter.org
Subject: Re: queue_max_length configuration

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Le Fri, 10 Aug 2007 14:24:41 -0400,
"Sussman, Scott" <ssussman@starentnetworks.com> a =E9crit :

>=20
>=20
> I need to increase the default size of the queue_max_length but do not
> see where in the code this is defined. Can someone send me a pointer
> to the location in the code so I can re-compile with a larger value?

WHich kernel do you use. On a recent 2.6, you can use
nfq_set_queue_maxlen in userspace to set the queue_max_length.

BR,
- --=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGvW01nxA7CdMWjzIRAuIFAJ4l1YJLmp1wogCE5ZOTRQJYNA6+MACfeqyx
4pm++GfDl6qvIKEvSYB2ZQQ=3D
=3DZJhA
-----END PGP SIGNATURE-----


"This email message and any attachments are confidential information of =
Starent Networks, Corp. The information transmitted may not be used to =
create or change any contractual obligations of Starent Networks, Corp.  =
Any review, retransmission, dissemination or other use of, or taking of =
any action in reliance upon this e-mail and its attachments by persons =
or entities other than the intended recipient is prohibited. If you are =
not the intended recipient, please notify the sender immediately -- by =
replying to this message or by sending an email to =
postmaster@starentnetworks.com -- and destroy all copies of this message =
and any attachments without reading or disclosing their contents. Thank =
you."

