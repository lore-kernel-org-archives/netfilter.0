From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through masquerading gateway
Date: Mon, 8 Jul 2002 16:44:10 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000401c226d9$5cc37fb0$6b01a8c0@s3ac>
References: <001c01c226cf$3bc72d70$0401000a@win2k>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001c01c226cf$3bc72d70$0401000a@win2k>
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
To: "'R. Sterenborg'" <rsterenborg@xs4all.nl>, netfilter@lists.samba.org



> I used :
> - kernel 2.4.17 (Because the patch is for *that* kernel. I'm=20
> no hacker so I'm not going to try it on another kernel...).
> - the PPTP kernel patch from=20
> http://www.impsec.org/linux/masquerade/ip_masq_vpn.html.
> - iptables-1.2.6a.
> - the default gcc from RH-7.3 (2.96, I know, I know...)

I'm using 2.4.18 I know not designed for the patch, My FS only=20
Works with 2.4.18. Someone told me the 2.4.17rev2 Patch works
With 2.4.18 it doesn't unless you use

patch =96p1 < netfilter-pptp-2.4.17-rev2.patch


>=20
> Untar the kernel source to /usr/src/linux.
> Untar the patch to /usr/src.
> Untar iptables to /usr/src/iptables-1.2.6a
>=20
> cd /usr/src
> patch =96p0 < netfilter-pptp-2.4.17-rev2.patch
>=20
> cd /usr/src/iptables-1.2.6a
> make pending-patches KERNEL_DIR=3D/usr/src/linux

Correct me if I'm wrong doesn't the INSTALL file say you=20
Need a 2.4.4 kernel in order for it to work.

>=20
> If all went well go ahead and configure your kernel.
> cd /usr/src/linux
> make xconfig (or whatever you like to use)
>=20
> Check all (networking) options that apply.
> There are two new options in the kernel config :
> - Networking options -> IP: Netfilter Configuration -> PPTP=20
> protocol support
> - Networking options -> IP: Netfilter Configuration -> PPTP=20
> verbose debug Make sure you check the first. If you want=20

When I patched or seudo patched it I the pptp option did show up.


> cd /usr/src/iptables-1.2.6a
> make KERNEL_DIR=3D/usr/src/linux
> make install KERNEL_DIR=3D/usr/src/linux

Interesting you did this after compiling the kernel.


>=20
> Reboot and make sure to boot the new kernel.
>=20
> Now for the forwarding rules.
> I'm taking values from this post. Since it's not mentioned, I=20
> take eth0 as the LAN NIC.=20
> http://www.netfilter.org/documentation/tutorials/blueflux/ipta
bles-tutorial.



>iptables -A FORWARD -p tcp -i ppp0 -o eth0 -d 10.1.1.15 --dport 1723 -j
ACCEPT iptables -A FORWARD -p 47 -i ppp0 -o eth0 -d 10.1.1.15 -j ACCEPT

>iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external-ip> --dport
1723 -j DNAT --to 10.1.1.15:1723 iptables -t nat -A PREROUTING -p 47 -i
ppp0 -d >>><external-ip> -j DNAT --to 10.1.1.15

I used the same commands to test it. I will try the order you used.
Thanks for taking the time though.
What I'm trying most desperatly not to do is have to revert back to ext2
and a 2.4.17 kernel.




