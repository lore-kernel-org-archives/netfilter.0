From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 10:25:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002a01c417c2$d94db7e0$de0aa8c0@comp>
References: <40696C1A.5080400@personalsoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I use DNAT to redirect traffic from the external lan eth0 (192.168.1.1) =
to a
specific host (192.168.10.10) on the internal lan (eth1) like this:

iptables -t nat -A PREROUTING  -p tcp --dport 80  -d 192.168.1.1 -j DNAT =

    --to 192.168.10.10 -i eth0

and then I allow the redirected traffic:
iptables -a FORWARD -p tcp --dport 80  -d 192.168.10.10 ........

It works as expected but with this aproach, it's actually possible from =
the outside
to find out what internal ip, the http server is located at !.
All one has to do is sending to 192.168.10.1, 192.168.10.2, 192.168.10.3 =
etc.  (to=20
eth0 on the outside) until one hits the server. The rules allows it.

I have not been able to figure out how to solve this problem.


Any suggestions.

Thanks in advance
Bo Jacobsen



