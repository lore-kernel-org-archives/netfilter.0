From: Jason Opperisano <opie@817west.com>
Subject: Re: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 11:57:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096387044.2330.54.camel@wolfpack.ljm.dom>
References: <1096400937.3163.134.camel@alkaloid.netup.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096400937.3163.134.camel@alkaloid.netup.ru>
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
To: netfilter@lists.netfilter.org

On Tue, 2004-09-28 at 15:48, Abylai Ospan wrote:
> Hello, all !
> 
> May be this question in FAQ but I can't find it ;-( I have 3 (or more)
> identical rules in one (for example - INPUT) chain.
> If I do command:
> iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT 
> 
> the first rule is deleted only. Is there any command line option to
> remove all identical rules in one chain ?
> 
> wbr, Abylai

AFAIK, there is no way to make "-D" delete multiple, identical rules. 
if you have that rule in there multiple times, hit <up-arrow><enter> a
few times until you get:

  iptables: Bad rule (does a matching rule exist in that chain?)

if you use a script to flush/reload rules, you normally won't run into
this situation.

-j

-- 
Jason Opperisano <opie@817west.com>


