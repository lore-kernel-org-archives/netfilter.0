From: "Vladimir Potapov" <mailarchives@mail.ru>
Subject: RE: Gigabit
Date: Wed, 10 Mar 2004 00:40:53 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FOELKOFDAANJCBHBJNEBCEOGCCAA.mailarchives@mail.ru>
References: <D8FBABA1EF6F2E4DBCC88903F60691F302856A8F@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <D8FBABA1EF6F2E4DBCC88903F60691F302856A8F@houxchsvr.ucscorp.ucs.pvt>
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
To: BrianHildebrand@universalcomputersys.com
Cc: netfilter@lists.netfilter.org

In my initial testing with netfilter, I found it started dropping packets
eventually. But it tries really hard to keep up before that. At around 50%
utilization on a 100meg pipe I started seeing packet loss with random syn
packets (basically just sending syn requests using random source/destination
ports at a firewall with no ruleset). CPU utilization at that point was
maxed out.

Thank's.It's interesting.Can I give more exactly infomation about harware,
kernel options, more thorough statictics of using by linux CPU, memory , I/O
, irq and other ?


