From: "Dr. Lars Hanke" <lars@lhanke.de>
Subject: dhcrelay
Date: Tue, 15 Feb 2005 21:58:27 +0100
Message-ID: <200502152158.27275.lars@lhanke.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

google told me that dhcrelay has been discussed quite a couple of times on 
this list. However,I could not find a solution to my problem.

I want to set up a router, which distributes the DHCP configuration service to 
all subnets attached (well currently only one subnet at eth0, 172.16.2.1). 
Reading the dhcrelay man page
#> dhcrelay -i eth0 adept.mgr

should do exactly that. In practice - almost:

dhcrelay gets the request, asks the dhcp server, gets a reply, but never sends 
it to the requesting device:

#> tcpdump -i any port bootpc or port bootps
09:42:09.996479 172.16.1.12.bootpc > 255.255.255.255.bootps: xid:0x960f0000 
flags:0x8000 [|bootp] 
09:42:09.997009 surtur.mgr.bootps > adept.mgr.bootps: (request) xid:0x960f0000 
flags:0x8000 G:172.16.2.1 ether 0:9:5b:68:19:fb [|bootp] (DF) 
09:42:09.997603 adept.mgr.bootps > 172.16.2.1.bootps: (reply) xid:0x960f0000 
flags:0x8000 Y:ymir.mgr S:adept.mgr G:172.16.2.1 ether 0:9:5b:68:19:fb [|
bootp] (DF) 

... but something like the following never appears (line taken from DHCP 
exchange from server installed on router, alternatively):

09:59:38.780364 172.16.2.1.bootps > 255.255.255.255.bootpc: xid:0x960f0000 
flags:0x8000 Y:ymir.mgr S:172.16.2.1 [|bootp] [tos 0x10] 

Therefore, ymir never gets his IP! 

netfilter policies were set to ACCEPT and all tables were flushed (including 
nat and mangle). I can ping all NIC from anywhere, ymir of course only if it 
is configured!

The system is Debian Woody with 2.4.26-grsec Kernel from backports. grsec 
stuff is not activated by gradm.

Any help appreciated,
 - lars.

