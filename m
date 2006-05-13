From: Aras Vaichas <arasv@magellan-technology.com>
Subject: bridged with dhcpd on one interface only, how?
Date: Sat, 13 May 2006 20:12:20 +1000
Message-ID: <4465B104.6020101@magellan-technology.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello,

I have an embedded device with 2 interfaces, eth0 and usb0. I need to provide a 
DHCP server on usb0 but not eth0. Also, I need to bridge eth0 and usb0, so the 
entire device has only one IP address that can be accessed by either (or both) 
interfaces.

Do I need to use ebtables, or can I use iptables with the -i option?

Thanks!

Aras Vaichas

