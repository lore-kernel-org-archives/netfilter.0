From: =?iso-8859-1?Q?Jeppe_S=F8rensen?= <smed@tdcadsl.dk>
Subject: iptables with alias?
Date: Sat, 5 Oct 2002 22:45:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c26cb0$309bdc80$1801a8c0@CBOOK>
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

Hello

I have a little question that perhaps someone can help me with

I have a interface to the inet with 4 dynamic ip addr
eth0 = first dynamic ip addr
eth0:0 = second dynmaic ip addr
and so on

I want to make 1 on 1 nat on the frist 2 aliass and the last 2 alias are for
the rest of the network
192.168.1.5 nat to eth0
192.168.1.6 nat to eth0:0
192.168.1.7-to-15 nat to eth0:1
192.168.1.16-to-30 nat to eth0:2

but iptables wan't take alias

What do I do / what can I do ?

I have looked in the The netfilter user mailinglist Archives and found the
following solution

ip addr add w.x.y.z/bits dev eth0 label eth00

but how does I get it to work with dynamic address?


The archive mail I found the solution in
http://lists.netfilter.org/pipermail/netfilter/2002-June/034592.html


Jeppe Sorensen
Denmark


