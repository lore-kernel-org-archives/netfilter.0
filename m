From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: iptables
Date: Fri, 28 Jun 2002 10:00:54 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJEEJDDOAA.jpatterson@asgardgroup.com>
References: <3CEF4F3E000255CB@ims3c.cp.tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CEF4F3E000255CB@ims3c.cp.tin.it>
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
To: luigicart@tin.it, netfilter@samba.org

do an lsmod and see if ipchains is loaded.  My bet is that you're on a stock
RH box. Those load up ipchains whether you want them to or not.  If I'm
right, a command like `rmmod ipchains` should clear it up until the next
reboot, and `chkconfig ipchains off` and/or `chkconfig ipchains --del
ipchains`  should keep the problem from coming back.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of luigicart@tin.it
> Sent: Friday, June 28, 2002 9:29 AM
> To: netfilter@samba.org
> Subject: iptables
>
>
> Hi I'm Luigi.When I digit a whichever iptables command the shell say:
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o :init_module:
> Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO orIRQ parameters
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o: insmod
> /lib/modules/Kernel/net/ipv4/netfilter/ip_tables.o
> failed
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o
> :insmod ip_tables
> failed
> iptables v1.2.3: can't initialize iptables table 'filter' :iptables who?
> (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>
> Why???????
> Thak you very much
> Luigi
>
>
>
>
>
>


