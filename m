From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Firewall setup at boot - trouble with setting up the LOG target
Date: Fri, 4 Jul 2003 11:12:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307041112.58290.Alistair@nerdnet.ca>
References: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com> <20030704024217.5e231e71.arnt@c2i.net> <chbagvsp3mcblk39e4n5u9od1ntja2ksb1@4ax.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <chbagvsp3mcblk39e4n5u9od1ntja2ksb1@4ax.com>
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
To: Michal Kepien <lordpopcorn@poczta.onet.pl>, Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

On July 4, 2003 03:39 am, Michal Kepien wrote:
> >>I've searched Google but found nothing worth interest.
> >
> >..not even in http://tldp.org/ ???
>
> Of course, I'm sorry... Looks like I'm an amateur in searching the
> Web, too. Well, this:
>
> http://tldp.org/LDP/intro-linux/html/sect_04_02.html
>
> helped me a bit (can't forget Jeremy :) however I still don't know
> what can be the cause of my problem (from what I've read, these
> iptables v1.2.3 entries really _shouldn't_ be where they are...)
>
> Michal Kepien

	What those entries suggest to me is that there are two
	copies of iptables code on the box.

	Try either of these commands... 
	locate iptables
	or
	find / -name iptables 
	and make sure ... 
	(use root for the find command -- in case the 
	regular user id can't see the directory where the
	second copy)
	
	If there is a second copy of iptables it could take some time
	and care to sort out which files are which.... but it can be done.


	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

