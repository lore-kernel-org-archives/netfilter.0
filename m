From: "Allan Kissack" <lists@kissack.freeserve.co.uk>
Subject: Re: iptables from cgi script
Date: Tue, 3 Jun 2003 07:28:51 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c329a1$c8074920$2c00a8c0@local.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D8B@wardrive.citadelcomputer.com.au>
Reply-To: "Allan Kissack" <lists@kissack.freeserve.co.uk>
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org


----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Allan Kissack" <lists@kissack.freeserve.co.uk>;
<netfilter@lists.netfilter.org>
Sent: Monday, June 02, 2003 10:33 PM
Subject: RE: iptables from cgi script


> No your not missing anything.. But I like this idea for the fact that
someone who wants to maliciously attack your site and also open your
firewall if the commands can be run by other than root..
>
> Your only (more secure) option is to authenticate the users and allow them
to write the rules required to a file or a database and get root to read
these and apply them in a seperate process..
>
>
> or just use webmin ;) www.webmin.com
>
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>
>
> -----Original Message-----
> From: Allan Kissack [mailto:lists@kissack.freeserve.co.uk]
> Sent: Monday, June 02, 2003 5:35 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables from cgi script
>
>
> I used to be able to list my rules via a cgi script but since moving to
> redhat 9 (iptables 1.2.7a) it fails. The reason given is "can't initialize
> iptables table `filter': Permission denied (you must be root) Perhaps
> iptables or your kernel needs to be upgraded." which is absolutely
accurate
> (because I get this logging in as a local user and running
/sbin/iptables -L
> too) - but I need to know how to achieve this.
> I tried altering the group on /sbin and /sbin/iptables and adding my local
> user to that, but still it fails.
>
> Am I missing something really obvious?  Either way, your assistance/advice
> is welcome.
>
> Thanks
>
> --
> Allan
>
>
>
>
>
>
>


