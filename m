From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: OT: Help for this project
Date: Tue, 15 Nov 2005 07:26:17 +0100
Message-ID: <001201c5e9ad$7ca43f00$0101000a@sterenborg.info>
References: <200511141905.24453.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511141905.24453.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

> And to go a bit further, I should say that I am moving away from
> scripts, in favour of iptables-save(8)/iptables-restore(8) rulesets.
> The initial ruleset can be developed by means of a script or editor,
> and I find that the rules files are much easier to maintain.

I think that's a matter of opinion.
Personally I prefer scripts because I can put remarks and empty lines in
them, grouping lines together that belong to each other so I know what I
did 1 year (or so) ago, without having to read over the complete
script/ruleset.
But everyone should do what (s)he wants in that matter ; the output of
iptables-save is practically in script form so it's not that I can't
read it.


Gr,
Rob


