From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: stop accepting new connections on port 80
Date: Wed, 14 Dec 2005 20:33:40 +0000
Message-ID: <20051214203339.GE21572@metastasis.org.uk>
References: <20051207123420.V66917@uberwoo.hedgpeth.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051207123420.V66917@uberwoo.hedgpeth.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Dec 07, 2005 at 12:38:51 -0800, Spam User wrote:

> I've been trying to figure out how to get iptables to stop accepting
> new connections on port 80 while letting the existing connections
> finish up what they're doing.
> 
> I thought it would be as easy as removing the rule that allows new
> connections and leaving the rule that allowed related and established
> connections, but when I remove the rule that allows new connections,
> all connections stop working.

When you say "all connections", what do you mean?

Do you mean TCP connections, or browsing sessions?  I've never really
looked at it in detail but I'm wondering if you're expecting HTTP
sessions to stay up while someone views a site, whereas *IIRC* while a
user web-browses numerous separate HTTP connections are opened and
closed in quick succession.  Therefore as soon as you stop accepting new
TCP connections all web browsing will stop, even for people with a
half-loaded page.

Why do you want to stop new sessions?  If we take a step back [1] maybe
there's a different solution to your overall problem.

[1] "take a step back"... sorry, next thing you know we'll be running
ideas up the flagpole.

-- 
morals are for little people
Jenny Solzer

