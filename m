From: "Stephan Kessler" <stephankessler@gmx.de>
Subject: RE: Server can't send :-/
Date: Wed, 3 Sep 2003 16:09:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006801c37224$ef009dd0$0000fea9@kessler.local>
References: <1062596599.18242.19.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062596599.18242.19.camel@kermit>
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
To: 'Ralf Spenneberg' <lists@spenneberg.org>
Cc: 'Netfilter' <netfilter@lists.netfilter.org>

> I suspect your machine is warpy.yomeganet.biz. The last input 
> rule drops all incoming tcp-traffic. You a just accepting 
> traffic going to 22,80,21,20,etc. Since I do not actually 
> understand your ruleset, you just might want to insert the 
> following rule before this DROP rule 
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 


Thx thats it!

Greetings,
Stephan


