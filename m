From: Denis <denismpa@gmail.com>
Subject: -j SNAT
Date: Tue, 28 Nov 2006 14:20:10 -0300
Message-ID: <e9aeeef80611280920n4cde4f1bj469a15688e28cee2@mail.gmail.com>
References: <e9aeeef80611280916r2a6b2ba1w52b65d81a2b0416f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e9aeeef80611280916r2a6b2ba1w52b65d81a2b0416f@mail.gmail.com>
Content-Disposition: inline
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

Good afternoon everybody.


I'm having a problem with a SNAT and wanna know if somebody here can help-me.


the issue is as following:


I have a Proxy Load Balanced and when my users try to access bank's
sites on ssl protocol (port 443)

when the connection  is balanced by the two proxy nodes the bank site
notes that ip source change and the user is disconnected


to solve this problem I thinked to do a SNAT on my two nodes as follow

Node 1 (Ip 202.188.94.66)

iptables -t nat -A POSTROUTING -p tcp -o eth1 --dport 443 -j SNAT
--to-source 202.188.94.68:6001-7000


and on Node 2 (IP 202.188.94.67)

iptables -t nat -A POSTROUTING -p tcp -o eth1 --dport 443 -j SNAT
--to-source 202.188.94.68:7001-8000

so, the connection arrives on the destination translated as have to
be, but the connection doesn't get established.

This is as the destination machine can't return the package.


Some body have any idea to help me?

