From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: Excluding IP ranges from masquerade rules
Date: Mon, 13 Oct 2003 22:39:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066099141.22093.28.camel@tarkus>
References: <1066038290.5801.35.camel@tarkus> <1066051471.4193.63.camel@kermit>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1066051471.4193.63.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

Thanks to all for the great reponses and choices, but I like 
Ulrich Gebauer's way the best :-)

iptables -t nat -A POSTROUTING -s x.x.x.x/x -j ACCEPT
iptables -t nat -A POSTROUTING -s y.y.y.y -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE

Makes the most sense to me and will be the easiest way for me to teach
others.

Thanks again,
Ted



On Mon, 2003-10-13 at 09:24, Ralf Spenneberg wrote:
> Am Mon, 2003-10-13 um 11.44 schrieb Ted Kaczmarek:
> > I presently exclude 1 ip block in POSTROUTING using
> > "! X.X.X.X/24" . Is their a way to specify multiple ranges that are 
> > excluded?
> Only if you can combine them in one network, like:
> 10.0.0.0/8 and 11.0.0.0/8 can be written as 10.0.0.0/7
> 
> > or
> > Is their a way to have POSTROUTING only have affect on a certain
> > interface?
> You can use -o eth0 to specify the interface in you rules.
> 
> Cheers,
> 
> Ralf


