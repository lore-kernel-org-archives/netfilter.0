From: "Leonardo Rodrigues" <leolistas@solucoesip.net>
Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same rule ?
Date: Thu, 4 Jul 2002 12:18:52 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <019b01c2236e$1b62cdf0$3201a8c0@leonardo>
References: <005701c2236a$b69ddde0$0a01a8c0@ed> <200207041500.g64F0sU32109@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org


    Short answer: you cant. ipchains '-l' options doesnt exists in iptables

    Workaround: if you really need this to be done in one rule, you can
create a chain with those two commands and them use it.

iptables -N log_drop
iptables -A log_drop -j LOG --log-prefix "blabla: " .....
iptables -A log_drop -j DROP

    then, in your other chains, when you need something to be dropped and
logged, you can do:

iptables -A INPUT -s something -d someaddress -j log_drop

    This meets your 'requirements', as you're logging and dropping in the
SAME rule and you wont have unnecessary rules, as the 'log and drop' will be
created just once.

    Of course, '-j log_drop' can be used all the times you need it .....

    This should do the trick ..... in fact, you'll HAVE to do something like
this, as ipchains '-l' really doesnt exists here.

    I think you should think how good this can be. For example. I have a
script firewall based on iptables and I have lots of 'log drop' rules. Which
one of them has a special log-prefix setting. I use each one of them in
different situations, so my log shows exactly the dropped packet and WHERE
it was dropped ( log-preffix ). I can easily know if a packet was dropped on
the forward rule, input rule ......

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Thursday, July 04, 2002 12:00 PM
Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same rule ?


> On Thursday 04 July 2002 3:54 pm, Ed Street wrote:
>
> > Hello,
> >
> > Actually you can:
> > Rule #1 is to log
> > Rule #2 is to deny
>
> The original question was: I want to both DENY and LOG *in the same rule*.



