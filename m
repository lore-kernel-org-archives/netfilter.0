From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: Route aggregaton/deaggregation from eth to g.703 and vica versa
Date: Fri, 9 Feb 2007 19:35:43 -0200
Message-ID: <20070209193543.1898f097@babalu.inexo.com.br>
References: <20070209162256.7218b902@pulsar.inexo.com.br>
	<457351.86118.qm@web56212.mail.re3.yahoo.com>
	<20070209192503.0239e853@babalu.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070209192503.0239e853@babalu.inexo.com.br>
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

On Fri, 9 Feb 2007 19:25:03 -0200
"Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:

> On Fri, 9 Feb 2007 11:39:12 -0800 (PST)
> Elvir Kuric <omasnjak@yahoo.com> wrote:
> 
> > I will read about this. The main " problem" is how
> > encapsulate ethernet packets into multiple g.703
> > lines, transfer it over multiple g.703 lines and join
> > them again at other end.
> 
> you don't have to worry about this. As soon as you have PPP running over
> every interfece card, the rest is easy.

OK. I small word of crutial advice: you MUST have full control of both
sides each of the g.703 link for this to work. I mean linux on both sides
will help.

The EQL protocol is not that popular so every device supports it.

Ethy


