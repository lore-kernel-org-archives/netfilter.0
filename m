From: "Philippe Anctil" <z77y16@hotmail.com>
Subject: Re: safe default chain policies
Date: Fri, 02 Apr 2004 10:21:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY16-F48j6fVCjmpp100021caf@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Antony,

I will leave the nat chains open. In fact I already did that yesterday. I 
really makes my life better.

May I ask what are your arguments in favor of putting filter output and 
forward chains to drop?

As far as my understanding goes, the output chain is primarily important for 
traffic involving the firewall box itself. For example, you need rules in 
this chain if you want to ftp from the firewall to the outside. You need 
rules also if you want the firewall box to communicate freely with the local 
network. Why wouldn't we want the box to complete connections? Once traffic 
passed the input chain, why wouldn't I want it to cross the output chain as 
well?

My reasoning is similar with the forward chain. If traffic is allowed 
through the input  chain, it is very likely it is allowed to cross the 
forward chain too.

In other words, rules in OUTPUT and FORWARD appear redundant to me.

How a default accept policy in output and forward OUTPUT can compromise my 
network? Are there obvious cases I should know about?

Thanks for sharing!

>
> > I set all of input and nat chains to DROP.
>
>Do NOT set the nat table policies to DROP.   The nat tables are for address
>translation, not for filtering (DROP is a filtering operation).
>
> > I am thinking to set all chains to ACCEPT except the INPUT chain.
>
>No.   Set default DROP on INPUT, FORWARD and OUTPUT, then add rules to 
>allow
>the traffic you want.

_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous !  
http://fr.ca.search.msn.com/


