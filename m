From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: RE: service iptables stop; hangs constantly on red hat 8
Date: 28 Oct 2003 08:24:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067325854.1470.2.camel@drs0.manchotnetworks.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C5AC@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C5AC@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter-users <netfilter@lists.netfilter.org>

hi george,

yes -- i too recompiled iptables from the .src.rpm and did a rpm -Uvh
--force and acheive the same results on two different machines.

i'll recompile the kernel and try that as well.

thanks!

charles


On Mon, 2003-10-27 at 22:24, George Vieira wrote:
> that is very weird. I would use the latest kernel sources and latest iptables (source not rpm) and recompile the lot. I'm sure it'll then work as I'm running the same verion but not RPMS..
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
> > -----Original Message-----
> > From: lartc@manchotnetworks.net [mailto:lartc@manchotnetworks.net]
> > Sent: Tuesday, 28 October 2003 12:49 AM
> > To: netfilter-users
> > Subject: service iptables stop; hangs constantly on red hat 8
> > 
> > 
> > hi all,
> > 
> > i have an up2date redhat 8 installation with iptables-1.2.8-8.80.2
> > 
> > as required by my setup, i insmod ip_conntrack_ftp and ip_nat_ftp to
> > handle connection tracking of ftp sessions.
> > 
> > if a connection has been established, and it becomes closed, 
> > or if there
> > is a current ftp session, "service iptables stop" hangs the machine
> > while trying to remove modules. here's an example, but it does not
> > necessairly hang on this module --
> > 
> > 
> > [root@aztec root]# ps -eaf | grep mod
> > root      1728  1672 99 14:39 pts/0    00:01:07 modprobe -r ip_nat_ftp
> > root      1952  1910  0 14:40 pts/1    00:00:00 grep mod
> > 
> > i have the belief that it is comming from ip_conntrack. in any case, i
> > can make it happen always (i.e. the system hang). processor 
> > time goes to
> > 99% and a reboot is necessary.
> > 
> > has anyone else come accross this? is there something to be flushed
> > prior to removing the modules?
> > 
> > many thanks!
> > 
> > charles
> > 
> > 
> > 
> > 



