From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: blocking access to port 22 when INPUT policy is ACCEPT
Date: Tue, 31 Jul 2007 18:51:26 -0500
Message-ID: <46AFCAFE.4030003@riverviewtech.net>
References: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>
	<b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 7/31/2007 5:04 PM, Maxim Veksler wrote:
> I have my machine configured to allow all traffic in INPUT table, but 
> I would like to block access to port tcp22 from all besides several 
> ip's.

*nod*

> How can I do a "AND" between them as in

Wrong logic operator.  The question could also be written as "How do I 
block all connections not from the set A or B or C or ...".  One way to 
achieve this is with the IPSet match extension (which I have not worked 
with, so this may not be syntactically correct).

iptables -A INPUT ! -m set --set sshclients src -j DROP

In theory this rule will say "if the source ip is not in set sshclients 
DROP the packet".

This will allow you to use the user space utility ipset to control your 
(iphash) set which is your list of allowed ssh clients.



Grant. . . .

