From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: multiple mapping
Date: Wed, 01 Sep 2004 07:07:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094036834.2045.2.camel@localhost>
References: <006701c48ff9$9627b5b0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006701c48ff9$9627b5b0$2a245cc2@cea05>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Tomek Macioszek <tomekm@cea.pl>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-09-01 at 03:59, Tomek Macioszek wrote:
> Hi
> I have my FIREWALL BOX with address 4.3.2.1 (eth0) and local address 192.168.10.0/24.
> Now I have SNAT:
> iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o eth1 -j SNAT --to 4.3.2.1
> I would like to make SNAT with i.e two external address.
> iptables -t nat -A POSTROUTING -s 192.168.10.0/28 -o eth1 -j SNAT --to 4.3.2.1
> iptables -t nat -A POSTROUTING -s 192.168.10.128/28 -o eth1 -j SNAT --to 4.3.2.2. It is good solution? Should I make alias for eth0 with address 4.3.2.2?
> Thanks for help and sorry for my English.
> Best regards
> T.  
Yes, that should work fine.  You will need to bind the address to eth0
so that it responds to ARP requests:
ip address add 4.3.2.2/?? dev eth0
Are you sure about the 28 bit mask for the subnets? It looks like you
want /25 unless you are hiding some of your addresses.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


