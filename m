From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Whats faster? multiple rules vs. multiport match
Date: Thu, 15 Feb 2007 22:37:29 +0100
Message-ID: <20070215213729.GA27689@outback.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi!

While hacking on alff [42] I asked myself what would be more wise to
use for matching multiple ports on multiple servers/ips

 a) on rule for every ip/port combination
 b) two rules for every server, one for tcp and one for udp
    (assumend I only have to match for udp and tcp stuff).

(The whole scenario is the following:
 I generate rules to regulate access to different services.
 Every service is transalted into an own chain.
 Therein I generate a matrix of host running this service and port
 related to it - like a))

As there are some services with ~ 20 ports (think: Windows(r) DC)
there might be some advantage in choosing the faster way.

Is there any "benchmark" which might enligthen me which way to use?
Any comments?

Thanks in advance
Ciao
Max
-- 
	Follow the white penguin.

