From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Fri, 18 Jun 2004 21:26:19 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040619042619.46385.qmail@web14704.mail.yahoo.com>
References: <Pine.LNX.4.33.0406182109490.25875-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406182109490.25875-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

--- Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Fri, 18 Jun 2004, Sagara Wijetunga wrote:
>=20
> > Today I upgraded the Linux kernel to 2.6.7.
> >
> > Applied following patches of the
> > patch-o-matic-ng-20040302:
> > init_conntrack-optimize NETMAP SAME TTL connlimit
> > fuzzy iprange ipv4options mport raw CLASSIFY
> addrtype
> > childlevel owner-socketlookup
> >
> > Compiled in all netfiter options to the kernel.
>=20
> Could you post the output of
>=20
> grep IP_NF_ .config
>
cd /usr/src/linux-2.6.7
grep IP_NF_ .config

CONFIG_IP_NF_CONNTRACK=3Dy
CONFIG_IP_NF_FTP=3Dy
CONFIG_IP_NF_IRC=3Dy
CONFIG_IP_NF_TFTP=3Dy
# CONFIG_IP_NF_AMANDA is not set
CONFIG_IP_NF_QUEUE=3Dy
CONFIG_IP_NF_IPTABLES=3Dy
CONFIG_IP_NF_MATCH_LIMIT=3Dy
CONFIG_IP_NF_MATCH_IPRANGE=3Dy
CONFIG_IP_NF_MATCH_MAC=3Dy
CONFIG_IP_NF_MATCH_PKTTYPE=3Dy
CONFIG_IP_NF_MATCH_MARK=3Dy
CONFIG_IP_NF_MATCH_MULTIPORT=3Dy
CONFIG_IP_NF_MATCH_TOS=3Dy
CONFIG_IP_NF_MATCH_RECENT=3Dy
CONFIG_IP_NF_MATCH_ECN=3Dy
CONFIG_IP_NF_MATCH_DSCP=3Dy
CONFIG_IP_NF_MATCH_AH_ESP=3Dy
CONFIG_IP_NF_MATCH_LENGTH=3Dy
CONFIG_IP_NF_MATCH_TTL=3Dy
CONFIG_IP_NF_MATCH_TCPMSS=3Dy
CONFIG_IP_NF_MATCH_HELPER=3Dy
CONFIG_IP_NF_MATCH_STATE=3Dy
CONFIG_IP_NF_MATCH_CONNTRACK=3Dy
CONFIG_IP_NF_MATCH_OWNER=3Dy
CONFIG_IP_NF_FILTER=3Dy
CONFIG_IP_NF_TARGET_REJECT=3Dy
CONFIG_IP_NF_NAT=3Dy
CONFIG_IP_NF_NAT_NEEDED=3Dy
CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
CONFIG_IP_NF_TARGET_REDIRECT=3Dy
CONFIG_IP_NF_TARGET_NETMAP=3Dy
CONFIG_IP_NF_TARGET_SAME=3Dy
# CONFIG_IP_NF_NAT_LOCAL is not set
# CONFIG_IP_NF_NAT_SNMP_BASIC is not set
CONFIG_IP_NF_NAT_IRC=3Dy
CONFIG_IP_NF_NAT_FTP=3Dy
CONFIG_IP_NF_NAT_TFTP=3Dy
CONFIG_IP_NF_MANGLE=3Dy
CONFIG_IP_NF_TARGET_TOS=3Dy
CONFIG_IP_NF_TARGET_ECN=3Dy
CONFIG_IP_NF_TARGET_DSCP=3Dy
CONFIG_IP_NF_TARGET_MARK=3Dy
CONFIG_IP_NF_TARGET_CLASSIFY=3Dy
CONFIG_IP_NF_TARGET_LOG=3Dy
CONFIG_IP_NF_TARGET_ULOG=3Dy
CONFIG_IP_NF_TARGET_TCPMSS=3Dy
CONFIG_IP_NF_ARPTABLES=3Dy
CONFIG_IP_NF_ARPFILTER=3Dy
CONFIG_IP_NF_ARP_MANGLE=3Dy
CONFIG_IP_NF_TARGET_NOTRACK=3Dy
CONFIG_IP_NF_RAW=3Dy
CONFIG_IP_NF_TARGET_TTL=3Dy
CONFIG_IP_NF_MATCH_CONNLIMIT=3Dy
CONFIG_IP_NF_MATCH_FUZZY=3Dy
CONFIG_IP_NF_MATCH_IPV4OPTIONS=3Dy
CONFIG_IP_NF_MATCH_MPORT=3Dy
CONFIG_IP_NF_MATCH_ADDRTYPE=3Dy

The iptables-1.2.10 was compiled and installed as
follows:
CC=3D"gcc -D__user=3D "
export CC

make BINDIR=3D/sbin LIBDIR=3D/lib \
MANDIR=3D/usr/share/man KERNEL_DIR=3D/usr/src/linux-2.6.7
>& iptables-make.log

make BINDIR=3D/sbin LIBDIR=3D/lib \
MANDIR=3D/usr/share/man install
KERNEL_DIR=3D/usr/src/linux-2.6.7  >&
iptables-install.log

/sbin/ldconfig

> > After the server is booted with the new kernel, I
> > recompiled and reinstalled the iptables.
> >
> > But my problem is still the same. The =93-m state
> > --state ESTABLISHED=94 works well, but the =93-m state
> > --state RELATED=94 does not work at all for FTP data
> > connections. What have I missed?
>=20
> You should post the complete list of your rules in
> all of the tables.
>=20
	/sbin/iptables -P INPUT DROP
	/sbin/iptables -P FORWARD DROP
	/sbin/iptables -P OUTPUT DROP

	/sbin/iptables -A INPUT -m state --state INVALID -j
DROP
	/sbin/iptables -A INPUT -p tcp   --tcp-flags SYN,FIN
SYN,FIN -j DROP
	/sbin/iptables -A INPUT -p tcp   --tcp-flags ALL FIN
-j DROP

	/sbin/iptables -A INPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT

	/sbin/iptables -A INPUT -p tcp  --dport 21
--tcp-flags ACK,PSH,URGP ACK,PSH -j DROP
	/sbin/iptables -A INPUT -p tcp   --tcp-flags FIN,ACK
FIN,ACK -j DROP
	/sbin/iptables -A INPUT -p tcp   --tcp-flags RST,ACK
RST,ACK -j DROP

	/sbin/iptables -A INPUT -p tcp --dport 21  --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 22  --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 25  --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 53  --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p udp --dport 53 	 -j ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 80  --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 110 --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 143 --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 443 --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 465 --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 993 --syn -j
ACCEPT
	/sbin/iptables -A INPUT -p tcp --dport 995 --syn -j
ACCEPT

	/sbin/iptables -A INPUT -m limit --limit 1/s -j LOG
--log-prefix 'INPUT PKT DROPPED: '

	/sbin/iptables -A OUTPUT -m state --state INVALID -j
DROP
	/sbin/iptables -A OUTPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT
	/sbin/iptables -A OUTPUT -p tcp --dport 53  --syn -j
ACCEPT
	/sbin/iptables -A OUTPUT -p udp --dport 53 	  -j
ACCEPT
	/sbin/iptables -A OUTPUT -p tcp --dport 25  --syn -j
ACCEPT

	/sbin/iptables -A OUTPUT -m limit --limit 1/s -j LOG
--log-prefix 'OUTPUT PKT DROPPED: '


Please let me know if you require any further info in
this regard.

Sagara


	=09
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

