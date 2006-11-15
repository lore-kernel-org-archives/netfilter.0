From: Matevz Langus <matevz.langus@borea.si>
Subject: how to change ip source address of incoming packets
Date: Wed, 15 Nov 2006 08:15:41 +0100
Message-ID: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
Mime-Version: 1.0 (Apple Message framework v752.2)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Does anyone know how to change ip source address when entering Linux  
interface to something else and when leaving out the same interface  
(backwards) changing it back.

The problem is this:

I have 10 devices with the same IP address, 192.168.1.1. They are  
connected to ethernet switch, which adds VLAN TAG to packets from  
each device. Linux box is connected to the switch. It is possible to  
create 10 VLAN interfaces on the Linux box and only one 192.168.1.1  
address will be seen per interface. In order to establish TCP  
connections to all devices at the same time, source address must be  
altered.

on eth0.10, INPUT SRC 192.168.1.1 -> 192.168.10.1
on eth0.10, OUTPUT DST 192.168.10.1 -> 192.168.1.1
on eth0.11, INPUT SRC 192.168.1.1 -> 192.168.11.1
on eth0.11, OUTPUT DST 192.168.11.1 -> 192.168.1.1
...

thanks,
   Matevz Langus

