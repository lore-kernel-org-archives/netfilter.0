From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: DMZ trouble!
Date: 09 Jan 2003 10:37:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042088854.810.10.camel@india>
References: <1042083771.2320.162.camel@jimmy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042083771.2320.162.camel@jimmy>
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
To: David Collodel <dave@crawlspaceradio.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-01-09 at 09:12, David Collodel wrote:
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
> 
> -- 
> David Collodel <dave@crawlspaceradio.com>
> 
> 

You have to configure your DNS server so that whenever a request comes
from the internal it should be sent to DMZ.

If from internal you can connect to any of the servers which are there
in the external, then you should also be able to connect to the DMZ
using the external ip. 


And tell me how the connetivity is going on from external to the DMZ? 

-- 
Dharmendra.T
Linux Enthu


