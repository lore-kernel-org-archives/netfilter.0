From: Iva "Cabric" Cabric <ivac@gnjilux.srk.fer.hr>
Subject: Re: ULOG with -m state
Date: Mon, 25 Nov 2002 09:16:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125081629.GA12186@gnjilux.srk.fer.hr>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr> <200211241945.38762.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200211241945.38762.netfilter@newkirk.us>
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

On Sun, Nov 24, 2002 at 07:45:38PM -0500, Joel Newkirk wrote:
> > $ iptables -A ssh -j ULOG -p tcp -m state --state NEW
> >
> > reports:
> >
> > iptables v1.2.6a: You must specify `--state'
> > Try `iptables -h' or 'iptables --help' for more information.
> >
> > but using DROP works fine:
> >
> > $ iptables -A ssh -j DROP -p tcp -m state --state NEW
> 
> Does the ULOG target work in other uses, IE "iptables -A FORWARD -j ULOG" ?

Nope, it gives same error:

$ iptables -A FORWARD -j ULOG -p tcp -m state --state NEW
iptables v1.2.6a: You must specify `--state'

with INPUT and OUTPUT, also same thing. I'm not doing anything special
(like NAT, conntrack, ftp, ...), just plain INPUT filtering.

-- 
@

