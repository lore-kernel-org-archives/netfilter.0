From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: VPN "Punch-through"
Date: Sat, 21 Sep 2002 08:48:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921074858.ORWJ11421.mta03-svc.ntlworld.com@there>
References: <1032584055.1252.23.camel@rbhome.inside.thedataarc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1032584055.1252.23.camel@rbhome.inside.thedataarc.com>
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

On Saturday 21 September 2002 5:54 am, ryanb@thedataarc.com wrote:

> Hi
>
> I help operate an ISP, delivering bandwidth to 50-60 people in Kansas.
> Right now, I have a cell that is all public IPs.  I'd like to convert it
> to a private subnet (10.1.2.3) as we've done in other scenarios.
>
> I have two computers currently using a VPN router to link to a remote
> office (outside our realm).
>
> If we convert to a filtered private system, is it possible to use a
> "DMZ" virtual IP approach to NAT traffic to the VPN routers on the
> inside?  (Moving our current VPN IP to a virtual on the netfilter
> router.)
>
> Interesting, weird I know.  Possible?

Depends what sort of VPN you're using.

IPsec in tunnel mode - perfectly possible, not difficult.

PPTP - possible but challenging to get working.

IPsec in transport mode - forget it.

Hope this helps,

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

