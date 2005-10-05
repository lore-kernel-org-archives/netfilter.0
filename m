From: Patrizio Bassi <patrizio.bassi@gmail.com>
Subject: [BUG??] irc module fails
Date: Wed, 05 Oct 2005 19:32:35 +0200
Message-ID: <43440E33.4050004@gmail.com>
Reply-To: patrizio.bassi@gmail.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi.

seems that's a problem with irc module.

if i ask dcc chat to an user it doesn't work.
if i try to send a file, neither (no nat/router problem)

if i try to receive a file it works.
i've sniffed a dcc chat session with ethereal..

19:22:28.000825 IP <ip1>.1267 > <myip>.33400: S 1487500188:1487500188(0) 
win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 466877396 0>
19:22:30.990384 IP <ip1>.1267 > <myip>.33400: S 1487500188:1487500188(0) 
win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 466877696 0>

packet arrives but is discarded...
why? no tracking? seems so strange..

ps. i'm not subscribed, CC me


