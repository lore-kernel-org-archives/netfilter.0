From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Poll on large sites that deploy Iptables.
Date: Fri, 4 Jun 2004 09:39:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E32F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Aldo Lagana <ALagana@p21.com>, Brett Simpson <simpsonb@hillsboroughcounty.org>, netfilter@lists.netfilter.org

Aldo Lagana wrote:
> First off - like AOL, IBM, etc - all use high-end probably cisco
> routers which do their firewalling - one cannot get the packet per
> second throughput they need without dedicated ASIC-based
> router/firewalls...=20

Correct me if I'm wrong, but aren't (at least mid-sized) CISCO firewalls
based on X86's down to the PCI bus and Pentium derived processors? Even
Mid-grade routers are supplying VPN accelerator chips, but I think the
firewall code itself is stored in flash, executed like any other
programs. I doubt IOS uses a lot of hardware acceleration beyond the
CPU. Although I really don't know much since I haven't done much work on
them.

An example:
(http://www.cisco.com/en/US/products/hw/vpndevc/ps2030/products_qanda_it
em09186a0080091b17.shtml)
Even the 535's only use PIII 1ghz

