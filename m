From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: Redhat 7.2 Kernel
Date: Tue, 9 Jul 2002 19:41:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070919410901.02824@Lms>
References: <Pine.LNX.4.44.0207091015020.4405-100000@e33.eng.roonetworks.com>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0207091015020.4405-100000@e33.eng.roonetworks.com>
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
To: Matthias Kattanek <mattes@mykmk.com>, "R. Sterenborg" <rsterenborg@xs4all.nl>, "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Cc: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>

On Tuesday 09 July 2002 19:20, Matthias Kattanek wrote:
> On Tue, 9 Jul 2002, R. Sterenborg wrote:
> > ----- Original Message -----
> > From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
> > Subject: Redhat 7.2 Kernel
> >
> > > Does the default install kernel of RH7.2 have iptable support already
> > > compiled in it?
> >
> > Yes it does.
>
> Nope, that is not exactly true.
> All RedHat 7.x distribution with a 2.4.x kernel offer iptables as a
> module. (same as ipchains)
>
> By default RH distries have ipchains activated. So in case you attempt
> e.g. 'iptables -L' you will encounter an error message.
>
> no worries. easiest way around is to rename /etc/sysconfig/ipchains
> to /etc/sysconfig/ipchains.notinuse. Then reboot the box and run
> 'iptables' and it will autoload the respective module.
>
> mattes

I prefer to use:

#chkconfig ipchains --level 2345 off.
#chkconfig iptables --level 2345 on.

because it stops the ipchains script from being run at all (which is what you 
really want).

If you mv /etc/sysconfig/ipchains, then /etc/init.d/ipchains will still be 
run, but exit because /etc/sysconfig/ipchains is missing.

In any case, /etc/init.d/iptables uses lsmod to find out if ipchains is 
running, and exits should this be the case.

Jan Humme.

