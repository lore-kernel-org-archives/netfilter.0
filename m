From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: PPTP through masquerading gateway
Date: Tue, 9 Jul 2002 00:31:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001c01c226cf$3bc72d70$0401000a@win2k>
References: <000d01c226c1$9a049390$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000d01c226c1$9a049390$6b01a8c0@s3ac>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.samba.org

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On
> Behalf Of Rowan Reid
> Subject: RE: PPTP through masquerading gateway
>
> I've been trying to get this to work. with no luck. I've used the POM
module which
> fails everytime I try to patch my kernel 2.4.4 and up
> no luck even on a freshly downloaded kernel. other patches work but pptp
does not. I
> tried another patch which patched my 2.4.18 kernel
> but all my connections fail to make it to my server.  I woudl love to talk
to
> at least one person who HAS gotten this to work.

Ok.. I did it this way.
I'm going through it step by step, so don't flame me for describing steps
that seem obvious.

I used :
- kernel 2.4.17 (Because the patch is for *that* kernel. I'm no hacker so
I'm not going to try it on another kernel...).
- the PPTP kernel patch from
http://www.impsec.org/linux/masquerade/ip_masq_vpn.html.
- iptables-1.2.6a.
- the default gcc from RH-7.3 (2.96, I know, I know...)

Untar the kernel source to /usr/src/linux.
Untar the patch to /usr/src.
Untar iptables to /usr/src/iptables-1.2.6a

cd /usr/src
patch =96p0 < netfilter-pptp-2.4.17-rev2.patch

cd /usr/src/iptables-1.2.6a
make pending-patches KERNEL_DIR=3D/usr/src/linux

If all went well go ahead and configure your kernel.
cd /usr/src/linux
make xconfig (or whatever you like to use)

Check all (networking) options that apply.
There are two new options in the kernel config :
- Networking options -> IP: Netfilter Configuration -> PPTP protocol support
- Networking options -> IP: Netfilter Configuration -> PPTP verbose debug
Make sure you check the first.
If you want ***LOT'S*** of logging in syslog, also check the second.
(You could try that, see what it's all about when you got it to work and
after that recompile the kernel without it ;o] You don't need it for normal
operation.)

make dep clean
make bzImage (or some other ?)
make modules modules_install

Copy the ./arch/i386/boot/bzImage file to /boot
Copy ./System.map to /boot
Change your lilo.conf or grub.conf to let the new kernel show up in the
bootmanager. (Lilo needs you to run "lilo" to reflect the changes.)

cd /usr/src/iptables-1.2.6a
make KERNEL_DIR=3D/usr/src/linux
make install KERNEL_DIR=3D/usr/src/linux

Reboot and make sure to boot the new kernel.

Now for the forwarding rules.
I'm taking values from this post. Since it's not mentioned, I take eth0 as
the LAN NIC.
http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutorial.
html#TRAVERSINGOFTABLES
Table 3-1. We are forwarding packets -> our packets will be going through
the PREROUTING chain and the FORWARD chain, so we'll need rules for both of
them.

iptables -A FORWARD -p tcp -i ppp0 -o eth0 -d 10.1.1.15 --dport 1723 -j
ACCEPT
iptables -A FORWARD -p 47 -i ppp0 -o eth0 -d 10.1.1.15 -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external-ip> --dport
1723 -j DNAT --to 10.1.1.15:1723
iptables -t nat -A PREROUTING -p 47 -i ppp0 -d <external-ip> -j DNAT --to
10.1.1.15

Of course you need to set additional rules for your firewall to work.

Well, this should do it. It does for me.
Hope I was of help and wasn't talking too much rubbish.

Rob


