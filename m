From: Kai Weber <kai.weber@glorybox.de>
Subject: What is missed for port forwarding
Date: Sat, 6 Mar 2004 19:36:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040306183657.GB836@glorybox.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have a router where only masquerading and some QOS is enabled. I have
a problem with port forwarding HTTP.

The only rules I use (sorry for long lines):

$IPTABLES -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
$IPTABLES -t nat -A PREROUTING -p tcp --dport 10143 -j DNAT --to 192.168.1.=
2:22
$IPTABLES -t nat -A PREROUTING -p tcp --dport 8888 -i ppp0 -j DNAT --to 192=
=2E168.1.2:80

The first DNAT rule works without a problem. I can ssh directly to my
machine. But the requests to port 8888 seems not to be answered or come
through. To bad I only have switch which has no port mirroring to listen
to the whole traffic and find out the problem.=20

Any ideas what I should try or I miss?

-- =20
  Kai Weber
=BB kai.weber@glorybox.de   http://www.glorybox.de   gpg-key: 0x594D4132

