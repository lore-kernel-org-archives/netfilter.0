From: Kean Pedersen <netfilter@zakarun.dk>
Subject: Re: Running iptables behind router
Date: Wed, 25 Feb 2004 20:41:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040225194150.GA1317@zaklinux.zakarun>
References: <20040216235513.GA1219@room101> <632269680.20040217093907@attla.net.ar> <20040224001308.GA10127@zaklinux.zakarun> <1077597076.394.7.camel@localhost> <20040224120743.GA743@zaklinux.zakarun> <1077734446.2017.4.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1077734446.2017.4.camel@localhost>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

That worked :)  .2 can now connect to .1 and the Internet. Just what I
wanted, thanks.
The rules in effect now are (if anyone would like to know):

Chain INPUT (policy ACCEPT 340K packets, 61M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy DROP 557 packets, 46760 bytes)
 pkts bytes target     prot opt in     out     source               destination
  567 47151 ACCEPT     all  --  any    any     192.168.2.0/24       anywhere
   96 30109 ACCEPT     all  --  any    any     anywhere             anywhere            state RELATED,ESTABLISHED

Chain OUTPUT (policy ACCEPT 322K packets, 44M bytes)
 pkts bytes target     prot opt in     out     source               destination
Chain PREROUTING (policy ACCEPT 21299 packets, 2019K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 40608 packets, 2980K bytes)
 pkts bytes target     prot opt in     out     source               destination
   57  3700 SNAT       all  --  any    any     192.168.2.0/24       anywhere            to:192.168.1.254

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination


On Wed, Feb 25, 2004 at 01:40:47PM -0500, John A. Sullivan III wrote:
> Ah! Blinded by my own assumptions! I also always have rules to allow
> RELATED and ESTABLISHED traffic.  As others on the list have pointed
> out, it looks like you have no rule here to allow return traffic. 
> Assuming you are using connection tracking, you will want a rule in your
> forward chain similar to:
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
<snip>

