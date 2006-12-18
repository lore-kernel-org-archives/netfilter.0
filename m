From: "Gary W. Smith" <gary@primeexalia.com>
Subject: ipsec on 2.6.16+ question
Date: Sun, 17 Dec 2006 16:46:24 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EEDD@pxtbenexd01.pxt.primeexalia.com>
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

I've upgraded one of our old firewalls from RHEL4 to RPATH 1.0.5
(2.6.16).  We moved the firewall script directly from the old firewall
to the new one and everything appeared to work except IPSEC, which
failed.  It appears that it's no longer honoring the -p ! esp portion of
the postrouting.  I'm not sure if this is or is not standard behavior or
not or if there is a better way of doing what I'm doing below.  We have
additional IP's beyond what's listed below (some public, some not) which
would require multiple lines for this.=20

Original:

-A POSTROUTING -o eth1 -p ! esp -j MASQUERADE

Current working:
-A POSTROUTING -s 10.0.16.0/255.255.248.0 -d 10.0.32.0/255.255.255.0 -o
eth1 -j ACCEPT=20
-A POSTROUTING -o eth1 -j MASQUERADE


