From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 11:24:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151124.00040.Antony@Soft-Solutions.co.uk>
References: <40556EE6.6040809@stupar.homelinux.net> <200403151057.13169.Antony@Soft-Solutions.co.uk> <40558E8D.2010303@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40558E8D.2010303@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 15 March 2004 11:07 am, Sasa Stupar wrote:

> Antony Stone pravi:
>
> > 1. Now that it isn't working, do you get any errors in your proxy log
> > file, or does it think there are no requests?
> > 2. What source IPs does your proxy server allow access for?
> > 3. Does the proxy server know how to route back to the clients?
> > 4. Do you have a suitable ESTABLISHED,RELATED rule on your firewall to
> > allow back the replies?   (I expect so, but you didn't post your full
> > ruleset earlier, so I can't be sure...)
> > 5. Where are the clients on the network in relation to the firewall and
> > the proxy server (please don't tell me they're on the same subnet as the
> > proxy...?)
>
> 1. I've got nothing in the squid log but in the browser I get Timeout
> error, so looks like squid doesn't get any requests
> 2. It allows for LAN IP's
> 3. Yep
> 4. Yep $IPT -A STATE -m state --state ESTABLISHED,RELATED -j ACCEPT
> 5. Some of them are on the same subnet and some not.

Okay, first off, you will not be able to do what you want for clients which 
are on the same subnet as the proxy server - the only way to get them 
communicating through the firewall is to SNAT the packets on the way out of 
the firewall.   If you want their real IPs to be seen by the proxy, configure 
the clients to use the proxy instead of doing it transparently.

Second, are you experiencing the same problem (clients can no longer access 
proxy) for both clients which are on the same subnet as the proxy (I expect 
this to fail) and clients which are not?

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


