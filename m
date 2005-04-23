From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: block all trafic from input
Date: Sat, 23 Apr 2005 13:06:34 -0500
Message-ID: <426A8EAA.3040407@riverviewtech.net>
References: <a3f524e05042303241434a0fd@mail.gmail.com>
	<426A37D3.7010402@yahoo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426A37D3.7010402@yahoo.com.br>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Meris Vieira <emerisv@yahoo.com.br>
Cc: Kashif Ali Bukhari <kbukhari@gmail.com>, netfilter@lists.netfilter.org

> iptables -P INPUT DROP

Don't do it from an SSH session though.  You will regret that if you don't have any prior rules to allow you back in.



Grant. . . .


