From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: SSH request comes in as DNS?
Date: Mon, 17 Feb 2003 13:01:45 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E505EA9.6050200@mega-bucks.co.jp>
References: <3E5055FF.4090808@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

In case it help anyone in diagnosing my problem, I found that if I had 
the following two rules my problem goes away:

$IPT -A INPUT -p tcp --sport 53 -j ACCEPT
$IPT -A INPUT -p udp --sport 53 -j ACCEPT

But I still don't understand why these packets with a SPT of 53 are 
coming from the firewall to my machine when I try and establish an SSH 
connection.

Seems like the Firewall (which is also a DNS server) is repling to a DNS 
query from SERVER1?? Why would SERVER1 be doing DNS queries?

It's true that SSH does do a DNS query when a machine tries to connect 
but even if this fails SSH just issues a warning. And Both SERVER1 and 
SERVER2 are configured the same way in regards to SSH so I can't see 
that SSH is actually the problem.

Hope the info is useful in helping me debug this problem ...

Thanks,

Jc




