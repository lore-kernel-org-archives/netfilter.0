From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT-Problem
Date: Wed, 08 Sep 2004 22:26:44 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094696804.1739.7.camel@wolfpack.ljm.dom>
References: <20040909041047.7f8457cf@nixe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040909041047.7f8457cf@nixe>
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

On Wed, 2004-09-08 at 22:10, Tom Fischer wrote:
> Hi,
> 
> i have a problem with DNAT. We have to move some services for a few days
> on another machine. So we want do DNAT on incoming Packets. I set
> 
> iptables -A PREROUTING -t nat -s 0/0 -d xxx.xxx.xxx.xxx -p tcp --dport
> 9000-j DNAT --to xxx.xxx.xxx.xxx

since you didn't provide your rules, i'm gonna haveta ask a really
stupid question...

did you execute that command with the old DNAT rule in place?  if
so--the new rule got appended to the end of the PREROUTING chain of the
nat table, after the old rule; therefore, will never get matched.

it would be helpful for us list-types to see the output of:

        iptables -t nat -vnL
        
another thought--NAT happens first (PREROUTING), then filter rules.  you
will need to edit your filter rule to allow traffic to "newserver's"
actual IP instead of "oldserver's" actual IP.

-j

-- 
Jason Opperisano <opie@817west.com>


