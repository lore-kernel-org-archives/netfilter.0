From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: FORWARD rules
Date: Sat, 13 Sep 2003 08:42:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030913084256.73dc4a3d.arnt@c2i.net>
References: <20030910175253.GA2752@linux.local>
	<1063260568.26703.1.camel@risingsun.penguindia.com>
	<20030912100957.GA3360@linux.local>
	<1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
	<20030912163656.19b9fb66.arnt@c2i.net>
	<1063378301.888.66.camel@elendil.intranet.cartel-securite.net>
	<20030912201425.25ca0ab4.arnt@c2i.net>
	<20030913022658.GD1667@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030913022658.GD1667@linux.local>
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

On Sat, 13 Sep 2003 07:56:58 +0530, 
Payal Rathod <payal-iptables@staticky.com> wrote in message 
<20030913022658.GD1667@linux.local>:

> On Fri, Sep 12, 2003 at 08:14:25PM +0200, Arnt Karlsen wrote:
> > On Fri, 12 Sep 2003 16:51:41 +0200, 
> > > > ..lose "NEW".
> > > 
> > > Just what I said, wasn't it ?
> > 
> > ..nah, but you probably _meant_ it.  ;-)
> 
> I think he said it :). Look below.
> 
> 
> | $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> | $IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p tcp
> | \       -m tcp --dport 53 -j ACCEPT
> 
> -Payal

..wrong snippet.  ;-)  Reread the thread, and you'll see both I 
and Cedric weren't to clear on that we meant to say, we _implied_ 
things instead of actually _saying_ them, I snipped to hard and 
lost Cedric, and added to the confusion.  I'm talking about the 
"NEW" under this bit:
" > $IPTABLES -P FORWARD ACCEPT
  > 		     ^^^^^^ ".

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


