From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange logs...
Date: Sun, 11 Jan 2004 14:09:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111409.57475.Antony@Soft-Solutions.co.uk>
References: <002201c3d837$a6c70e90$1530a8c0@HUSH> <200401111340.27973.Antony@Soft-Solutions.co.uk> <004f01c3d84b$28d3c5a0$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004f01c3d84b$28d3c5a0$1530a8c0@HUSH>
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

On Sunday 11 January 2004 1:59 pm, Carlos Fernandez Sanz wrote:

> > Your IRQ/address etc setup looks fine to me, however there is clearly
> > something weird about the network hardware arrangement for you to get the
> > above-described ping behaviour.
>
> Such as the router and the switch being connected for no reason? I was
> obviously on crack when I set that up.... just found out that was the
> problem.... strange that everything would work perfectly for hours then
> stop working for minutes, etc... probably a table filling up in the switch
> or the router or both :-)

I'd put it down to the arp caches getting (mightily) confused about where to 
find things.   Never mind the degree to which a security engineer's eyebrow 
would rise upon realising your switch was connected to both sides of your 
firewall :)

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


