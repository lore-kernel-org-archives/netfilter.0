From: "Gavin" <gavin@raha.com>
Subject: iptables, voip, mac match
Date: Fri, 11 Oct 2002 11:04:56 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <065501c270fc$e3f10c10$583a29c4@ghome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

hello,

just reporting a funny one:

One of our clients was trying to use a VOIP application through a linux
gateway (iptables-1.2.3). The client had a MAC address of a:b:c:d:e:f and an
IP address of 1.2.3.4

When I used this rule on the gateway (FORWARD policy DROP):
iptables -A INPUT -i eth1 -m mac --mac a:b:c:d:e:f -j ACCEPT
     -     the client could not establish an audio channel to his VOIP
server

But when I used this line:
iptables -A INPUT -i eth1 -s 1.2.3.4 -j ACCEPT
    -    he could make calls fine.

Just in case anyone runs over this in future.  It was unexpected, to say the
least.  As far as I understand it, both lines should have worked.

Gavin



