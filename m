From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: iptables 1.2.7a management problem
Date: Wed, 4 Dec 2002 11:49:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c29bb5$16a62bd0$8c01a8c0@sundaram>
References: <F117cdEc83LUEM7RAlu00028454@hotmail.com>
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
To: Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.samba.org

if your using redhat Linux.

1. create a shell script that will accept stop/start parameter and put in in
the /etc/init.d directory.

2. use chkconfig command to add your script as a service


you can see look some file in the /etc/init.d directory.

Thanks
SR

----- Original Message -----
From: "Afshin Lamei" <linux_st@hotmail.com>
To: <netfilter@lists.samba.org>
Sent: Wednesday, December 04, 2002 11:28 AM
Subject: iptables 1.2.7a management problem


> Hi,
> How can I deal with iptables like a service? I've installed it according
to
> the netfilter's guide, after that, I expected that I could deal with it as
a
> service, but I coudn't.
> Do I need to manually setup iptables after each system boot??
> --afshin
>
> _________________________________________________________________
> The new MSN 8: advanced junk mail protection and 2 months FREE*
> http://join.msn.com/?page=features/junkmail
>
>


