From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables Help
Date: Mon, 31 May 2004 09:20:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E319@alderaan.smgtec.com>
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
To: vinay@technoinfotech.com, netfilter@lists.netfilter.org

Vinay, this isn't a simple problem that can be applied to a standardf
template. To get some info on balancing and sculpting lines, see
http://lartc.org or http://linux-ip.net/html/linux-ip.html=20

They have enough reference material to get you through the process.

You also have to note something else. If the two ISP line aren't from
the same ISP, there's no guarantee this'll work at all. The problem is
that each set of IP addresses tied to your PC are pointed to by your
ISP. If your ISP finds you sending sources packets from a network that
isn't theirs, they have all the right in the world to block those
packets. Both Sender/Receiver have to have the same address to make
connections.

Good luck.

