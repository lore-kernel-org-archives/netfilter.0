From: "John Arthur" <lists@davey.net.au>
Subject: RE: Accept DNS Suffix
Date: Wed, 21 Mar 2007 10:35:31 +1030
Message-ID: <000001c76b4c$a41fea30$f6801eac@tau>
References: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
Reply-To: lists@davey.net.au
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
To: 'Dominic Caputo' <jec6jec6@gmail.com>, netfilter@lists.netfilter.org

Dominic

> I currently have an ISP that has multiple address ranges that 
> I wish to 
> accept in my iptables ruleset. Is it possible for me to use 
> the DNS Suffix 
> instead of the actual ip as they are currently dynamically 
> assigned. e.g. 
> iptables -s nsw.bigpond.net.au   (current assigned address is 
> cpe-203-45-103-100.nsw.bigpond.net.au).

 
 dig -t ptr 254.127.45.203.in-addr.arpa

2 minutes with dig.. Tells me that Bigponds block for nsw is
203.45.64.0/18

CPE-203-45-64-0.nsw.bigpond.net.au.
CPE-203-45-127-255.nsw.bigpond.net.au.


Which is what you want but I'm not sure I'd want to let all the bots
through my firewall

John




