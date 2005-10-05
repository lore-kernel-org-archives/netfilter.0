From: "Gary W. Smith" <gary@primeexalia.com>
Subject: ClusterIP backport question
Date: Wed, 5 Oct 2005 09:09:17 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5822@pxtbenexd01.pxt.primeexalia.com>
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

Hello,=20

I know that CLUSTERIP is included in the newer 2.6 mainline but I am
interested in putting it into RHES 4.  Is there a older POM package out
there that I can use to install it in this kernel?

I have a package back from April that contains clusterip but it doesn't
apply cleanly because connmark was broken in that particular iteration
that I downloaded.

Gary=20
