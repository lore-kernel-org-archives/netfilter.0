From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: A Simple Question
Date: Fri, 12 Aug 2005 00:27:44 -0500
Message-ID: <42FC3350.3050701@riverviewtech.net>
References: <5c685153050809171164af25e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5c685153050809171164af25e4@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Robb Bossley wrote:
> I have been using Linux for quite some time, and I really enjoy the
> power that is available with netfilter.  Thank you for all of your
> input into the development and testing of it.
> 
> I have used other people's scripts to configure my firewall for a
> number of years, though I usually rolled my own kernels for this.
> 
> I have been reading the mailing list posts and it seems that most of
> you who are very knowledgeable with netfilter would propose a default
> policy of DROP on both the INPUT and FORWARD chains.
> 
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>  
> However, I have noticed that a number of what I would consider to be
> strong contenders in the market use default policies of ACCEPT and
> then have a DROP rule at the end of the tables / chain.
> 
> iptables -P INPUT ACCEPT
> iptables -P FORWARD ACCEPT
> ...................................(other stuff here)..........................
> iptables -A INPUT -j DROP
> iptables -A FORWARD -j DROP
> 
> I'm confused.  Which is preferred for security and why?  (Or is this
> just six of one, half a dozen of another?)

IMHO both methods are just about equally as effective.  However I believe that by using the default policy of a chain you can save adding a rule that must be traversed and thus make the processing just slightly faster.  On the other hand you can only set default policies on built in chains and thus you must do your own ""policy equivalent at the end of user defined chains with the rules that you have noticed.  Thus for uniformity it may just be easier for some firewall authors to stick with the method that they know will work in EVERY chain than to have to remember which chain they are in.  To me this issue is really 5.5 of one dozen and 6.5 of another, close but not exactly the same.



Grant. . . .

