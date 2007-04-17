From: netsol3@inspire.net.nz
Subject: Where has NAT gone?
Date: Tue, 17 Apr 2007 08:07:38 GMT
Message-ID: <20070417080738.EB8A5DBAAA@mail5.inspire.net.nz>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all
This is hopefully a quick question. Today I upgraded my system from Linux
Kernel 2.6.16.20 to 2.6.20.7 because I needed an updated NIC driver. Upon
running make menuconfig, I noticed that the options for NAT seem to have
vanished from the config menu. 

At first, I used my .config file from 2.6.16.20, but under such a method
there were no netfilter options available at all. So I removed the .config
file and ran make menuconfig from scratch - this time, I got netfilter
options, but no sign of NAT. I then hunted through the source tree and
found plenty of sections that still mention CONFIG_IP_NF_NAT, which ruled
out the possibility that NAT has been merged under a different section of
the kernel compilation. Then I edited the .config file by hand, and added
CONFIG_IP_NF_NAT=yes. After building the kernel (which didn't add any nat
functionality) I checked the .config file and found that the make process
had actually removed the NF data from the file.

I have enabled:
CONFIG PACKET NF CONNTRACK
CONFIG IP NF IPTABLES
CONFIG IP NF FILTER
CONFIG_IP_NF_NAT
CONFIG IP NF MATCH STATE

IPTables works fine. I have a firewall that works. It's just that as soon
as I try to refer to the 'nat' table, it tells me this is not possible as
it's not compiled into my kernel.

I'm not sure if this is the right place to ask but the kernel mailing list
was slow at responding so I thought I'd try here.

Any help would be greatly appreciated

Regards
Richard

------------------------------------------------
This message was sent using InSPire Net Webmail.
http://www.inspire.net.nz



