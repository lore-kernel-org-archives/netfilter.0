From: HouCheng Lee <houchen1@umbc.edu>
Subject: masquerade mac address
Date: Mon, 3 Oct 2005 13:27:23 -0400
Message-ID: <fa66ff1a0510031027l3964f8cbg3cf24896e33c9@mail.gmail.com>
Reply-To: houchen1@umbc.edu
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

When using NAT, I often use
"iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE"
to masquerade the source IP.

My problem is that
my NAT is behind a firewall (controlled by the SA), and
the firewall will check the MAC address of outgoing packet.
The eth0 of the NAT is the only legal card that allows to go outside.

Because the NAT only change the source ip address of packets,
the machines behind NAT are not allowed to go outside
because of the lack of legal mac address.

I'm wondering if there is anyway to change the source ip and mac address
of the NAT packets to those of eth0(the legal one)?
or any suggestion to solve the problem?

Thanks.
