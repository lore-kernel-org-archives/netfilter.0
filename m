From: "System Admin" <admin@nepalbank.com.np>
Subject: block dhcp service based on mac
Date: Tue, 30 May 2006 11:21:51 +0545
Message-ID: <WorldClient-F200605301121.AA21510331@nepalbank.com.np>
Reply-To: admin@nepalbank.com.np
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hello all

I have an dhcp server and i want to block a particular mac address (that
pc is virus infected) from using my dhcp service so that it will not get
any valid ip address.

for that i have used 

/sbin/iptables -I INPUT -i eth2 -p all -m mac --mac-source
00:02:E3:34:EA:77 -j DROP

or

/sbin/iptables -I INPUT -i eth2 -p udp --dport 67:68 -m mac --mac-source
00:05:5D:4A:8A:3B -j DROP

while the iptables rule match count do increase but the pc is still
getting ip address from my dhcp server which is seen from dhcpd log file.

does the packet goes to dhcp service before going to iptables stack?
I am using redhat 9 with dhcp-3.0pl1-23 dhcp server.

Thank you






-------------------------------------------------  DISCLAIMER  ---------------------------------------------------------
This email is intended for the exclusive use by the person(s) mentioned as recipient(s) and  may contain information that is confidential and/or privileged.This email does not  constitute any commitment from Nepal Bank Limited or its subsidiaries except when expressly agreed in a written agreement between the intended recipient and Nepal Bank Limited or its subsidiaries. If you receive this email by mistake, please notify the sender or notify by emailing at postmaster@nepalbank.com.np and delete this email immediately from your system and destroy  all copies of it. You may not, directly or indirectly, use, disclose, distribute, print or  copy this email or any part of it if you are not the intended recipient.


