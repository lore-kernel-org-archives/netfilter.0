From: Michael Hallager <michael@networkstuff.co.nz>
Subject: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 11:18:33 +0300
Message-ID: <200508152018.33866.michael@networkstuff.co.nz>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
Reply-To: michael@networkstuff.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
Content-Disposition: inline
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
To: 
Cc: netfilter@lists.netfilter.org, Eric Leblond <eric@inl.fr>

> I think correct should be:
> itpables -I INPUT -i lo -j ACCEPT (guess you misspeled it in the hurry)
> forward rule for loopback is not necesary, as long as i remember
> iptables -I OUTPUT -o lo -j ACCEPT;

HOLD ON,
This creates the following:
chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
DROP       all  --  202.71.136.166       anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere

Looking at the first and last rule displayed here, dosn't this have the effect 
of negating everything else?
Eg: Allow all, from anywhere to anywhere....

Am I missing something?

Michael Hallager
networkStuff ltd
www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883

