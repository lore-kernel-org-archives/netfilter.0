From: "Afshin Lamei" <linux_st@hotmail.com>
Subject: NAT all clients exept one
Date: Sun, 28 Mar 2004 09:28:55 +0430
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY12-F64DRNtcIQNT900018171@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I have this architecture in my network:
an Iptables firewall between the LAN and the router. Firewall translates all 
LAN traffic from 192.168.1.x to it's valid IP address.
I want to continue this, but allow a client - 192.168.1.7 - to perform 
TELNET to my router with his invalid address. what should I add to my rules?
regards,
afshin

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


