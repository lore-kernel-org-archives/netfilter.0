From: Jason Opperisano <opie@817west.com>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 10:09:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096380553.2330.39.camel@wolfpack.ljm.dom>
References: <web-6413785@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6413785@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-28 at 06:12, hamals@infinito.it wrote:
> hello
> 
> I wrote all my firewall rules, and now I would like to log 
> all packet that will be dropped by my policy rule..
> 
> ..how can I do it?
> 
> what kind of rules do I need?..and where have I to write 
> them?
> 
> thanks

if you're trying to catch the packets that will be dropped by the chain
policy, the last rule in that chain should be the log rule.  for
example:

  iptables -A INPUT -j LOG --log-prefix "FW DROP IN: "

see:

  man iptables
or
  iptables -j LOG -h

for all the available options for the LOG target.

-j

-- 
Jason Opperisano <opie@817west.com>


