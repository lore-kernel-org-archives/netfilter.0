From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 3 May 2004 00:45:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405030045.56089.Antony@Soft-Solutions.co.uk>
References: <16533.31553.47397.464571@jane.localdomain> <200405030005.33281.Antony@Soft-Solutions.co.uk> <86y8oatnsf.fsf@poke.localdomain>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <86y8oatnsf.fsf@poke.localdomain>
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

On Monday 03 May 2004 12:25 am, Christer Ekholm wrote:

> Antony Stone <Antony@Soft-Solutions.co.uk> writes:
> > On Sunday 02 May 2004 11:50 pm, Christer Ekholm wrote:
> >> I have two IP-providers. And the faster one of them blocks smtp. I
> >> have been trying to route smtp to the slower while still routing
> >> everything else to the faster, without success. Is it possible at all?
> >
> > IProute2, http://lartc.org
>
> Thankyou for the answer. I have read that, and tried everything I
> could think of.

Ah.   Sorry if my previous response seemed a little terse - I did not realise 
you were aware of iproute2 and had tried so much of it already.

> I think my problem is that I need this to work from the host with the
> connections to the providers. (localhost).
>
> My next thought was to use iptables to add a SNAT rule. But SNAT is only
> allowed in POSTROUTING, and I think I would need that in OUTPUT

I would recommend that you do try such a rule, since POSTROUTING happens after 
OUTPUT (and FORWARD).

Try:

iptables -A POSTROUTING -t nat -p tcp --dport 25 -j SNAT --to 217.215.183.181

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


