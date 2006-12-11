From: <murugan.venugopal@wipro.com>
Subject: when will the netfilter conntrack helper will be called?
Date: Mon, 11 Dec 2006 08:56:54 +0530
Message-ID: <2A1A6E935323B04BB28608B01B9B077A034B2C9D@CHN-SNR-MBX01.wipro.com>
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


Hai,
     when will the netfilter conntrack helper funtion will be called for
a router? It will be in input chain, forward chain or output chain for
the first packet detected matching the helper registration parameters.=20
=20
i printed skbuff contents for TFTP which i found after SNAT done .will
it not be before doing NAT?..can any one guide me if i am wrong
=20
My setup is=20
 client              router               server=20
 192.168.0.1    10.145.2.23(wan)     10.145.6.78=20
=20
c2b682a4: 17 192.168.0.1:32770 -> 10.145.6.78:69=20
rep tuple c2b682bc: 17 10.145.6.78:69 -> 10.145.2.23:32770=20
and skbuff contents as 10.145.2.23:32770 -> 10.145.6.78:69=20
=20
can i directly change tupule contents to redirect the packet to any
ipaddress or port?
=20
regards,
murugan


The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and=
 may contain proprietary, confidential or privileged information. If you=
 are not the intended recipient, you should not disseminate, distribute or=
 copy this e-mail. Please notify the sender immediately and destroy all=
 copies of this message and any attachments.=20

WARNING: Computer viruses can be transmitted via email. The recipient=
 should check this email and any attachments for the presence of viruses.=
 The company accepts no liability for any damage caused by any virus=
 transmitted by this email.
=20
www.wipro.com

