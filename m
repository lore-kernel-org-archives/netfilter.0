From: Askar <askarali@gmail.com>
Subject: simple question
Date: Wed, 27 Apr 2005 16:35:15 +0600
Message-ID: <a0f69e50504270335efe7915@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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

hi list

        If I put  "iptables --policy FORWARD ACCEPT" , still I need a line =
i-e=20

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Regards

Askar
--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

