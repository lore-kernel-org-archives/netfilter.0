From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: RE: FTP server
Date: 24 Mar 2003 10:24:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048523044.1188.16.camel@bordercollie>
References: <FD8F124A387AD6119F7900A0D218B321019C93@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019C93@hslex01.hslbz.local>
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

No. lsmod shows ip_conntrack, ipt_state,iptable_filter, ip_tables,
ipt_LOG .  This server is running RedHat 7.3 with a RH kernel, I have
not re-compiled the kernel.  I tried loading ip_conntrack_ftp once
(insmod) and lsmod showed it in, but unused.
On Mon, 2003-03-24 at 09:49, Rob Sterenborg wrote:
> > morning a people could not list the directory , no PASV 
> > connections were
> > being accepted.  The connection attempts showed in the log .  
> 
> Are ip_conntrack_ftp and ip_nat_ftp loaded (if not in the kernel) ?
> 
> 
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


