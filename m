From: Iva "Cabric" Cabric <ivac@gnjilux.srk.fer.hr>
Subject: Re: ULOG with -m state
Date: Tue, 26 Nov 2002 15:03:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126140315.GA12281@gnjilux.srk.fer.hr>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr> <200211241945.38762.netfilter@newkirk.us> <20021126105429.GB9457@gnjilux.srk.fer.hr> <200211260853.46333.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200211260853.46333.netfilter@newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

On Tue, Nov 26, 2002 at 08:53:46AM -0500, Joel Newkirk wrote:
> > >
> > > Does the ULOG target work in other uses, IE "iptables -A FORWARD -j ULOG"
> > > ?
> >
> > Nope, it gives same error:
> >
> > $ iptables -A FORWARD -j ULOG -p tcp -m state --state NEW
> > iptables v1.2.6a: You must specify `--state'
> >
> > with INPUT and OUTPUT, also same thing. I'm not doing anything special
> > (like NAT, conntrack, ftp, ...), just plain INPUT filtering.
> 
> Well, did you try the example I asked about?  I suspect not, because the 

Oh, I thought that you were referring to other chains...

> problem here seems to be that "-j ULOG" should be AFTER the state matching 
> part of the rule...  If I enter the line you used, I get the same '--state' 
> error, but if I put the target after the match (or remove the match, as per 
> my debugging suggestion above) it does NOT.

When using reversed order (first state, then ULOG) it works fine, thanks
for resolving this.

-- 
@

