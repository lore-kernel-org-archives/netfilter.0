From: liyas_m m <liyasmm@gmail.com>
Subject: firewall just ignore the rule
Date: Wed, 13 Jul 2005 18:53:07 +0800
Message-ID: <2452665f05071303531a55fbf@mail.gmail.com>
Reply-To: liyas_m m <liyasmm@gmail.com>
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

I hv iptables 1.2.7 installed on my firewall
The problem is  when i try to block traffic from certain address , it
just does not work
e.g
iptables -A INPUT -s 10.5.33.22 -j DROP

but when i run iptraf , there are still traffic sent from the source addres=
s
Any idea why?

