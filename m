From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Fwd: RE: MSN Messanger through a iptables firewall.
Date: Thu, 4 Jul 2002 15:24:50 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207041424.g64EOwU31986@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter <netfilter@lists.samba.org>

Someone just posted this to me instead of the list.

Antony.

----------  Forwarded Message  ----------

Subject: RE: MSM Mesanger through a iptables firewall.
Date: Thu, 4 Jul 2002 15:27:56 +0100
From: <aaa.coms.sec@btclick.com>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>

might be me but what about the irc modules ? i.e.

/sbin/depmod -a
/sbin/modprobe ip_masq_ftp
/sbin/modprobe ip_masq_raudio
/sbin/modprobe ip_masq_autofw
/sbin/modprobe ip_masq_cuseeme
/sbin/modprobe ip_masq_mfw
/sbin/modprobe ip_masq_portw
/sbin/modprobe ip_masq_quake
/sbin/modprobe ip_masq_user
/sbin/modprobe ip_masq_vdolive
/sbin/modprobe ip_masq_irc

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
Sent: 04 July 2002 15:13
To: netfilter@lists.samba.org
Subject: Re: MSM Mesanger through a iptables firewall.

On Thursday 04 July 2002 3:06 pm, Stephan Viljoen wrote:
> Firewall 2:
> eth0 : 193.220.24.8
> eth1 : 193.220.24.193
> eth2 : 192.168.1.1

What are the netmasks on eth0 and eth1 ?

What's the routing table on this machine ?



Antony.

