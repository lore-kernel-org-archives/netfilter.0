From: "Salim" <salim.si@askey.com.tw>
Subject: Re: iptables: can't set any ip address in rules
Date: Mon, 5 Sep 2005 14:53:13 +0800
Message-ID: <009701c5b1e6$8dfe12c0$205f030a@askeyrd3>
References: <005e01c5b1df$46279630$205f030a@askeyrd3>
	<62340.193.173.147.3.1125901998.squirrel@193.173.147.3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

> Hello all,
>     I am not able to set any rule that contsin ip address in the iptables.
> For example I give this command
>
>>iptables -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
           ^^^^^^^^^^^^^^^^
-t nat -A PREROUTING

You forgot "nat" after -t. Is that a typo or is this the actual rule you
are using ?

[Salim] sorry, that was a typo. the actual rule includes -t nat

> then, I issue the command >iptables -t nat -L.
>
> the result is
>
> Chain POSTROUTING (policy ACCEPT)
> target           DNAT
> prot              all
> opt                --
> source          anywhere
> destination    0.0.0.0   to:0.0.0.0

You just added a PREROUTING rule, and now you're checking if a POSTROUTING
rule is correct...
Furthermore : POSTROUTING doesn't have DNAT (it has SNAT) so the result of
"iptables -t nat -L" are probably not copy-and-pasted.

[Salim] again, it was another typo. it is PREROUTING chain. my linux is in
another machine, so I couldn't copy and paste. I typed in manually.

> I gave the command with verbose
>>iptables -v -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
>
> it showed
> DNAT all opt -- in * out * 0.0.0.0/0 -> 0.0.0.0 to:0.0.0.0

Again : -t nat

...
> I am confused. Any help will be greatly appreciated.

Don't know if it will solve your problem but :
- use "-t nat", not just "-t"
- check the chain you're adding a rule to (if it's PREROUTING, check
PREROUTING, not POSTROUTING)


Gr,
Rob





