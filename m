From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Accept DNS Suffix
Date: Tue, 20 Mar 2007 19:13:41 +0100
Message-ID: <000601c76b1b$7da62d00$0101000a@tanjian>
References: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
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

> I currently have an ISP that has multiple address ranges that I wish
> to accept in my iptables ruleset. Is it possible for me to use the
> DNS Suffix instead of the actual ip as they are currently dynamically
> assigned. e.g. iptables -s nsw.bigpond.net.au   (current assigned
> address is cpe-203-45-103-100.nsw.bigpond.net.au).

AFAIK: no.
An iptables rule will do a DNS lookup for a *hostname*, but only once:
when the rule is created.


Grts,
Rob


