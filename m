From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: RE: mangle, filter & FORWARD
Date: Tue, 1 Jun 2004 22:17:16 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040602051716.80453.qmail@web41705.mail.yahoo.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E320@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E320@alderaan.smgtec.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


--- Daniel Chemko <dchemko@smgtec.com> wrote:
> 
> > As you can see, there is no reference to either
> the
> > mangle table or filter table...
> 
> The filter table is always implied if not explicitly
> stated otherwise

Perfect, thank you.
 
> >so where does the
> > system append the rule?  An obvious answer might
> be
> > that the system appends the rule in both FORWARD
> > chains, (if there is two chains).
> 
> Nope (thankfully)
I know now that there are two FORWARD chains,
mangle.FORWARD and filter.FORWARD.  They have the same
name and are the same chain structure, they will
contain completely different rules.


> The MANGLE table's are not for filtering data.
> Mangle's are typically
> used for inline parameter modifications like
> changing the TOS/MSS/etc...

Yep, I got that much so far

> The order on any given chain is
> raw/mangle/filter/nat. 

I thought the order for a forwarded packet was
mangle/nat/mangle/filter/mangle/nat

>Not all tables
> are run on each chain. Eg. FORWARD table only has
> mangle/filter.

Ok, you must mean "not all the chains are used in each
table", right?  "The FORWARD chains only appear in the
mangle and filter tables", yes?
 
> 
> For a really good refreence on iptables in general,
> check out
> http://iptables-tutorial.frozentux.net/

Right, this document is the source of some my
confussion, for several reasons but mainly because it
never mentioned that although the chains have the same
name and have the same function, they are in fact
different chains.  I think this is because use of the
mangle.FORWARD chain would be a rare occurance and
most of the time it is going to be empty.  



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

