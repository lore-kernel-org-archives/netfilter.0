From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Setting up default policy to 'DROP' problem
Date: Tue, 03 Feb 2004 08:49:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401FA6F3.60805@Loudoun-Fairfax.com>
References: <BAY8-F28s41rVEzTKRg00032017@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F28s41rVEzTKRg00032017@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

ads nat wrote:

> I have setup DMZ firewall as per Oskar Anderson tutorial on 
> Netfilter.org site.
>
> When I set up default policy to drop for INPUT, OUTPUT and FORWARD 
> chains as mentioned in the tutorial my connection drops.
> I am attaching my iptables rules listing.
> Is there anything wrong in the IPtable rules.
> When I setup default to ACCEPT everything works fine.
> Help appreciated.
> Thanks
>

I've responded to your postings before, so I was hoping someone new 
might give this a shot. I know that you've been trying for months to get 
this configured, but you're having problems with the basics and you've 
still got a long way to go. Oskar's tutorial is a great place to start, 
but you may want to try reading some other documentation to see if it 
helps you. You may also want to look at using a tool like shorewall to 
help you create rules.

That said, I'll do what I can to help you. Try using: iptables -L -n -v 
-x > /var/log/iptables.report. Open up iptables.report in a text editor 
and turn off word wrap so you can see one rule on each line. When I 
review rules I make the font really small and print the ruleset out 
'landscape' oriented so I can see a whole rule printed out on a line.

Look at the number of packets hitting each rule. I think you'll be 
surprised where the packets are going. Remember that the rules are 
transversed from top to bottom in each ruleset. As soon as a packet 
matches a rule it stops (except logging) and doesn't go to the next rule 
in the chain. Try starting out with a new script and only a couple 
rules. Test the configuration and then use iptables -L -n -v -x again to 
see if the packets are going where you think they should. For more 
details you can also add logging rules then check /var/log/messages to 
see the packet flow in more detail. Once you have the basic routing 
working you can add the filtering rules back in. If you have problems 
post your new rules back to the list so we can see what you've done.

Good Luck

Jeff


