From: Nuutti Kotivuori <naked@iki.fi>
Subject: Re: differences between win and unix tcp clients.
Date: Wed, 17 Mar 2004 23:13:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <871xnrnpmk.fsf@aka.i.naked.iki.fi>
References: <024b01c40b4f$e3341620$3f32a8c0@ds.ig.com.br> <20040316150746.GA8506@myinternet.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

Joshua Goodall wrote:
> On Tue, Mar 16, 2004 at 09:12:01AM -0300, Fabiano Reis wrote:
>> Conclusion: I think this was because the Windows implementation of
>> TCP detects something different on this connection, maybe it
>> detects in some way that there is a filter on the server side and
>> this is why the time for the error message take so long to appear.
>
> Basically yes.  I wouldn't say that Windows "detects something
> different".   I would say that the Windows client isn't properly
> interpretating the ICMP Port Unreachable message.

Incorrect. Receiving an ICMP port unreachable message should not cause
a break in the connection attempt - it should be retried until SYN
timeout, at which point it can be informed that there was an ICMP port
unreachamble message received during the period.

So Windows is acting properly.

>> Am I right? Is there a workaround for this problem? I need to make
>> windows think that the server is really "down" and that is why i?m
>> writting to you people.
>
> try extending your REJECT option:
>
> -j REJECT --reject-with tcp-reset
>
> which should give you the desired result, in exchange for being
> a crude pseudo-rejection.

If you wish to get immediate reject responses, TCP reset is the only
way. It has nothing more or less crude than sending an ICMP.

-- Naked



