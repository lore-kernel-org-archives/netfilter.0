From: "gpr007" <gpr007@terra.com.br>
Subject: iptables x iproute sparc64
Date: Sat,  9 Nov 2002 14:08:17 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <H5BJLT$7885F460654D39DE7CDBDD6997786346@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

Hello,
     I'm try to use iptables with --set-mark on mangle table to mark 
packets and iproute2 rules to get the mark and route this packet, 
but it is don=B4t work. I know that counters of rules of the iptables 
don=B4t work, the --set-mark too? I know that problem is iptables, 
because I put trace on kernel module and the mark is always zero 
and the same trace on Intel is ok. I have Debian 3.0 on Sparc 
280R, kernel version 2.4.19 and iptables-1.2.7a. 
The rules:
iptables -t mangle -A PREROUTING -i eth0 -p tcp -j MARK --set-mark 0x1
ip rule add fwmark 0x1 lookup 2 prio 1

Thanks, Jo=E3o


