From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Server can't send :-/
Date: Sat, 6 Sep 2003 19:38:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309061938.58991.Alistair@nerdnet.ca>
References: <006801c37224$ef009dd0$0000fea9@kessler.local>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006801c37224$ef009dd0$0000fea9@kessler.local>
Content-Disposition: inline
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
To: Stephan Kessler <stephankessler@gmx.de>, 'Ralf Spenneberg' <lists@spenneberg.org>
Cc: 'Netfilter' <netfilter@lists.netfilter.org>



	in reality, just to conserve rule scans and sanity, you want 
related,established rules to be at the TOP of the list ... once the conntrack 
has been accepted you don't want to have it fall through a list of rules.

On September 3, 2003 10:09 am, Stephan Kessler wrote:
> > I suspect your machine is warpy.yomeganet.biz. The last input
> > rule drops all incoming tcp-traffic. You a just accepting
> > traffic going to 22,80,21,20,etc. Since I do not actually
> > understand your ruleset, you just might want to insert the
> > following rule before this DROP rule
> > iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> Thx thats it!
>
> Greetings,
> Stephan

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

