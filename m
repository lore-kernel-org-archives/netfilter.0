From: Brad Chapman <kakadu_croc@yahoo.com>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 11:03:12 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231190312.98050.qmail@web40908.mail.yahoo.com>
References: <F154kB47qXLFfJNwPmx00000ffb@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F154kB47qXLFfJNwPmx00000ffb@hotmail.com>
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
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

Mr. Lamei,

--- Afshin Lamei <linux_st@hotmail.com> wrote:
> Hi,
> I want to make my linux box perform both bridging and firewalling(I mean 
> filternig,Nat,etc.)
> My linux box has 2 ethernet cards.
> 1- Is it necessary to disable ip address of both eth0 and eth1? if yes, how 
> to do that?

Yes. You have to remove all addressing data from the config files your distro uses
to configure eth0 and eth1. Then you need to use a kernel with CONFIG_BRIDGE and the
netfilter-bridge patches applied, and you need the bridge-utils package installed.
Those thre items can be found at kernel.org and
http://www.math.leidenuniv.nl/~buytenh/bridge. The Red Hat 8.0 2.4.18-14 kernel has
the appropriate infrastructure present.

Once all these conditions have been satisifed, all you need is these commands
somewhere in your startup scripts:

modprobe bridge (if the bridging code is modular)
brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
brctl stp br0 off
ifconfig br0 $IPADDR netmask $NETMASK up

> 2- When I try to add eth0 as an interface to the bridge (using brctl addif), 
> It says : "eth0:Setting promiscuous mode." what does it mean?

It means that brctl has used one of the netdevice ioctl()s to tell the kernel driver
to tell the NIC to accept all Ethernet frames traveling over the wire, regardless
of their destination. This is needed to make the bridge work; otherwise there would
be no bridge.

The website with the briding stuff has documents about bridging.

> thanks,
> --afshin
>

Brad


=====
Brad Chapman

Permanent e-mail: kakadu_croc@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

