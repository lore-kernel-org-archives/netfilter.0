From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: RE: FTP server
Date: 24 Mar 2003 12:15:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048529739.1189.23.camel@bordercollie>
References: <000d01c2f22f$4848f200$0401000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2f22f$4848f200$0401000a@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Netfilter List' <netfilter@lists.netfilter.org>

I loaded ip_conntrack_ftp, the nat_ftp received a lot of errors.  
However I am not nat'ing on the box, the NAT is done by the firewall
ahead of it.   With ip_conntrack_ftp loaded the passive connections are
no longer making the log file, so it appears to be working.   Does this
have to be loaded manually or should it be loading automatically?

On Mon, 2003-03-24 at 12:00, Rob Sterenborg wrote:
> > No. lsmod shows ip_conntrack, ipt_state,iptable_filter, ip_tables,
> > ipt_LOG .  This server is running RedHat 7.3 with a RH kernel, I have
> > not re-compiled the kernel.  I tried loading ip_conntrack_ftp once
> > (insmod) and lsmod showed it in, but unused.
> 
> Unused doesn't mean it doesn't work. It means that *no other* module is
> using *that* module.
> Here you can see what I mean.
> 
> [rob@firewall rob]$ lsmod
> <...>
> ip_conntrack_ftp        5056   1 (autoclean)
> ip_nat_ftp              3936   0 (unused)
> iptable_nat            20820   3 (autoclean) [ipt_MASQUERADE ip_nat_ftp]
> ip_conntrack           26508   5 (autoclean) [ipt_MASQUERADE ipt_state
> ip_conntrack_ftp ip_nat_ftp iptable_nat]
> <...>
> 
> iptable_nat is being used by ipt_MASQUERADE and ip_nat_ftp.
> ip_conntrack is being used by ipt_MASQUERADE, ipt_state,
> ip_conntrack_ftp and ip_nat_ftp.
> 
> A look in my original modules (RH73 kernel 2.4.18-3) and I'm seeing :
> ip_conntrack_ftp.o
> ip_nat_ftp.o
> Which means you should have these too.
> 
> You need it for passive ftp.
> So, if you load the modules ; does it work then ?
> 
> 
> Gr,
> Rob
> 
-- 
Chris D. Garringer
Toshiba International
LAN/WAN Supervisor
713-466-0277 x3756
Certified Solaris Administrator
Microsoft Certified Engineer (NT)
RedHat Certified Engineer


