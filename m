From: "Navneet" <navneetkc@gmail.com>
Subject: Re: Linux as router (Gateway Server) [Revisited]
Date: Mon, 31 Jan 2005 20:54:10 +0530
Message-ID: <005701c507a8$f84e5330$eaab9385@gagan>
References: <00a601c4fe34$5e74bd80$eaab9385@gagan>
	<1106851960.14748.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Mohammad Khan <mkhan@lextranet.com>, netfilter@lists.netfilter.org
Cc: Askar <askarali@gmail.com>

Many many thanks to all of you for devoting you valuable by reading &
replying to my mail(query).



Quick recaps and updates:



1.i am still using RedHat Linux 9

#uname -a

Linux agni.leo.com 2.4.20-8 #1 Thu Mar 13 17:54:28 EST 2003 i686 i686 i386
GNU/Linux



2.Having: RTL8139 on board +  RTL 8029 plugged in(external label is of SMC
?).

#lspci -v

3:06.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8029(AS)

        Subsystem: Standard Microsystems Corp [SMC] EZ-Card (SMC1208)

        Flags: medium devsel, IRQ 5

        I/O ports at cc00 [size=3D32]

        Expansion ROM at ffffc000 [disabled] [size=3D16K]



03:0a.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL-8139/8139C/8139C+ (rev 10)

        Subsystem: Unknown device 1849:8139

        Flags: bus master, medium devsel, latency 32, IRQ 3

        I/O ports at c800 [size=3D256]

        Memory at dfdfff00 (32-bit, non-prefetchable) [size=3D256]

        Capabilities: [50] Power Management version 2



NOTE: should I use different NIC , that use different modules ?



3. iptables  v1.2.7a



4.Now I am port redirecting i.e http/80 >>squid-cache/3128

adding my current iptables rules



5.users can browse Internet, but can't able to access FTP sites?



Please refer below for ftp error logs/X'fer log



6.What I am trying to :

a.>  This Linux system should act as gateway 9router) between my LAN &
WAN.[Working]

b.>  Act as proxy server trough Squid & url filtering by using SquidGuard.
[Working]

c.>  Act as firewall

Allowed traffic http/https,POP3/SMTP,FTP & SonicMQ.



Please help in configuring this system





> just change eth0 to eth1

>nicer way,
>-A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth0 -j SNAT --to-source
>172.21.0.133



Well thanks. I've used same natting rule (source natting) in my firewall.



But my external NIC is eth1 NOT eth1 .Any particular reason for using eth0
as external?



Below is my working tables rules.But i can't able to successfully establish
external ftp sites/servers.

i even loaded ip_conntrack_ftp



[root@leo root]# insmod ip_conntrack_ftp
Using /lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
[root@ leo root]# lsmod
Module                  Size  Used by    Not tainted
ip_conntrack_ftp        5296   0  (unused)
autofs                 13268   0  (autoclean) (unused)
iptable_filter          2412   0  (autoclean) (unused)
ne2k-pci                7232   1
8390                    8508   0  [ne2k-pci]
8139too                18088   1
mii                     3976   0  [8139too]
ipt_REDIRECT            1368   1  (autoclean)
iptable_nat            21720   1  (autoclean) [ipt_REDIRECT]
ip_conntrack           26976   2  (autoclean) [ip_conntrack_ftp ipt_REDIRECT
ipt
able_nat]
iptable_mangle          2776   0  (autoclean) (unused)
ip_tables              15096   6  [iptable_filter ipt_REDIRECT iptable_nat
iptab
le_mangle]
microcode               4668   0  (autoclean)
keybdev                 2944   0  (unused)
mousedev                5492   0  (unused)
hid                    22148   0  (unused)
input                   5856   0  [keybdev mousedev hid]
usb-uhci               26348   0  (unused)
ehci-hcd               19976   0  (unused)
usbcore                78784   1  [hid usb-uhci ehci-hcd]
ext3                   70784   1
jbd                    51892   1  [ext3]

Please refer belows log file for details:



##########FTP LOG STARTS##################

SYST
Not connected
Host type (I): Automatic detect
WINSOCK.DLL: WinSock 2.0
WS_FTP32 4.04, Copyright =A9 1992-1996 Ipswitch, Inc. All rights reserved.
- -
connecting to X.X.X.X...
Connected to X.X.X.X port 21
220 ProFTPD 1.2.4 Server (ftpserver) [X.X.X.X]
USER crpovsat
331 Password required for data
PASS xxxxxx
230 User crpovsat logged in.
Host type (I): UNIX (standard)
PWD
257 "/leo/ftp" is current directory.
PORT 192,168,0,234,11,12
500 Illegal PORT command.
DoDirList returned 0

#############IPTABLES RULES STARTS HERE#####################################

# Generated by iptables-save v1.2.7a on Mon Jan 31 18:08:44 2005
*filter
:INPUT ACCEPT [3142:390380]
:FORWARD ACCEPT [129:8201]
:OUTPUT ACCEPT [2368:283021]
COMMIT
# Completed on Mon Jan 31 18:08:44 2005
# Generated by iptables-save v1.2.7a on Mon Jan 31 18:08:44 2005
*nat
:PREROUTING ACCEPT [42124:6973903]
:POSTROUTING ACCEPT [3981:238915]
:OUTPUT ACCEPT [3981:238915]
-A PREROUTING -s 192.168.0.0/255.255.0.0 -i eth0 -p tcp -m tcp --dport 80 -j
REDIRECT --to-ports 3128
-A POSTROUTING -s 192.168.0.0/255.255.0.0 -o eth1 -j SNAT --to-source
172.21.0.132
COMMIT
# Completed on Mon Jan 31 18:08:44 2005
# Generated by iptables-save v1.2.7a on Mon Jan 31 18:08:44 2005
*mangle
:PREROUTING ACCEPT [91110:21827250]
:INPUT ACCEPT [85740:19815355]
:FORWARD ACCEPT [5288:2008168]
:OUTPUT ACCEPT [66867:17702084]
:POSTROUTING ACCEPT [72155:19710252]
COMMIT
# Completed on Mon Jan 31 18:08:44 2005


>It was very nice to see a Bangladeshi guy in netfilter list :p

>Let me know, if it works.
>
>
>Mohammad Khan
>(beeplove)









