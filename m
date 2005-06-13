From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Clusterip usage
Date: Mon, 13 Jun 2005 09:48:35 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582909E99@pxtbenexd01.pxt.primeexalia.com>
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
To: Gavin Henry <ghenry@suretecsystems.com>, netfilter@lists.netfilter.org

This should work but if you run into needing slightly more functionality =
than can be procuded by iptables you're stuck.  This was our case.  We =
decided on LinuxHA and then finally on LinuxHA/DRBD.  This combination =
worked well for us (plus it was easy to configure).  Our additional =
funcitionality is based on the fact that we need to NAT serveral IP's.
=20
Hope this helps.
=20
Gary Smith

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Gavin Henry
Sent: Mon 6/13/2005 5:07 AM
To: netfilter@lists.netfilter.org
Subject: Clusterip usage



Dear list,

I have just read:

http://geminis.dyndns.org/wordpress/index.php/2005/06/12/loadbalancer-les=
s-clusters-on-linux/

What is the lists view on it?

Is it a reliable replacement for Linux Virtual Server?

Thanks.

--
Kind Regards,

Gavin Henry.
Managing Director.

T +44 (0) 1224 279484
M +44 (0) 7930 323266
F +44 (0) 1224 742001
E ghenry@suretecsystems.com

Open Source. Open Solutions(tm).

http://www.suretecsystems.com/





