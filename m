From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: multiple source
Date: Wed, 31 Mar 2004 22:36:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403312236.22252.Antony@Soft-Solutions.co.uk>
References: <BAY15-F45vJd9o0PRxd0002ad8a@hotmail.com> <200403312221.15895.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403312221.15895.Antony@Soft-Solutions.co.uk>
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

On Wednesday 31 March 2004 10:21 pm, Antony Stone wrote:

> > MASQs="192.168.0.2 192.168.0.102"
> >
> > for MASQ in $MASQs;
> > do
> > 	iptables -t nat -A POSTROUTING -s $MASQ -o ppp0 -j MASQUERADE
> > done
>
> The reason why this doesn't work is that it creates two rules for you; the
> first one says "for any address other than 192.168.0.2, MASQUERADE", the
> second one says "for any address other than 192.168.0.102, MASQUERADE".
> Every single address will match at least one of those rules, therefore
> everything gets MASQUERADEd.

Sorry!   I quoted the wrong section from your rules to give this explanation.

I should have quoted this loop instead (the one with the negation):

> for MASQ in $MASQs;
> do
>     iptables -t nat -A PREROUTING -s ! $MASQ -p tcp --dport 80 -j REDIRECT
> --to-port 8080
> done

Hopefully you can see the logic of what I explained earlier, and how it 
applies to these two rules, even though I misquoted previously.

Oops :)

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


