From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Need for GLIBC 2.3?
Date: Thu, 17 Apr 2003 17:41:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFCE07B0DA.63D2DEA4-ON88256D0C.0002759A-88256D0C.0003C28A@deepwoods.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter List <netfilter@lists.netfilter.org>

Red Hat 7.3 (v2.4.18) supplies iptables v1.2.5, which relies on glibc
v2.2.5.  I'd like to apply the rpm for v1.2.7a, but the RH distro demands
glibc v2.3.
I've looked through the changelogs and don't see any particular requirement
for glibc v2.3 and I'm wondering if it would be safe to install the rpm and
ignore it's dependency on glibc 2.3.

Alternatively, I could put glibc v2.3 on the RH 7.3, the install iptables
v1.2.7a.

What would you do?

(I plan to upgrade to RH 9 when I have time, but that has other
consequences and I want to make sure I test my configuration first, but in
the meantime, I need to see if a later iptables will fix a problem I've
having.)

--Carol Anne




