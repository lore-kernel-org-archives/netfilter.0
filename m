From: Bernd Strebel <b.strebel@digitec.de>
Subject: Re: strange behavior of connlimit matching rules
Date: Wed, 19 May 2004 12:18:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AB3480.6030405@digitec.de>
References: <40A9B4A4.2000201@digitec.de> <20040518074343.GA5990@nic.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040518074343.GA5990@nic.fr>
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
Cc: Stephane Bortzmeyer <bortzmeyer@nic.fr>

Thanks for your reply. I've re-arranged the rules to something like

-P DROP

--state RELATED,ESTABLISHED -j ACCEPT
--connlimit-above n -j LOG
--state NEW --syn ! --connlimit-above n -j ACCEPT
--state NEW --syn ... -j ACCEPT
... many ... -j ACCEPT

... many ... -j LOG to log packages which aren't accepted

and now it is working.

But, with this solution every SYN packet first has to be checked against 
the connlimit rule before entering the ACCEPT block. I would prefer to 
do the logging of unwanted packages after all accepting rules and this 
works fine with all the other matching modules (e.g. time, owner).

And,  I am still worried about the fact, that a package no longer 
matches against a connlimit rule after it was checked against a 
!connlimit rule ...

Stephane Bortzmeyer wrote:
> On Tue, May 18, 2004 at 09:00:52AM +0200,
>  Bernd Strebel <b.strebel@digitec.de> wrote 
>  a message of 63 lines which said:
> 
> 
>>Along with the implementation of a simple rule set ( ACCEPT connections 
>>if ! --connlimit-above n and LOG connections if --connlimit-above n) we 
>>experienced a strange behavior of the connlimit matching module:
>>
>>Rule #m:   ...-m connlimit   --connlimit-above n -j LOG
>>Rule #m+1: ...-m connlimit ! --connlimit-above n -j ACCEPT
>>
>>works fine, while
>>
>>Rule #m:   ...-m connlimit ! --connlimit-above n -j ACCEPT
>>Rule #m+1: ...-m connlimit   --connlimit-above n -j LOG
>>
>>works not (no match on rule #m+1).
> 
> 
> No idea but what I do (and it works) is:
> 
> Rule #m:   ...-m connlimit   --connlimit-above n -j LOG
> Rule #m+1: ...-m connlimit   --connlimit-above n -j REJECT
> ... Other rules, which may accept
> 
> 


