From: Rinse Kloek <Rinse@solcon.org>
Subject: RE: DSCP support in iptables 1.2.8
Date: Thu, 17 Apr 2003 09:16:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <70A180F483A4D611B18600E0810285C45CED15@EXCHANGE>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Ilguiz Latypov' <ilguiz@nit.ca>, Isabelle Labbe <isabelle.labbe@crc.ca>
Cc: netfilter@lists.netfilter.org

How can you use the DSCP target in ip route? Anyone can help me with that?

-----Oorspronkelijk bericht-----
Van: Ilguiz Latypov [mailto:ilguiz@nit.ca]
Verzonden: woensdag 16 april 2003 22:11
Aan: Isabelle Labbe
CC: netfilter@lists.netfilter.org
Onderwerp: Re: DSCP support in iptables 1.2.8



On Wed, 16 Apr 2003, Isabelle Labbe wrote:

> Can anyone confirm that the DSCP target works in iptables 1.2.8 (or
> 1.2.7a) ?

Works for me with iptables 1.2.7a from netfilter.org.  I tested the
command you mentioned and it worked.

I am running Debian unstable, but that doesn't matter.  I think the
iptables capabilities depend on

  a) The kernel configuration.  Check out the CONFIG_IP_NF_* options in
     the kernel configuration file and reconfigure/recompile the kernel
     source code if needed.  A quick look at the content of the kernel
     netfilter directory may also help:

     ls /lib/modules/KERNEL_VER/kernel/net/ipv4/netfilter/

     DSCP match kernel module name: ipt_dscp.o
     DSCP target kernel module name: ipt_DSCP.o

  b) The availability of iptables shared object modules.  Check out

     ls /usr/{,local/}lib/iptables/

     DSCP match userspace module name: libipt_dscp.so
     DSCP target userspace module name: libipt_DSCP.so

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117



