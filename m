From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re:  Updating multple iptables on servers
Date: Tue, 08 Jun 2004 04:31:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086683503.2008.6.camel@grendel>
References: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
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
To: hyper@ubn.dk
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-06-08 at 04:09, hyper@ubn.dk wrote:
>
> Is it possible to update iptables from a central server. I got 25 servers
> using the same firewall and i need something to update them all from a
> central server. 
>  
> Any ideas?

Fanout is your friend:
http://www.stearns.org/fanout/

To quote the docs: "This tool will run commands on multiple machines at
the same time via ssh."

Bill has a number of excellent Linux tools up on his site, this being
one of them.

HTH,
Chris




