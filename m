From: "Mario Antonio" <dino@webjogger.net>
Subject: Re: Newbie Question - starting iptables as a service
Date: Sat, 19 Oct 2002 19:53:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <056501c277ca$af8d3000$13c01dd0@shadowfax>
References: <000401c27622$cb705ee0$3864a8c0@discmail.com> <20021017212717.VXCL292.mta03-svc.ntlworld.com@there> <02b501c2762d$567c5570$13c01dd0@shadowfax> <001701c277c7$8a675420$4101a8c0@ramasamy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Sundaram,

Thank you very much.

Mario

----- Original Message -----
From: "Sundaram" <sun@percipia.com>
To: "Mario Antonio" <dino@webjogger.net>
Sent: Saturday, October 19, 2002 7:30 PM
Subject: Re: Newbie Question - starting iptables as a service


> put your firewall script into /etc/init.d/ directory. Your script should
> accept start, stop  parameters.
>
> Use chkconfig command to add the firewall script as a service.
>
> look some file in the /etc/init.d directory.
> Cheers
> SR.
>
>
>
>
>
>
> ----- Original Message -----
> From: "Mario Antonio" <dino@webjogger.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, October 17, 2002 6:34 PM
> Subject: Re: Newbie Question - starting iptables as a service
>
>
> > Hi,
> >
> > I install iptables v1.2.7a, and I uninstall the old version through
rpm -e
> > iptables.
> > It seems that it trashed my init.d/iptables script
> >
> >
> > How can I start iptables as a service (linux 7.3)?
> >
> > How can I make iptables to reload the rules?
> >
> >
> > Regards
> >
> > ---
> > [This e-mail was scanned for viruses by Webjogger's AntiVirus Protection
> System]
> >
> >
>
> ---
> [This e-mail was scanned for viruses by Webjogger's AntiVirus Protection
System]
>
>

---
[This e-mail was scanned for viruses by Webjogger's AntiVirus Protection System]


