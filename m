From: "Jonathan Villa" <jvilla@e37.net>
Subject: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 12:00:49 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
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

To my understanding the following will allow any address in the x.x.x.0
block access

$IPTABLES -A INPUT -p tcp --dport 22 -s xxx.xxx.xx.0/24  -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT

It of course is not working...

my temporary solution : looping through 1-254

not very nice when I need to show someone the current rules.

-confused




