From: John Spencer Blue's Explosion - DaNg! <user0@smtp.netcabo.pt>
Subject: Re: How to load modules needed by iptables?
Date: Mon, 17 Mar 2003 18:13:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030317181343.GA12081@neostage.ath.cx>
References: <20030317120947.67E3F1CBAA261@sm204.163.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030317120947.67E3F1CBAA261@sm204.163.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Bobo <boboaq@163.com>
Cc: netfilter@lists.netfilter.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Check 2 thing's: if you have modules autoload [x] in the kernel, and / or if the modules are built in - if so they
aren't able to be calling neither with modprobe or insmod ...

hope it helps

On Mon, Mar 17, 2003 at 08:09:42PM +0800, Bobo wrote:
> 
>         
>  How to load modules needed by iptables?
>    
>     While setup iptables firewall,I met a strange question.
>     I learned the following scripts frome the famous Iptables tutorail
>     wirtten by Oscar Andreasson.
>     If I input the following scripts ,and run it in a bash file.
>   ****************************
>      
>  /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
> ***************************
> and the message on the screen is :
> 
> 
>   modprobe: Can't locate module ip_tables
> modprobe: Can't locate module ip_conntrack
> modprobe: Can't locate module iptable_filter
> modprobe: Can't locate module iptable_mangle
> modprobe: Can't locate module iptable_nat
> modprobe: Can't locate module ipt_LOG
> modprobe: Can't locate module ipt_limit
> 
> If I input it by hand under command line mode each time a line,I
> would not get the error message.
>  Why?
>  What is  the difference between modprobe and insmod?
>  
>  If I run lsmod ,I could get the following messages:    
>       
>         Module                  Size  Used by
> ip_nat_irc              4416   0  (unused)
> ip_nat_ftp              3488   0  (unused)
> ip_conntrack_irc        2928   0  (unused)
> ip_conntrack_ftp        3824   0  (unused)
> ipt_MASQUERADE          1664   0  (unused)
> ipt_REJECT              3392   0  (unused)
> ipt_owner               1552   0  (unused)
> ipt_state               1024   0 
> ipt_limit               1360   0  (unused)
> iptable_nat            16528   2  [ip_nat_irc ip_nat_ftp ipt_MASQUERADE]
> iptable_mangle          2160   0  (unused)
> ip_conntrack           15824   4  [ip_nat_irc ip_nat_ftp ip_conntrack_irc ip_conntrack_ftp ipt_MASQUERADE ipt_state iptable_nat]
> ipt_LOG                 3856   0  (autoclean)
> iptable_filter          2128   0  (autoclean) (unused)
> ip_tables              10944  11  [ipt_MASQUERADE ipt_REJECT ipt_owner ipt_state ipt_limit iptable_nat iptable
> 
> It means there are already these modules needed by Iptables.
> Why the operation system displays "modprobe: Can't locate module ip_conntrack"?
> My operation system is REDHAT 7.2 and it was installed by default configuration.
> 
> Thanks
> 
>     
> 
> 

-- 
Best Regards, (com os mais sinceros cumprimentos);
Joao F. Serejo , Lisbon - PT : jfserejo@netcabo.pt

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=".gnupg.sig"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+USgnbs/4LNABBrURAlesAJwNZeZ2PTaNoCqBa1zeSZmq+xCAvACfVvFU
bEeqbhbpFi42/umDCUUafbg=
=pMRV
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--

