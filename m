From: Nilesh <niluforalways@yahoo.com>
Subject: Nat Rule ( Req help ASAP)
Date: Mon, 8 Nov 2004 23:04:56 -0800 (PST)
Message-ID: <20041109070456.3723.qmail@web50506.mail.yahoo.com>
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

Hello All, 

I am using Squid proxy and IPtables Firewall 
through squid I am able to block Messenger and other
sites but If I put this in firewall I couldnt able to
block messenger 
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
$EXTIP 
In connection settings If I choose no proxies the
Yahoo messenger easily get connected.

also we use CISCO VPN client to connect Outside VPN
server If I want to connect VPN I need to put that
rules otherwise I wont connect.

Could any one please tell How to solve my problem
I want to block messengers also want to connect VPN
server though client 

Thanks 
Nilesh.



		
__________________________________ 
Do you Yahoo!? 
Check out the new Yahoo! Front Page. 
www.yahoo.com 
 


