From: Jason Opperisano <opie@817west.com>
Subject: Re: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 17:03:33 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015210333.GA8316@bender.817west.com>
References: <20041015202858.GA8079@bender.817west.com>
	<20041015204052.94397.qmail@web21526.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015204052.94397.qmail@web21526.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 01:40:52PM -0700, kate wrote:
> Last question-
> I have this at the top of my script, We should be good
> to go with this right ?
> 
> #(1) Policies (default)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP

yes--we're good to go...

> or do we need something below part 3
> 
> iptables -A INPUT -p TCP -i eth0 -s 123.45.1.1
> --destination-port 21 -j okay # userA
> iptables -A INPUT -p TCP -i eth0 -s 123.45.0.0/16
> --destination-port 22 -j okay  #users A - Z
> 
> like ?
> iptables -A INPUT -j DROP

this would be redundant with "-P INPUT DROP" although it's worth noting
that this last rule would catch all the traffic, and the INPUT policy
counters would forever remain at zero.

i personally like to make my last rule some sort of logging rule--so in
the event i'm blocking something i shouldn't--i have a record of what it
looks like...i think my current iteration of the "log everything that's
about to be dropped by the chain policy" rule looks something like:

iptables -A INPUT -m limit --limit 1/sec --limit-burst 3 \
  -j LOG --log-level 4 --log-prefix "FW DROP INPUT: "

-j

-- 
Jason Opperisano <opie@817west.com>

