From: Jason Opperisano <opie@817west.com>
Subject: Re: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 16:01:57 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015200157.GA7982@bender.817west.com>
References: <20041015194115.58352.qmail@web21525.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015194115.58352.qmail@web21525.mail.yahoo.com>
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

On Fri, Oct 15, 2004 at 12:41:15PM -0700, kate wrote:
> Hello,
> 
> As I see increased scans on my IP address, I want to
> limit access to only predetermined IP address ranges
> for certain services - Is the following the correct
> way to do this?
> 
> <snip>
> # (Part A) Rules for incoming packets from Internet
> # Packets for established connections
> iptables -A INPUT -p ALL -d $ETH0_IP -m state --state
> ESTABLISHED,RELATED -j ACCEPT

stylistic note:  the "-p ALL" is kinda unnecessary...

> # (Part B) TCP Rules
> iptables -A INPUT -p TCP -i eth0 -s 123.45.1.1
> --destination-port 21 -j okay # userA
> iptables -A INPUT -p TCP -i eth0 -s 123.45.0/16
> --destination-port 22 -j okay  #users A - Z

i think you're missing a "0" there:  123.45.0/16 should really be
123.45.0.0/16.

> </snip>
> 
> So I understand -
> ONLY User A can ftp, and all those in 123.45. can ssh
> , BUT no-one else on the Internet can request services
> ?

yes--as along as somewhere further down the chain you hit a drop-all
rule of some sort...

-j

-- 
Jason Opperisano <opie@817west.com>

