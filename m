From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: FORWARD rules
Date: Sat, 13 Sep 2003 07:56:58 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030913022658.GD1667@linux.local>
References: <20030910175253.GA2752@linux.local> <1063260568.26703.1.camel@risingsun.penguindia.com> <20030912100957.GA3360@linux.local> <1063363533.879.52.camel@elendil.intranet.cartel-securite.net> <20030912163656.19b9fb66.arnt@c2i.net> <1063378301.888.66.camel@elendil.intranet.cartel-securite.net> <20030912201425.25ca0ab4.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030912201425.25ca0ab4.arnt@c2i.net>
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
To: netfilter@lists.netfilter.org

On Fri, Sep 12, 2003 at 08:14:25PM +0200, Arnt Karlsen wrote:
> On Fri, 12 Sep 2003 16:51:41 +0200, 
> > > ..lose "NEW".
> > 
> > Just what I said, wasn't it ?
> 
> ..nah, but you probably _meant_ it.  ;-)

I think he said it :). Look below.


| $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
| $IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p tcp \
|        -m tcp --dport 53 -j ACCEPT

-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

