From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: PPTP nat and conntrack patch with patch-o-matic
Date: Fri, 4 Nov 2005 03:06:58 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B58E5@pxtbenexd01.pxt.primeexalia.com>
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
To: Jason Romo <jason@romos.net>, netfilter@lists.netfilter.org

Honestly I don't think PPTP has been reliably working since 2.6.9.  This
is the nth time this question has been asked in the last couple days.
It's in the netfilter-dev list as well.  I have a snapshot from back in
May that worked with 2.6.9.

Gary

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason Romo
Sent: Friday, November 04, 2005 12:45 AM
To: netfilter@lists.netfilter.org
Subject: PPTP nat and conntrack patch with patch-o-matic

I am trying to resolve an issue with the patch-o-matic in regards to the
pptp nat and conntrack patch.  I am using kernel 2.6.12.3 on many
different
processors.  I have the problem across the board.  I can compile, but I
can
load the module.  I get an error in dmesg:

ip_conntrack_pptp: Unknown symbol __ip_conntrack_expect_find
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_inbound
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_expectfn
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_exp_gre
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_outbound


Does any one know which patch-o-matic would work with the 2.6.12.3
kernel?
I am using patch-o-matic 20050913? Or how to resolve this issue?

Regards,
Jason



