From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: iptables-1.2.9, kernel-2.6.0, pppd-2.4.2
Date: Wed, 31 Dec 2003 15:03:03 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312312302.hBVN2qdU012874@server5.bandwidthco.com>
References: <BAY2-F33Hh2wLCVYl4m0003f0bf@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F33Hh2wLCVYl4m0003f0bf@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="gb2312"
To: 'zhang ping' <dqzhangp@hotmail.com>, netfilter@lists.netfilter.org

Nothing is the matter.  You're packets destined to (or coming from) =
zaobao
are taking one route, and you're packets to kernel are taking a =
different
route.  The difference is, the packets to kernel are going through a =
router
that supports an MTU of less than 1500.  Thus, fragmentation is =
required.
However, a router somewhere along this path more than likely contains an =
ACL
that drops ICMP Type 3 Code 4 Fragmentation Required but DF set) =
packets.
Consequently, your system is never notified of the need to reduce the =
MTU,
and all packets are dropped.  By reducing your MTU to 1300, you have
circumvented the need for fragmentation, and traffic flow to Kernel goes
undisturbed and uninterrupted.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of zhang ping
Sent: Tuesday, December 30, 2003 11:38 PM
To: netfilter@lists.netfilter.org
Subject: iptables-1.2.9, kernel-2.6.0, pppd-2.4.2


----adsl----linuxbox----lan

pppd-2.4.2 (use kernel mode pppoe)
iptables-1.2.9
kernel-2.6.0

when I visit www.zaobao.com at lan, it is ok, but I cant visit
www.kernel.org, so qi guai.

when i set mtu as 1300 at lan, everthins is ok, i can visit all sites.

what is the matter, anybody help me?

_________________________________________________________________
=CF=ED=D3=C3=CA=C0=BD=E7=C9=CF=D7=EE=B4=F3=B5=C4=B5=E7=D7=D3=D3=CA=BC=FE=CF=
=B5=CD=B3=A1=AA MSN Hotmail=A1=A3  http://www.hotmail.com =20




