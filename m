From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: IPs blocked still able to connect
Date: Sun, 13 Jun 2004 13:58:59 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040613135859.51704919@mgalepc.utilitran.com>
References: <20040613132245.07a9fbb7@mgalepc.utilitran.com>
	<200406131936.i5DJaTnI004263@ylpvm01.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406131936.i5DJaTnI004263@ylpvm01.prodigy.net>
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

Hello,

	You should be able to "man iptables"

-A, --append chain rule-specification
              Append one or more rules to the end of the selected chain.  When
the source and/or destination names resolve to more than  one             
address, a rule will be added for each possible address combination.

-I, --insert chain [rulenum] rule-specification
              Insert one or more rules in the selected chain as the given rule
number.  So, if the rule number is 1, the rule or  rules  are             
inserted at the head of the chain.  This is also the default if no rule number
is specified.



On Sun, 13 Jun 2004 12:36:55 -0700
"Spiro Azkoul" <spiro@snacorp.net> wrote:

> 
> 
> t
> 
> Hello,
> 
> 	You are using "iptables -A" ... this will append this rule to your
> list. If you
> have an accept rule further up that this connection would match then it will
> be
> accepted but it hits this rule.
> 
> You should do a "iptables -I" to insert the rule at the top.
> 
> Michael.
> 
> I am not sure I understand the difference between -I and -A
> Where can I find docs on this?
> Thanks Michael
> 
> 
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

