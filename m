From: Vicky Shrestha <mail@vickysh.wlink.com.np>
Subject: ip_conntrack: table full, dropping packet.
Date: Wed, 30 Oct 2002 19:28:42 +0545
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210301928.42300.mail@vickysh.wlink.com.np>
Reply-To: mail@vickysh.wlink.com.np
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I have built a firewall on 2.4.8-17 kernel which has 2 Mb of traffic going in 
an out of it. 

I recently added a line :
iptables -A FORWARD -m state --state ESTABLISED,RELATED -J ACCEPT

Now I can see the lines "ip_conntrack : table full, dropping packet" in my 
kern.log.

Does dropping packets means that it is actually dropping the packets or just 
truncating the file /proc/net/ip_conntrack , does this affect my client's  
connections???

-- 
Best regards,


Vicky Shrestha
System Administrator
WorldLink Communications Pvt.Ltd
Jawalakhel, Kathmandu, Nepal.


