From: Kristofer <kristofer@cybernetik.net>
Subject: Re: Port forwarding (non-NAT)
Date: Tue, 19 Feb 2008 11:01:00 -0600 (CST)
Message-ID: <6626020.13031203440460640.JavaMail.root@lodge.cybernetik.net>
References: <47BAB430.9040104@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47BAB430.9040104@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Huh ? What is that SMTP software which requires tu run one separate 
> daemon for each listening port ? If it can use inetd, you can have it 
> listening on multiple ports even without a single idle daemon running 
> (except inetd itself of course). 

I mis-spoke. What I am using requires me to manually edit configuration files after every single upgrade (annoying), so I'd rather adjust the settings outside of the software (such as iptables) so I can simply have it remain listening on port 25 only and I do not have to edit configuration files to tell it to also listen on port 587. 


> Port forwarding is a form of destination NAT. It can also be done with a 
> TCP relay such as 6tunnel, but the final destination sees only the relay 
> address, not the original source address. Not very convenient for 
> logging or access control. 

I assumed that may be the case.  I'm coming out of a world of IPFW and trying to get a complete grasp on iptables.  It's getting more clear each day. :-)


> > if iptables on the same computer as the smtp server: 
> > 
> > iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW -d 
> > $IP_OF_MAIL_SERVER -j REDIRECT --to-ports 25 
> > 
> > else: 
> > 
> > iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW -d 
> > $IP_OF_MAIL_SERVER -j DNAT --to $IP_OF_MAIL_SERVER:25 
> 
> Note that the second rule also works on the server itself. 

I went with the first rule, and it is working thus far.

Thanks!

Kristofer
