From: Alexander Salmin <security.member@gmail.com>
Subject: When do the rule apply?
Date: Wed, 15 Jun 2005 22:01:54 +0200
Message-ID: <393114f905061513012ac2216a@mail.gmail.com>
Reply-To: Alexander Salmin <security.member@gmail.com>
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

Hi, I guess this question is just a silly one for experts, but I can't
find the answer anywhere so I'm asking you guys.

In what order do the assigned rules apply in this script?=20

# Example1
iptables -A INPUT -j DROP # rule #1
iptables -A INPUT --dport 80 -j ACCEPT # rule #2

#Example2=20
iptables -A INPUT --dport 80 -j ACCEPT # rule1
iptables -A INPUT -j DROP # rule2

Will the both examples produce the same result?
Or will rule2 in example 2 make rule1 in example2 vanish because it's
telling the system to drop all?

