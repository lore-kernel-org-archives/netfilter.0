From: Gerald Galster <Gerry@gerry.de>
Subject: Re: IP Accounting and performance
Date: Tue, 10 Dec 2002 15:18:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4BE7D007-0C4A-11D7-A598-00039376F59E@gerry.de>
References: <200212091021.44030.netfilter@newkirk.us>
Mime-Version: 1.0 (Apple Message framework v548)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091021.44030.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; delsp="yes"; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>> I have a firewall currently running kernel 2.4.20, Celeron 1 GHz and
>> 512 MB of RAM
>> that should do traffic accounting based on single IP addresses. I
>> thought it would be more
>> efficient to use iptables than writing a standalone application using
>> pcap or the like.
>
> You will probably get your best speed (and usability of the resulting
> data) if you just use one of the accounting daemons that can be paired
> with the ULOG target, and use the two rules below.  Google/linux search
> on "Netfilter ULOG accounting"
> http://www.google.com/linux?num=100&restrict=linux&hl=en&lr=&ie=ISO- 
> 8859-1&q=netfilter+ULOG+accounting&btnG=Google+Search
> turns up some useful links...  That said, if you still want to do it
> directly in your ruleset, read on! :^)

This is exactly what I've been looking for, thanks a lot :)
I really searched the net but didn't find anything suiting my needs ...
so I ended up with a perl-Skript parsing my iptables -L -v -x -n output.

>> I need to add filtering rules like
>>
>> /sbin/iptables -A FORWARD -o eth0 -s ip_address/32
>> /sbin/iptables -A FORWARD -i eth0 -d ip_address/32
>
> Is this the complete rule?  If you don't have a target it will count  
> and
> pass to the next rule.  Since all you said you are doing is counting
> that may seem OK, but it means that each packet is tested against each
> and every rule...

I have -j ACCEPT as my target.

> Your end result can be twelve user-defined chains, one in/one out for
> each subnet, and twelve rules in FORWARD.

[...]

> Also, as someone else suggested, you can have a script that creates the
> rules in a loop, or perhaps six (one per subnet).  Fanciest and most
> efficient traversal-wise would be a balanced tree of rules, (which  
> could
> bring you down to a max of 2-3 dozen tests for each packet, instead of
> thousands right now) the construction of which is beyond the scope of
> this reply... :^P

As I suppose that configuring a ULOG-Accounting may take some time
I will try to split up the load using those b-trees in the meantime   
because
I need to get this done real soon.

Thanks to all for your quick help.

Gerald



