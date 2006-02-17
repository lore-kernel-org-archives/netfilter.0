From: angico <angico@yahoo.com>
Subject: Re: can't -j TARPIT
Date: Fri, 17 Feb 2006 13:18:22 -0800 (PST)
Message-ID: <20060217211822.75635.qmail@web36803.mail.mud.yahoo.com>
References: <200602171050.17706.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602171050.17706.ramoni@databras.com.br>
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

ok, andre. i tried it, but the answer is still the same. also, i tried
the example given in the man page:
# iptables -A INPUT -p tcp -m tcp --dport 80 -j TARPIT
and the answer is the same.
surprisingly, if i issue the command
# iptables -p tcp -j TARPIT --help
besides the help for the "-p tcp" option it says "TARPIT takes no
options".
any other hints?
btw, iptables --version  ==> 1.3.4
tia,
angico.


--- Andre Ramoni <ramoni@databras.com.br> wrote:

> Use -p tcp
> On Friday 17 February 2006 07:01, angico wrote:
> > hi, all!
> > i'm trying this:
> >
> > iptables -A INPUT -s 1.2.3.4 -j TARPIT
> >
> > but iptables says "no chain/target/match by that name", although
> > libipt_TARPIT.so is present in /lib/iptables/
> >
> > i'm running kernel 2.6.15. any hints on what's wrong?
> > thanks in advance,
> > angico.
> >
> >
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam protection around
> > http://mail.yahoo.com
> 
> -- 
> Andre Guimaraes
> Databras Informatica
> Redes / Servidores Linux
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

