From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec VPN Clients
Date: Thu, 5 Sep 2002 09:06:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020905080606.IAC5047.mta06-svc.ntlworld.com@there>
References: <1031131583.12374.16.camel@bigblue> <200209041418.g84EIvv31290@vulcan.rissington.net> <1031208898.12373.36.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031208898.12373.36.camel@bigblue>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 05 September 2002 7:54 am, Security wrote:

> On Wed, 2002-09-04 at 16:18, Antony Stone wrote:

> > Please, please, use IPsec instead of PPTP...
> >
> > http://www.freeswan.org
> >
> > Works a treat.   Interoperable with other IPsec systems.   Plenty of info
> > on getting it to work alongside and through netfilter.
> >
> > Antony.
>
> Quick question, would it be advisable to set up the VPN Server on the
> firewall, or to use another server?

I would recommend running FreeS/WAN on the Firewall machine, because it 
enables you to continue filtering traffic sent across the VPN.   If you put 
them on separate machines (VPN Gateway inside the Firewall of course) then 
the Firewall cannot tell what packets are inside the encrypted protocol 49 / 
50 traffic.

Also, if you use NAT on your Firewall, or have a single "road warrior" 
machine at the other end, putting FreeS/WAN on the Firewall will make things 
simpler.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi


