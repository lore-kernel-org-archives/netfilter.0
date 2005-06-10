From: Rob Sterenborg <rob@sterenborg.info>
Subject: Re: specifying -m state --state NEW (Was : --policy DROP kills
	everything?)
Date: Fri, 10 Jun 2005 21:13:36 +0200
Message-ID: <1118430816.8207.44.camel@sonea.sterenborg.info>
References: <42A78007.7080504@edoceo.com>
	<20050609062511.8AD978EDCEB@smtp.sterenborg.info>
	<20050610180827.GA6276@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050610180827.GA6276@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-06-10 at 14:08 -0400, Jason Opperisano wrote:
> On Thu, Jun 09, 2005 at 08:26:38AM +0200, Rob Sterenborg wrote:
> > If -m state is not specified then, in my experience, -m state --state
> > NEW is assumed (someone please correct me if I'm telling nonsense here)
> > so your rules *will* allow new connections.
> 
> that is; indeed, nonsense.

In that case I don't understand why both rules seem to do the same job.
Both :

$ipt -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

and :

$ipt -A INPUT -i eth0 -m state --state NEW -p tcp --dport 22 -j ACCEPT

only work in combination with :

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

At least, here it does.

I was just looking at Oskar's tutorial where I read that the state
matches are explicit thus have to be specifically loaded for them to
work. Does this means that if I don't specify a state match in a rule,
the rule just won't match any state ?

Assuming that that's true in the first rule, a packet coming in on port
22 would be accepted regardless of state ?
In practice I know that that's not true because when I use the first
rule without accepting RELATED or ESTABLISHED, I *cannot* connect to
sshd. When I add the RELATED,ESTABLISHED accept rule, I *can* connect to
sshd. (And this is how I would expect it to work.)

So, what is the difference in specifying and not specifying --state NEW
in a rule ?


Gr,
Rob



