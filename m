From: Frank <oldcurmudgeon@gmail.com>
Subject: Converting iptables firewall from 2.4 .to 2.6 kernel
Date: Wed, 30 Mar 2005 15:42:44 -0600
Message-ID: <803aaa1105033013425a3c2bc9@mail.gmail.com>
Reply-To: Frank <oldcurmudgeon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I tried upgrading a Debian stable firewall to sarge.  That part went
fine, but when I
tried upgrading the locally-built 2.4.19 kernel to 2.6.11.5 the
results were not as
expected.
   The first (and easily fixed) problem was that eth0 and eth1 were
reversed.  At
least I verified that my anti-spoofing rules worked. After swaping the
cables, the
firewall could conect to internal and external machines, internal hosts could
connect to the firewall, external hosts could connect to the firewall,
internal hosts
could send packets to exernal hosts, but packets from outside hosts to inside
hosts never crossed to the inside.
   Running tcpdump on both interfaces shows packets from outside hosts to
inside hosts hit the external interface but never appear on the
internal interface,
whether it is an initial connection from outside or a reply packet to a packet
initiated on the inside.
   I'm using the same scripts to set routes, ip_forward, rp_filter,
and proxy_arp.
The only rthing changing is the kernel (and both have iptables support built in,
not as modules).
    Did the locations of things in proc change in 2.6, or any other ideas on how
to debug this? Iptables version is now 1.2.4, it was 1.2 before.
Booting back into
the 2.4. kernel (and swapping the cables) makes it work properly, so the only
variable now is the kernel version (i.e., it all works fine with the
2.4 kernel and
all the new sarge utilities/libraries, etc.).

Thanks,
Frank

