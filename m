From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables
Date: Fri, 28 Jun 2002 14:45:25 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206281345.g5SDjWU16865@vulcan.rissington.net>
References: <3CEF4F3E000255CB@ims3c.cp.tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@samba.org

On Friday 28 June 2002 2:28 pm, luigicart@tin.it wrote:

> Hi I'm Luigi.When I digit a whichever iptables command the shell say:
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o :init_module:
> Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO orIRQ parameters
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o: insmod
> /lib/modules/Kernel/net/ipv4/netfilter/ip_tables.o failed
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o :insmod
> ip_tables failed
> iptables v1.2.3: can't initialize iptables table 'filter' :iptables who?
> (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.

You could try compiling all your netfilter stuff into the kernel instead of 
loading it as modules - that's the way I always do it.

 

Antony.

