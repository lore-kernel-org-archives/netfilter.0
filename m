From: "Akos Szalkai" <szalkai@2fkft.com>
Subject: Re: mangle after nat in the postrouting chain
Date: Fri, 28 Nov 2003 19:13:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031128181358.GK5232@2fkft.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122EAA@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122EAA@alderaan.smgtec.com>
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

On Fri, Nov 28, 2003 at 09:50:46AM -0800, Daniel Chemko wrote:
> You are off basis. The System already routes twice.

Yes, I know that.  This is not my problem.

> The problem is that it SNAT's after you've already routed the packet.

This is much closer to my problem, see below.

>                 There is also the ROUTE patch, but it doesn't do what I
> want it to do (change the packet's route!!).

Yes, I am heavily using the ROUTE patch.  It does change the packet's
route.  I don't think you can live without it in a multiple independent
internet link environment.  Still, ROUTE targets are in the mangle
table, so still, it is SNAT-ed after you reroute the packets with a
ROUTE rule.

I can get around this by making a more complex rulebase, but it would be
much neater if I could mangle packets after NATing.  (The iproute2
solution you mentioned is also a possibility, but it has the drawback
that you have to use something else besides netfilter.  The ROUTE patch
is very similar but IMHO more manageable.)

Akos

-- 
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/

