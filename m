From: "Frank Pieczynski" <pieczy@web.de>
Subject: <no subject>
Date: Mon, 24 May 2004 15:46:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <679890948@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello, 
for load tests of a application, which requires a own IP address for each 
User, and have to support hundred of thousand ... millons of users, I try to 
simulate the users and handle the ip issues with netfilter. I'd like to 
avoid promiscous mode and virtual interfaces. 
 
Every Linux test box handle for examle 65.000 users. 
The test application fakes during sending the source ip, so for the app 
server it looks ok. 
On the app server some additional routing entries route the packets to the 
users according to the range of user ip's to the specific Linux test box. So 
netfilter should forward these incoming packets to the local test 
application: 
iptables -t nat -A PREROUTING -i eth0 -p udp --dst 10.132.0.0/16 \ 
-j REDIRECT --to-port 5000 
and the test app can ask for the original destination using getsockopt() - 
like squid.                                                                                                                                      
but I don't see the answers in the PREROUTING queue? 
They are visible with ethereal on eth0, but also a plain logging rule:                                                                                
iptables -t nat -A PREROUTING -j LOG Prerouting 
doesn't show the incoming packets??? 
BUT they are listed in the mangle table (but here I cannot use the REDIRECT 
target). 
 
A very interesting thing: 
If I modify the route showing to a different Linux box and use there a DNAT 
rule instead of REDIRECT, then it works as expected. Of course this has the 
disadvantage, that the information about the original destination IP is 
lost, so why it doesn't work on the local system? 
Does the use of the spoof during send create some implicite rules, so that 
later answers to that are not visible in the PREROUTING queue? 
Any tipps would be nice. 
 
Thanks 
Frank    
 -- 
For every complex problem there is a solution 
which is simple, neat and -- wrong. 
 
_____________________________________________________________________
Endlich SMS mit Bildern versenden! Das Bild selbst ist dabei gratis,
Sie bezahlen lediglich den Versand. http://freemail.web.de/?mc=021195


