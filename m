From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: block port 137
Date: Tue, 3 Aug 2004 11:16:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040803091658.GC1067@der-frank.org>
References: <200408030717.59289.Antony@Soft-Solutions.co.uk> <1091518405.4693.15.camel@dc.nucleussoftware.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1091518405.4693.15.camel@dc.nucleussoftware.com>
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

* Dhananjoy Chowdhury <dhananjoy@nucleussoftware.com>  3. Aug 04:
> On Tue, 2004-08-03 at 11:47, Antony Stone wrote:
> > On Tuesday 03 August 2004 7:04 am, Dhananjoy Chowdhury wrote:
> > > try dropping packets both with dport 137 and also with sport 137.
> > I disagree.

Me too.

> Your terminology is very much true but David has already applied  the
> rule
> #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP
> but then also he isn't able to stop output traffic through port 137.
> So in this scenario he should appply the above rule for both --sport 
> and --dport.
> #iptables -I FORWARD -p udp -s 0/0 --dport 137 -j DROP
> #iptables -I FORWARD -p udp -s 0/0 --sport 137 -j DROP

Well, from my point of view he should add to these rules:
# iptables -P FORWARD DROP
# iptables -F FORWARD

Then he should fix his network by imaging compromised hosts for further
analysis, flatting them and installing them from trusted sources.  Later
he should look for an appropriate L.A.R.T. for the users of the machines
and maybe go online again.

YMMV,
 regards, Frank.
-- 
Sigmentation fault

