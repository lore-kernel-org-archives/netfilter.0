From: spdesai@gnvfc.net
Subject: Linux Router
Date: Sun,  6 Feb 2005 23:06:59 +0530
Message-ID: <1107711419.420655bbc259e@mail.gnvfc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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



Hi

I have one linux machine with two NIC cards. One is connected to internet and 
one is private PC. Below is my IP configuration

eth0: Valid IP: xxx.xxx.xxx.68
      Mask: 255.255.255.192
      Gateway: xxx.xxx.xxx.65  

eth1: Invalid IP: 192.168.1.1
       Mask : 255.255.255.0
      Gateway: xxx.xxx.xxx.65 


Now when i connect eth1 to window machine. i can ping up to eth0 valid ip i.e 
xxx.xxx.xxx.68 but could not ping xxx.xxx.xxx.65 which is gateway ip of linux.

I have enable ip_forward to 1 in linux machine.

My window machine ip is: 
IP: 192.168.1.2
Mask:255.255.255.0
GW: 192.168.1.1

Pl. give me the solution so i can ping xxx.xxx.xxx.65 from my window machine.

Thanks in advance

suhag.



-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/


