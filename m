From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSEC and other non tcp/udp/icmp blocking
Date: Mon, 14 Oct 2002 19:50:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021014185021.NXFH27697.mta05-svc.ntlworld.com@there>
References: <41791.64.86.49.17.1034369123.squirrel@www.icafe.co.tz> <200210141917.40231.fabrice-marie-sec@ifrance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210141917.40231.fabrice-marie-sec@ifrance.com>
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

On Monday 14 October 2002 12:17 pm, Fabrice MARIE wrote:

> Hello Cyberdude,
>
> On Saturday 12 October 2002 04:45, Mitesh P Choksi wrote:
> > Dear All,
> > How does netfilter work with other protocols apart tcp/udp/icmp?
> > I am trying to either block or account IPSec traffic.
> > Regards,
> > Cyberdude Murli
> > The Earth
>
> to block ipsec (IIRC):
> # iptables -A FORWARD -p 50 -j DROP
> # iptables -A FORWARD -p 51 -j DROP
> # iptables -A FORWARD -p tcp --dport 500 -j DROP

Close, but not quite....   IKE uses UDP port 500, not TCP port 500.

Also, it uses port 500 for both source and destination, so if you wanted to 
be more specific you could be:

iptables -A FORWARD -p udp --sport 500 --dport 500 -j DROP

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

