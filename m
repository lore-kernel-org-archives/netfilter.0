From: "jdf [zionarea.org]" <zionarea@free.fr>
Subject: using with big ban lists (peerguardian and so).
Date: Thu, 20 Jan 2005 21:07:01 +0100
Message-ID: <1106251621.41f00f65147cb@imp6-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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



Hi,

I was intended to use peerguardian ban list inside my iptables rules.
I've done a program in C++ to read this file and to put iptables
commands (using the system function).
However it is very very very slow (1 hour picked up a very few of
all the machines). It might be due to the fact that I don't use
the iprange. Is it true ?
Is there any way to do that in a fast manner without using iprange ?

I mean:

when I have addresses like 4.1.2.0-4.1.3.255, I need to call as much
iptables command as there are computers. iprange seems to be best
but I'm not sure if I will encounter speed up.

Thank you.

