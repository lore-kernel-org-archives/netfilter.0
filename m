From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: how to use ipt_limit.o?
Date: Mon, 9 Dec 2002 11:29:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019A36@hslex01.hslbz.local>
References: <007e01c29f69$5b3c82f0$9801010a@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007e01c29f69$5b3c82f0$9801010a@winxp>
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
To: 'Peter' <chenlf@cibn.com>, Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

> iptables -A INPUT -p tcp --syn --dport http -j USER_CHAIN
> iptables v1.2.7a: Couldn't load target
> `USER_CHAIN':/usr/local/lib/iptables/libipt_USER_CHAIN.so:
> cannot open shared object file: No such file or directory
> why?

As the name implies, USER_CHAIN is a user defined chain which is not
available if you didn't define it.

iptables -N USER_CHAIN
iptables -A USER_CHAIN -j REJECT (or something more useful)
Might help.

There is a nice iptables tutorial which explains a whole lot at :
http://iptables-tutorial.frozentux.net


Rob


