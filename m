From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Anyway to Limit Max TCP/IP Connections
Date: Thu, 20 May 2004 19:17:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201917.53703.Antony@Soft-Solutions.co.uk>
References: <20040520162454.48928.qmail@web40702.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040520162454.48928.qmail@web40702.mail.yahoo.com>
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

On Thursday 20 May 2004 5:24 pm, Real Cucumber wrote:

> Is there anyway on a Redhat 8 or 9 Linux box to limit
> the maximum number of simultaneous TCP connections for
> everything and not just a particular service?

A rather crude way of doing this would be

echo $maxconns >/proc/sys/net/ipv4/ip_conntrack_max

No doubt you could do something more sophisticated with the connlimit match?

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


