From: Willy TARREAU <willy@w.ods.org>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED rules
Date: Sun, 12 Oct 2003 13:16:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031012111620.GB571@pcw.home.local>
References: <20031010132641.2591d3b5.netfilter@lucassen.org> <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net> <20031011194527.17273de9.netfilter@lucassen.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031011194527.17273de9.netfilter@lucassen.org>
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
To: reply2@lucassen.org
Cc: netfilter@lists.netfilter.org

On Sat, Oct 11, 2003 at 07:45:27PM +0200, CAM IT Solutions wrote:
 
> without mentioning the chain. I *have* to enter:
> 
> /sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> /sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> I just wonder if these ESTABLISHED,RELATED packets are handled by 1
> overall connection table, or handled by 2 connection tables, 1 for
> INPUT and 1 for FORWARD.
> 
> And what happens if a jump is made from the FORWARD chain to a
> userdefined chain, is the connection table the one of the FORWARD chain?
> And if the answer is "yes", why does iptables accepts the 
> 
> /sbin/iptables -A CH_WWW -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> rule then? I haven't found any answer to that question on the net yet :(

You can share the user defined chains between several chains as long as
they are in the same table and support the same arguments. Since the
'state' match is valid from INPUT and FORWARD, it will work in a shared
user chain.

However, if you use some illegal information, you'll either get error
messages each time the rule is evaluated or get a never-matching rule.

eg:

  # iptables -A INPUT -j mychain
  # iptables -A FORWARD -j mychain
  # iptables -A mychain -o eth1 -j LOG --log-prefix "out_eth1"

  => Since the output interface (-o) is not defined when starting
     from the INPUT chain, the rule will never match, and possibly
     make the kernel complain.

But in a more general way, user chains are very useful to dissect rules
by addresses, using only DROP, ACCEPT and RETURN. And in this case, it's
easy to share them between different chains without risk.

Willy


