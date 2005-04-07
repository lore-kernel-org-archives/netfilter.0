From: John Mok <jmok@attglobal.net>
Subject: Linux firewall + NAT Traversal + IPsec
Date: Fri, 08 Apr 2005 01:49:58 +0800
Message-ID: <425572C6.2040007@attglobal.net>
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
To: netfilter@lists.netfilter.org

Hi,

I'm new to Linux. Is it possible make a Linux box with firewall + NAT, 
such that client PC(s) from the NATed internal network could connect to 
a VPN gateway on the Internet :-

 client PC ----- Linux iptables firewall + NAT ---- Internet ---- IPsec 
VPN gateway
192.168.x.x/16                                              (e.g. 
Checkpoint FW-1)
(VPN client)

I hope someone could help to advise what software / kernel patch is 
required on the Linux box to NAT traversal work and where to get the 
HOWTO(s)?

Thanks a lot.

John Mok


