From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: iptables v1.3.3
Date: Fri, 26 Aug 2005 10:10:47 -0500
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D16162EB@ebs-2200.ebasedsecurity.com>
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

I have been running 2.6.11.7 kernel with iptables v1.3.1 and I recently
downloaded the full v1.3.3 tarball.

=20

I'm able to make && make install the new iptables v 1.3.3 but when my
rules load it can't find libipt_recent.so.

=20

I removed the old iptables first because I was having issues with it
complaining that I was using iptables v1.3.3 (I'm iptables v1.3.1).

=20

How do I get libipt_recent.so?

=20

I do have libipt_recent.c but it's not creating the .so

=20

I did recompile the kernel with the same options selected as I had
before. The only thing I'm trying to update is the version of iptables.

=20

Should I have just patched the v1.3.1?

=20

