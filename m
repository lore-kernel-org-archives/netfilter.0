From: nitin panjwani <tacmpe142@yahoo.com>
Subject: Forced route
Date: Fri, 22 Nov 2002 13:40:31 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122214031.30075.qmail@web12402.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi All,
I have the following topology with four linux(RH7.2
upgraded to 2.4.19, patched with IPROUTE2 and IPTABLES
) routers.
=20
   A----B-----C
   |          |
   +..E0(D)E1.+
=20
In this I want to send some traffic from interface E0
of router D to interface E1 of same router via route
ABC. How can I do this?=20
I know that for a local address routing mechanism will
loopback the packet. Is there anyway to overcome this
behavior of routing mechanism for on local
address(E1).

Thanks,
NItin


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus =96 Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

