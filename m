From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: how to delete a group of rules (nfcan: addressed to exclusive
	sender for this address)
Date: Sat, 27 Nov 2004 13:12:50 -0500
Message-ID: <20041127181250.GA14797@salty>
References: <200411271718.iARHIeQC018403@gourmet.spamgourmet.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200411271718.iARHIeQC018403@gourmet.spamgourmet.com> (from
	+nfcan+jimlaur+ec99bc9f19.alexis#tpys.com.ar@spamgourmet.com on
	Sat, Nov 27, 2004 at 12:17:44 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.11.27 12:17, Alexis - alexis@tpys.com.ar wrote:
> Hi all, im coding a frontend for iptables based on php and mysql.
> 
> But i have an issue when i try to delete a group of rules, it cant be done.
> 
> suppose this
> 
> a chain called "x1"
> 
> delete the chain implies
> 
> - empty the chain
> - delete all  rules that reference the chain

For what its worth, I would empty the chain
after I deleted the references.

> 
> the first line is easy to do  with iptables -F x1 , but if (as an example)
> in filter::INPUT i have 2 or more references to this chain, executing
> iptables -D INPUT -j x1 will delete only the first one and not all rules
> that references x1.

I believe that any rule can be deleted by specifying the exact parameters
used to create it, that is changing the -A for instance to -D, leaving
the rest of the command unchanged (for example -p tcp, or -d x.x.x.x, etc.).

Surely each rule in a table has a unique pattern, or why would it be there?

This does not, as you say, allow for deletion of a group of related commands,
however, it should let you accomplish what you need to do.

Just delete the rules iteratively, one at a time,
creating the delete commands from those used to add each rule.

I hope that helps.

Jim


