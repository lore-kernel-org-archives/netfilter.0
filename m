From: mortar <slacklist@op.pl>
Subject: Re[2]: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 10:36:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <175943696.20040724103601@op.pl>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
 <200407240856.03201.Antony@Soft-Solutions.co.uk>
Reply-To: mortar <slacklist@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407240856.03201.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

Witam

Saturday, July 24, 2004, 9:56:03 AM, you wrote:

AS> It makes it impossible to implement --check because there's no way to provide
AS> the payload on the command line.

But maybe we can generate test packet and save it to a file, and then
test with --check? I dont know, it's just my improvisation :)

Anyway, there is another big problem described in FAQ: '-m state'
based rules, and I think this make this option hard to implement ;)

-- 
Pozdrawiam
 Marcin                            mailto:slacklist@op.pl


