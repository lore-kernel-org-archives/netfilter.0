From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Preventing port scanning using iptables ?
Date: Sat, 5 Aug 2006 01:00:10 -0700 (PDT)
Message-ID: <20060805080010.4988.qmail@web56204.mail.re3.yahoo.com>
References: <44D4456C.5050203@mymail.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44D4456C.5050203@mymail.ch>
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
To: Ruprecht Helms <rhelms@mymail.ch>
Cc: netfilter@lists.netfilter.org

Thanks Ruprecht, but I still can not figure out how
the  rule for that will look, is there any example? 
I want my  firewall be persistent on port scanning,
how write iptables rule ? 

Regards

--- Ruprecht Helms <rhelms@mymail.ch> wrote:

> Elvir Kuric schrieb:
> > Hi all, 
> >  I am trying to implement proper firewall to my
> > network using iptables 
> > and I  have to admit that I am amazing by amount
> of
> > iptables features 
> > it offers.
> >  But I can not understand is there any way to
> prevent
> > port scanning 
> > using iptables? 
> 
> Yes by checking the tcp-flags. The connections are
> not established
> because only the port is checked if it is
> reachabele.
> 
> Regards,
> Ruprecht
> 
>
-------------------------------------------------------------------
> Ruprecht Helms IT-Service & Softwareentwicklung
>              let worktools be individual
> 
> Web: http://www.rheyn.de
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

