From: J Kim <jindor@yahoo.com>
Subject: Re: ways to lookup or query rules?
Date: Tue, 5 Oct 2004 20:38:04 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041006033804.67518.qmail@web50903.mail.yahoo.com>
References: <002201c4ab53$f4264300$2001a8c0@mantis>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002201c4ab53$f4264300$2001a8c0@mantis>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan <jonathan@jonathan.abda.net>
Cc: netfilter@lists.netfilter.org

Well, as far as I know there's no facility for lookup or query. I would take
the same approach as you do. One slight improvement is use iptables-save
instead of -l option. The output of the former command looks better in that its
format is much closer to what you key in.

Personally I put another layer between my code and iptables so that all the
iptables-related commands will go through it, letting it take care of the
chores.

Jinsuk Kim

--- Jonathan <jonathan@jonathan.abda.net> wrote:

> Hi, if this is a classic case of RTFM go ahead and shoot me.
> 
> Is there an option or a command to look up rules in your iptables,
> especially if there's the ability to search by rulenumber or some
> kind of key?
> 
> The only solution I've seen so far, is to use the -l option, capture the
> output, and then process it, but that's a very dirty solution.
> I'm writing a script that needs to update the iptables automatically, and I
> assume it needs to know whether ot use the add or update
> option by verifying whether a rule exists, in order to decide whether to
> update the rule, or add a new one.
> 
> Jonathan
> 
> 
> 



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

