From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Q: transform unicast to multicast with iptables?
Date: Wed, 2 Oct 2002 08:39:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002073945.WMWB28004.mta07-svc.ntlworld.com@there>
References: <871271734CB8D611B2A300306E1F108D250D49@NDS-IL-EX7>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <871271734CB8D611B2A300306E1F108D250D49@NDS-IL-EX7>
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

On Wednesday 02 October 2002 8:16 am, Karasik, Vitaly wrote:

> Is is possible to transform unicast UDP stream to multicast output with
> iptables NAT?

I don't see why not, so long as the original packets are not being created on 
the netfilter machine itself.

Just put a rule in the PREROUTING chain like so:

iptables -A PREROUTING -t nat -d a.b.c.d -j DNAT --to w.x.y.z

where a.b.c.d is the unicast address your application was sending to, and 
w.x.y.z is the mutlicast address you want to broadcast to.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

