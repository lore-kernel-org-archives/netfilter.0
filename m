From: David Collodel <dave@crawlspaceradio.com>
Subject: RE: DMZ trouble!
Date: 08 Jan 2003 23:59:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042088350.2319.205.camel@jimmy>
References: <F635E25A78F69C41B85DC6CB18972A9A474721@kepler.blueshiftinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F635E25A78F69C41B85DC6CB18972A9A474721@kepler.blueshiftinc.com>
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
To: "John A. Novak" <jnovak@blueshiftinc.com>
Cc: netfilter@lists.netfilter.org

Yes. I've got the following for my generic FORWARD rules:
-----
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $EXT_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $EXT_IFACE -o $DMZ_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j KEEP_STATE
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
-----

DMZ_IFACE = eth1
EXT_IFACE = eth0
LAN_IFACE = eth2

The traffic gets forwarded everywhere if I use the internal IP
addresses. It only seems to have a problem if I try to connect from a
LAN address to a "real" ip that's bound to eth0

something like  172.16.11.2 -> 172.16.12.2  works fine.

However, 172.16.11.2 -> 66.92.171.152  does not work.

66.92.171.152 is bound to eth0, and when someone on the OUTSIDE tries to
connect to it, it gets properly forwarded and NAT'ed to 172.16.12.2


On Wed, 2003-01-08 at 23:22, John A. Novak wrote:
> Do you have rules that allow traffic to be forwarded from the LAN to the DMZ and back ?
> 
> John Novak
> 
> -----Original Message-----
> From: David Collodel [mailto:dave@crawlspaceradio.com]
> Sent: Wednesday, January 08, 2003 7:43 PM
> To: netfilter@lists.netfilter.org
> Subject: DMZ trouble!
> 
> 
> Hi,
> 
> I've recently been working on a firewall using IPtables to create a
> DMZ/LAN setup.
> 
> I have a system with 3 NIC's. 
> 
> eth0 has the "real" static IP's from my ISP. I'm using NAT to translate
> from the IP bound on this NIC to the internal DMZ and LAN hosts.
> eth1 is set to 172.16.12.1 and is used as the DMZ interface. Hosts
> connected to this interface are all 172.16.12.x
> eth2 is set to 172.16.11.1 and is used as the LAN interface.Hosts
> connected here are all 172.16.11.x
> 
> Most things seem to be working, I can connect from the LAN to the DMZ
> and to the Internet. I can connect from the DMZ to the Internet, but not
> to the LAN, but already established connections work. Only the ports I
> specify are open from the Internet to the DMZ.
> 
> The problem I'm having is this:
> 
> When I try to connect to a host in the DMZ from the LAN, it does not
> work when I use the "real" IP address.
> 
> An example of the error in the logs is this:
> -----
> IPT INPUT packet died: IN=eth1 OUT=
> MAC=00:10:5a:1b:48:8a:00:10:5a:00:ff:b8:08:00 SRC=172.16.11.2
> DST=66.92.171.152 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=3514 DF PROTO=TCP
> SPT=32949 DPT=80 WINDOW=5440 RES=0x00 SYN URGP=0
> ----
> 
> Does anyone have any idea why this might be happening?
> 
> Much thanks.
-- 
David Collodel <dave@crawlspaceradio.com>


