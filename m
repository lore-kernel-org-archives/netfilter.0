From: "Axel Christiansen" <axel@zedx.org>
Subject: sugestion needed for session marking from different default routres
Date: Wed, 1 Oct 2003 12:41:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34887.212.202.127.214.1065004876.squirrel@knex.zedx.net>
Reply-To: axel@zedx.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

i have a problem, maby one can help me with that.

There is a iptables Box with 2 default routes.
One hat dynamic IP (DSL), the other one owns a
small inet /29 Net. The DSL route should be used,
because of the flatrate on that line. The
filterbox does DNAT to an host behind it on
a private Net for ssh.

Now, ssh from inet on the DSL line works fine. The
Pakets get back the right way by the active default
route. I also want to ssh in over the other interface,
and want the packets back in that line.

I am thinking about marking the incoming packets and
then finding out about the returning packets some how.
If this would work, the routing then can by done by
ip rule (routing).

How could this be done? Is there another solution
for my problem.

thx a lot, Axel




