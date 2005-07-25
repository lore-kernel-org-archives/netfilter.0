From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: not solve yet!!!
Date: Mon, 25 Jul 2005 16:11:43 +1000
Message-ID: <32512.1637004942$1122380279@news.gmane.org>
References: <20050725060738.31653.qmail@web42405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050725060738.31653.qmail@web42405.mail.yahoo.com>
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
To: 'john decot' <johndecot@yahoo.com>, netfilter@lists.netfilter.org

John:

This is the rule I use on our servers:

"iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
--to-port 3128"

The only difference I can see is in the order... I don't know if that
matters.

Hope that helps!

Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
 
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of john decot
Sent: Monday, 25 July 2005 4:08 PM
To: netfilter@lists.netfilter.org
Subject: not solve yet!!!

Hello all,
 i am facing a problem in iptables as follows:
  i have  single nic which ip is eth0= x.x.x.x(public_ip)
    alias is  eth0:1=y.y.y.y( private_ip) the proxy works when ip of server
and port 3128 at lan connection is configured at client side(windows os).
But doesn't work without that whenever i flow traffic to proxy server, again
i have used ip tables as:
 
iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j REDIRECT
--to-port 3128
 
with above it doesn't work then i tried following iptables -A PREROUTING -t
nat -p tcp --dport 80 -i eth0 -j DNAT $public_ip or $private_ip:3128
 
again the same result.
client pc and server is connect at same switch. and clients have private ip
where as server has public as well as private ip.
any help will be appreciated.
 
thanks in advance.
john
 

		
---------------------------------
 Start your day with Yahoo! - make it your home page 


