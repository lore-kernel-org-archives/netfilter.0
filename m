From: Silvio Fonseca <silvio.listas@pizzaroot.com.br>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 10:23:58 -0300
Message-ID: <200702261023.58952.silvio.listas@pizzaroot.com.br>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
	<45E2DAB3.8010201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45E2DAB3.8010201@gmail.com>
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
To: netfilter@lists.netfilter.org

Hello Askar,

I believe he already has this rule:
"Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    MASQUERADE  all  --  anywhere             anywhere"

Actually, he is able to access Internet (??)...

Angico,

Your problem doesn't seem to be related to IPTables since you can access the 
Internet just fine. If you can access "http://facilcotacao.com/" but can't 
access "http://facilcotacao.com/autopecas/", unless you are using layer7 
filtering, you problem is somewhere else. I tried to access the site and saw 
it redirects to "http://www.facilcotacao.com.br/autopecas/", I believe you 
should check for DNS resolution, etc.

Best Regards,

Silvio Fonseca

> angico, on 02/26/2007 05:45 PM [GMT+500], wrote :
> > hi, everybody!
> > i have a problem that you may help to solve, surely.
> > i have a server (a) connected to the internet via eth0/ppp0 (adsl).
> > another computer (b) is connected to this server thru eth1, and it should
> > reach the internet via the server which is its gateway. and so it did!...
> > up to a month ago. i think nothing's changed. all i did was a
> > re-installing of my gentoo based system on the server, due to problems on
> > the hard-disk. but firewall rules (iptables) remain the same. and the
> > netted computer can't reach the internet anymore! things got exquisite
> > because:
>
> Try this rule on  your gateway..
>
>
> iptables -A POSTROUTING -t nat -o ppp0 -j MASQUERADE
>
> Thanks

