From: Marco Colombo <netfilter@esiway.net>
Subject: Re: again problem with alias / virtual interface
Date: Thu, 22 Jul 2004 10:53:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407221014550.31223-100000@Megathlon.ESI>
References: <40FEA42C.3050006@pbl.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FEA42C.3050006@pbl.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

On Wed, 21 Jul 2004, Aleksandar Milivojevic wrote:

> Michael Sconzo wrote:
> > On Wed, Jul 21, 2004 at 05:34:29PM +0200, Marco Colombo wrote:
> > 
> > 
> >>But the whole idea of 'virtual interfaces' is obsolete. The linux kernel
> >>(and thus iptables) knows only of physical interfaces and ip addresses.
> >>You can set a label for each ip address, but that's only a trick to make
> >>the old ifconfig work. Labels are, well, just labels, the kernel doesn't
> >>need them at all. If you're using 'ip' to configure ip addresses, you
> >>can forget about labels (but ifconfig won't work).
> >>
> > What is the proper way to do it, tried poking around on google, maybe
> > I'm just looking for the wrong thing.  Or is it even a proper way to do
> > it?  I have a box that is using kernel bridging so I have an IP on the 
> > bridged interface, but would like to have it accessable via another IP 
> > as well.
> 
> IMHO, the proper way of doing it is using configuration files.  And let 
> the init.d scripts configure your interfaces (majority of which still 
> use good old ifconfig).

I hope that most of them have been upgraded. On Fedora Core 2:

# egrep '\<ifconfig\>' /etc/sysconfig/network-scripts/ifup
# egrep '\<ip\>' /etc/sysconfig/network-scripts/ifup 
        # Link on Physical device needs to be up but no ip required
            ip -o link set dev ${PHYSDEV} up
        curdev=`ip -o link | awk -F ':' -vIGNORECASE=1 '/$HWADDR/ { print $2 }'`
      /sbin/ip link set dev ${DEVICE} down 2>/dev/null
      /sbin/ip addr flush dev ${DEVICE} 2>/dev/null
      /sbin/ip link set dev ${DEVICE} up
    /sbin/ip link set dev ${DEVICE} down
    /sbin/ip link set dev ${DEVICE} up
   ip link set dev ${DEVICE} address ${MACADDR}
   ip link set dev ${DEVICE} mtu ${MTU}
        ip link set dev ${DEVICE} down >/dev/null 2>&1
    NUMDEFROUTES=`ip -o route | \
        ip route del default dev ${DEVICE}
         ip link set dev ${REALDEVICE} up
        ip link set dev ${REALDEVICE} $(toggle_value arp $ARP)
    if ! ip link set dev ${REALDEVICE} up ; then
    if ! LC_ALL=C ip addr ls ${REALDEVICE} | LC_ALL=C grep -q "${IPADDR}/${PREFIX}" ; then
         if ! ip addr add ${IPADDR}/${PREFIX} \
        ip route replace ${NETWORK}/${PREFIX} ${SRC} ${WINDOW:+window $WINDOW} dev ${REALDEVICE}
            ip route replace default via ${GATEWAY} ${WINDOW:+window $WINDOW} ${SRC}
            ip route replace default ${SRC} ${WINDOW:+window $WINDOW} dev ${REALDEVICE}
    ip route replace 169.254.0.0/16 dev ${REALDEVICE} 


FC2 supports the ethX:Y model via /etc/sysconfig/network-scripts/ifup-aliases,
which does use ifconfig (but as I showed before, that can be done with
ip, too). The whole point about ip/ifconfig is that the kernel uses the
ip model (the other way around, of course, ip uses the kernel model).
You MAY use ifconfig, if you know what you're doing.

I agree there's no reason to stop using ifconfig, but you should definitely
learn how the kernel works.


Michael, there no 'proper' way. If you have a 'simple' configuration,
have the standard scripts handle it, and even use the standard tools
to manipulate it (GUI or CLI). For anything more complex, you may
need to customize them by hand (with a text editor). If you're doing
something unusual, you can write your own init script. As you see,
there's no proper way.

On FC2, you use the system-config-network utility (available both in
GUI and TUI versions), for anything standard. It will create small
files like this one:
# cat /etc/sysconfig/network-scripts/ifcfg-eth0
# DEC|DECchip 21142/43
DEVICE=eth0
BOOTPROTO=dhcp
HWADDR=00:C0:F0:4D:8A:9A
ONBOOT=yes
TYPE=Ethernet

Now, this interface gets its address via DHCP, but you can write:
BOOTPROTO=static	# or 'none'
IPADDR=10.10.10.1
NETMASK=255.255.255.0

For custom setup, the standard scripts invoke /sbin/ifup-local if 
it exists. That way you can customize the configuration for your
needs.

Finally, nothing prevents you from rewriting /etc/rc.d/init.d/network,
which is the main init script that drives all the network configuration.
Some BSD folks would do that anytime, and I agree that one single
script with 10 or so commands it's much more readable that tens of 
scripts invoking each other and reading tens of config files here and
there. B-) For 'weird' setups I'd do that anytime, but of course
you need do know well what you're doing. The following is a standard
setup with one network card in a recent (2.6.x) Linux kernel:

# ip address show
1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: sit0: <NOARP> mtu 1480 qdisc noop 
    link/sit 0.0.0.0 brd 0.0.0.0
4: eth0: <BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:c0:f0:4d:8a:9a brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.13/24 brd 10.10.10.255 scope global eth0
    inet6 fe80::2c0:f0ff:fe4d:8a9a/64 scope link 
       valid_lft forever preferred_lft forever

# ip route show
10.10.10.0/24 dev eth0  proto kernel  scope link  src 10.10.10.13 
169.254.0.0/16 dev eth0  scope link 
127.0.0.0/8 dev lo  scope link 
default via 10.10.10.254 dev eth0 


If you're to write your own script, you have to get it right or something
won't work.

.TM.
-- 
      ____/  ____/   /
     /      /       /			Marco Colombo
    ___/  ___  /   /		      Technical Manager
   /          /   /			 ESI s.r.l.
 _____/ _____/  _/		       Colombo@ESI.it


