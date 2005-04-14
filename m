From: Nuno Amorim <na.amorim@gmail.com>
Subject: IPv4 to IPv6
Date: Thu, 14 Apr 2005 13:17:25 +0100
Message-ID: <7faad17f050414051777aa04ec@mail.gmail.com>
Reply-To: Nuno Amorim <na.amorim@gmail.com>
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

Hello!


What I want to do is in a box where I receive some UDP streams, do a
"NAT" where the output is going to be IPv6 multicast. This is only one
way, so no return traffic. Each udp port is translated to an IPv6
multicast address.

Is this possible in iptables?

Thanks in advance.

Nuno

