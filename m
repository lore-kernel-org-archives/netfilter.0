From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 20:04:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406152004.45544.Antony@Soft-Solutions.co.uk>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <1087322336.2054.12.camel@localhost> <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
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

On Tuesday 15 June 2004 7:41 pm, Jonathan Villa wrote:

> I have more information now.
>
> Here is the background:
> A machine running MySQL is to be locked down for access only to a select
> group of people working from home and people at the office, hence the
> xx.xx.xx.0

Is the MySQL machine on the same subnet as the office people trying to access 
it, or is there a firewall in between, with the MySQL on a DMZ network?

If it's the latter, are you sure your office machines aren't being masqueraded 
in some way by the firewall when they try to access the MySQL server, so that 
it sees an address on the firewall instead of the real address of the 
clients?

> I've noticed that the script works fine for anyone who is not on the
> network but for those who are, well the rules block access to them all the
> time.

I suggest you add a LOGging rule at the bottom of the INPUT chain and see what 
source address the packets which are not being ACCEPTed are coming from.

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


