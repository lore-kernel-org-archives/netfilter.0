From: "olivier" <odanes@free.fr>
Subject: REDIRECT to more than one port does not work
Date: Thu, 3 Mar 2005 09:40:58 +0100
Message-ID: <02eb01c51fcc$b8cb7c60$1416a8c0@lannion.citypassenger.com>
Reply-To: olivier <odanes@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

thx for your help.

without changing the rule I've tried with different IPs, odd and even,  =
but I've got the same behavior. I've also change the rule as you 've =
suggested, giving this :

iptables -t nat -A  PREROUTING -p tcp --dport 8000 -j REDIRECT =
--to-ports 8080-8081

I've made the same test (different IPs odd and even) but nothing has =
changed...

do you known how REDIRECT target select the destination when more than =
one are given ?

olivier.
