From: Enrico <ebutera@gmail.com>
Subject: [libipq] local connections problem
Date: Sun, 7 Nov 2004 15:21:23 +0000
Message-ID: <414e0fc9041107072145372ffc@mail.gmail.com>
Reply-To: Enrico <ebutera@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi, i'm using libipq to develop a small application that blocks
connections from/to hosts if they are in a "black" list. It works fine
for outgoing and incoming traffic but when i try to connect to
localhost or loopback (for ex: ftp 127.0.0.1 or using localhost ip) it
refuses to connect giving a "Connection reset by peer" error. If i try
to connect to a non-opened port it correctly says "Connection
refused".
This is how i QUEUE packets to my app:

iptables -A INPUT -p tcp -m state --state NEW -j QUEUE
iptables -A OUTPUT -p tcp -m state --state NEW -j QUEUE

The only way to make local connections work again is to explicitly
ACCEPT them (before QUEUE'ing them) with:
iptables -I INPUT -p tcp -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT

Chains policy is set to ACCEPT.

I repeat that all the other traffic works fine. I don't understand why
i have to do that, any suggestions?

Enrico

