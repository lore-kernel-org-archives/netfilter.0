From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: Re: iptables installation problem
Date: 05 Sep 2003 13:52:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062762770.6117.19.camel@drs0.manchotnetworks.net>
References: <20030905111754.9251.qmail@web20701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030905111754.9251.qmail@web20701.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter-users <netfilter@lists.netfilter.org>

Hi,

To save yourself a bit of trouble, you may download the Red Hat rpm for 

iptables-1.2.8-8.80.2.i386.rpm

either using up2date, or checking their ftp site.

ciao

charles


On Fri, 2003-09-05 at 13:17, ads nat wrote:
> Hi,
> I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server.
> I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. 
> by using command 
> "tar -xf iptables-1.2.8.tar"
> It has created iptables-1.2.8 directory in which all files are extracted.
>  
> I don't know how to go further.
> I tried make and make install.
>  
> Then when i gave command "/etc/rc.d/rc.local"
> it gives following error.
> "[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local
> SIOCDELRT: No such process
> RTNETLINK answers: File exists
> SIOCADDRT: File exists
> SIOCADDRT: File exists
> iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>  
> How to go ahead now?
>  
> Thanks
> 
> 
> 
> 
> ---------------------------------
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software




