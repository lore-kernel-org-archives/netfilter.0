From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: Redhat linux disconnecting telnet session
Date: Thu, 14 Nov 2002 09:24:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008a01c28be9$7f19bff0$8c01a8c0@sundaram>
References: <000e01c28b5c$29656c40$8c01a8c0@sundaram> <200211141040.30235.dharmu@nsecure.net>
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
To: dharmu@nsecure.net, netfilter@lists.netfilter.org

Hi,

I am getting the login screen after some time, its closing the telnet
session.

Thanks

sample steps:
========
$ date
Thu Nov 14 08:37:10  2002

Administrator@SUNDARAM ~
$ telnet 192.168.1.180
Trying 192.168.1.180...
Connected to 192.168.1.180.
Escape character is '^]'.

Red Hat Linux release 7.1 (Seawolf)
Kernel 2.4.2-2 on an i686
login: ptce
Password:
Last login: Thu Nov 14 01:46:31 from 192.168.1.37
[ptce@ptcedemo ptce]$ ls
Desktop  nsmail
[ptce@ptcedemo ptce]$ who
ptce     pts/0    Nov 14 14:27
ptce     :0       Nov 11 15:51
ptce     pts/1    Nov 11 15:52
ptce     pts/2    Nov 12 21:46
ptce     pts/3    Nov 12 22:10
[ptce@ptcedemo ptce]$ ls
Desktop  nsmail
[ptce@ptcedemo ptce]$ Connection closed by foreign host.

Administrator@SUNDARAM ~
$ date
Thu Nov 14 09:22:10  2002



----- Original Message -----
From: "Dharmendra.T" <dharmu@nsecure.net>
To: "Sundaram Ramasamy" <sun@percipia.com>; <netfilter@lists.netfilter.org>
Sent: Thursday, November 14, 2002 12:10 AM
Subject: Re: Redhat linux disconnecting telnet session


> Could you say it briefly as the information given by you is not
sufficient.
> Like what happen when you enter
> #telnet host
>
> All these information will help us i solving your problem.
>
> Regards,
> Dharmendra.T
> Linux Security Expert
> www.nsecure.net
> dharmu@nsecure.net
> On Thursday 14 November 2002 03:02, Sundaram Ramasamy wrote:
> > HI,
> >
> > I have redhat Linux 7.1, when ever I do telnet session it disconnecting
> > after some time ( Even When I was doing something).
> >
> > How will I fix this?, What should I look for?
> >
> > Thanks
> > Sundaram
>
> --
>
>


