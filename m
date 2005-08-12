From: Martin van den Berg <martinvdberg@gmail.com>
Subject: Forwarding packets on same interface (echoing)
Date: Fri, 12 Aug 2005 13:05:26 +0200
Message-ID: <5edf245205081204055a3363f2@mail.gmail.com>
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

G'day,

I have this NAT/firewall box (debian) configured with iptables. Port
forwarding etc works fine for one exception: A need a rule that
'echoes' back udp packets if they meet the following criteria:
+ in-interface=3Deth1 (that's the 'private' interface)
+ destination IP is public ip-address (e.g. 1.2.3.4) (that's eth0)
+ Port range is e.g. 30000-32000
+ The packets need to be forwarded via eth0 (thus echoed) to e.g.
10.10.1.2, same port.

Hope you can help me and thanks in advance!

Martin.

