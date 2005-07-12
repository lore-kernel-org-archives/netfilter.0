From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: dnatting
Date: Tue, 12 Jul 2005 17:03:12 -0400
Message-ID: <42D43010.3050406@SCampbell.net>
References: <57F9959B46E0FA4D8BA88AEDFBE58290742C@pxtbenexd01.pxt.primeexalia.com>	<20050712073407.GA30567@tranquility.scriptkitchen.com>	<20050712115918.GA19792@bender.817west.com>
	<20050712125001.GA2921@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050712125001.GA2921@tranquility.scriptkitchen.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter ML <netfilter@lists.netfilter.org>

Payal Rathod wrote:
>On Tue, Jul 12, 2005 at 07:59:18AM -0400, Jason Opperisano wrote:
>  
>>On Tue, Jul 12, 2005 at 03:34:07AM -0400, Payal Rathod wrote:
>>    
>>>Thanks this solved it. Thanks again.
>>>Now I am curious why Jason didn't suggest this.
>>>      
>>no need for curiosity--re-read the last sentence of my post.
>>    
>
>I had already did that and was wondering why the solution posted is
>not agreed upon by. Why do you call it half-baked?
>Payal
>  

I'll jump in :)  What we have done here is natted the connections in 
both directions.  If you could imagine walking from your living room to 
your bedroom by going out the garage and coming back in the front door 
first you start to feel the sillyness of this datapath.  Here's a few 
issues this technique raises:

* Increased utilization of the firewall
The firewall has to handle all the traffic which would normally just be 
switched internally, this makes the connection slower for the user and 
may impact other users as it uses resources on the firewall.  This is 
also true of the network path in general, for instance:  Say you put a 
gigabit card into the server, if you firewall only has 100mb card then 
your server really cannot use the GB card to any capacity, in fact it is 
limited to whatever bandwidth is left on the firewall interface.   You 
spend good money on switches and network design, utilize them.

* Dependency on the firewall to reach local traffic
Turn off you firewall and your users can't reach this server!  
Maintenance becomes an issue.

* Masquerading of the source computer
If you have a problem with a user it will be more fun tracking it 
because the source IP address will now always appear to be the firewall 
and, if this is after the fact, the connection may be long gone from the 
connection table leaving you unable to trace the problem.  Also, you 
can't use and IP based permissions on the server as, again, everyone 
will appear to be from the firewall

* Increased firewall rule complexity
Everytime another server is added in this fashion you need to maintain 
firewall rules, add lots of servers and it becomes real messy really 
fast.  One of the keys to having a secure firewall is having clean 
rules, the more cruft that gets in there the more likely a mistake will 
be made creating a hole in your firewall system.


So, having put a few of these negative forth allow me to suggest an 
alternative.  Split DNS, with split dns you will create a name, for 
example theserver.myplace.com and have a split view of it, that is, 
folks on the inside will get the inside address and folks on the outside 
will get the outside address.  No special routing is then required and 
you can use the server internally without any of the above issues.   I 
totally agree with Jason in suggesting that you investigate your name 
server rather than doing this bi-directional NAT.



