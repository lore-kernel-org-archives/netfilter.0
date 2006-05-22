From: "Jawed Ahmed" <jawed.ahmed@adaniwilmar.in>
Subject: (Fwd) (Fwd) Transparent proxy using squid, redirect all ssl/ht
Date: Mon, 22 May 2006 09:22:06 +0530
Message-ID: <447182BE.1786.3E76075@jawed.ahmed.adaniwilmar.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
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


hi group, 
sam eproblem here. 

normal sites are working but https doesn't.  
I dont' want to send all the 443 requests to the router directly, since I know that squid  
handles them (doesn't cache though) properly through 3128, so logically when I redirect  
all port 80 and port 443 reqyests to 3128 it should work.  

I guess there is some more tweaking to be done to the chains... 

if anyone has faced the same problem and solved then please let me know 

thnaks 
Jawed 
India 



------- Forwarded message follows ------- 
Hi, 

It seems that implementing transparent squid proxy will cause https & 
ssl to not work well on browsers ... and it would be troublesome to 
manually setup proxy settings to all browsers within our network. 

So I'd like to be able to redirect all other requests like 
https/ssl(port 443) or email client's ports to directly access the 
internet instead of going through our proxy server. 

Here's a little diagram of our network: 
http://static.flickr.com/49/149174815_48fa51f1a3_o.png 

What I did so far is: 
1. Block out all connection request from our router settings except 
for our proxy server (adminserver ) only, this will force our users to 
use the proxy settings for their other applications. 
2. Set all client's pc's to use the new gateway 'adminserver' (our 
squid server). 
3. Setup transparent proxy for squid. For http requests. 

Everything else is working fine so far, except that opening up 
ssl-enabled sites (mail.yahoo.com) creates a timeout error and email 
clients seems to not work even with proxy settings enabled. 

What I need is some sort of iptable rule to grab all port 443 
connections and make it connect directly to the internet ... I used 
webmin to formulate a rule but that didn't work ... so I thought of 
asking for help here, anyone? 

Here are my current rules: 
-A PREROUTING -p tcp -m tcp -i eth0 --dport 80 -j REDIRECT --to-ports 3128 
-A PREROUTING -p tcp -m tcp -i eth0 --dport 443 -j DNAT 
--to-destination 192.168.100.3 

The first one works, it's for transparent proxy, the other one.. I 
have no idea why it's not working =( 


Regards, 
Elijah A. 



----------------------------------------------------------------------------- 
Fortune: India's No 1 edible oil brand. 
Visit us at www.adaniwilmar.com 
------------------------------------------------------------------------------ 
------- End of forwarded message ------- 
--  
9825325766 
079-25555625,25555634 
jawed.ahmed@adaniwilmar.in 
------- End of forwarded message -------
-- 
9825325766
079-25555625,25555634
jawed.ahmed@adaniwilmar.in


-----------------------------------------------------------------------------
Fortune: India's No 1 edible oil brand.
Visit us at www.adaniwilmar.com
------------------------------------------------------------------------------

