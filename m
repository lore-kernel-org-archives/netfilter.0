From: Diederick van Dijk <diedvdyk@jedi.van-dijk.net>
Subject: SNAT hangs system in SMP mode (kernel 2.4.21)
Date: Mon, 21 Jul 2003 10:19:09 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307211003330.5246-100000@jedi.van-dijk.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

Yesterday I upgraded my system from one Pentium III 450Mhz processor to 
two Pentium III 450 processors. This system is my gateway to the internet.
After upgrading I recompiled the kernel (2.4.21) into SMP mode.
Unfortunately this wasn't a success. After a few minutes my system hung. 
After some searching I'm realy sure that my SNAT rules are the problem. If 
I get my email on an other PC with no other IP activity on my network my 
gateway immediately hung. Retrieving email uses a SNAT rule.
So I recompiled my kernel uni-processor and the problem was over.
Is this a known problem ? How do I fix this (MASQ rules are not the 
solution) ? If someone needs additional information please ask.

System specs :

- 2 x Pentium 450 Mhz
- 256 MB SDRAM
- kernel 2.4.21 (not the stock Mandrake kernel)
- iptables 1.2.7a
- Mandrake 9.1
- 9x SNAT rules

Thanks in advance,

Diederick   


