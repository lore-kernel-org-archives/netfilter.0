From: CAM IT Solutions <netfilter@lucassen.org>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
 rules
Date: Sat, 11 Oct 2003 19:45:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031011194527.17273de9.netfilter@lucassen.org>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	<1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
Reply-To: reply2@lucassen.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
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
To: netfilter@lists.netfilter.org

On Sat, 11 Oct 2003 18:26:04 +0200
Cedric Blancher <blancher@cartel-securite.fr> wrote:

[snip rules]

> > Both ways work, but I'd say the second way is the best. Am I right?
> 
> I agree.
> To me, theses two rulesets are equivalent for HTTP packets, but first
> one implies one more rule evaluation than the second one for
> ESTABLISHED packets that are destined to TCP/80.

I don't know too much about netfilter internals, but I suppose that
there must be a separate connection table for each chain. I think this
is because you can't enter:

/sbin/iptables -m state --state ESTABLISHED,RELATED -j ACCEPT

without mentioning the chain. I *have* to enter:

/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I just wonder if these ESTABLISHED,RELATED packets are handled by 1
overall connection table, or handled by 2 connection tables, 1 for
INPUT and 1 for FORWARD.

And what happens if a jump is made from the FORWARD chain to a
userdefined chain, is the connection table the one of the FORWARD chain?
And if the answer is "yes", why does iptables accepts the 

/sbin/iptables -A CH_WWW -m state --state ESTABLISHED,RELATED -j ACCEPT

rule then? I haven't found any answer to that question on the net yet :(

> PS : there's no RELATED packets in HTTP ;)

Ok, the CH_WWW was just an example, but you certainly have got a point
there ;-)

R.

___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
 

