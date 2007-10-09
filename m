From: Chad Eldridge <celdridge@corp.web.com>
Subject: SNAT
Date: Tue, 09 Oct 2007 14:47:35 -0400
Message-ID: <470BCCC7.2070007@corp.web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a situation where I have packets coming into a server (we'll call 
it RTR) and getting routed to other servers depending on the ip address 
the packet is coming from. This part works great. The problem I am 
having is when the server (call it Responder) answers back to the 
original client (not going back through RTR), the client sees the 
traffic coming from an address it did not originally try to open a 
connection to and therefore rejects the packets and the connection is 
never established. I thought I could fix this by using SNAT to change 
the source ip on Responder.
iptables -t nat -A POSTROUTING -p tcp -m tcp --sport $PORT -j SNAT --to 
$RTR-IP
This however, seems to do nothing. The Responder still sends replies to 
the client, they make it to the client and show up as coming from the ip 
address of Responder.
It was suggested to me that I would need to turn off rp_filter (echo 0 > 
/proc/sys/net/ipv4/conf/all/rp_filter; echo 0 > 
/proc/sys/net/ipv4/conf/eth0/rp_filter) since the ip address I am trying 
to change the source to does not actually exist on the server. I tried 
that but it did not seem to help. Further more it was suggested that I 
could setup the $RTR-IP on a loopback and arptables it off and then it 
should work. This did not work either. If it is because iptables is 
trying to prevent spoofing I'm guessing it is stopping it because it's 
trying to send it out an interface that does not have the ip on it. Then 
again, all of this guessing could be wrong.
Is this even possible with iptables? If so, how can I accomplish it? 
Everything I have seen that seems like it should work has so far failed.
iptables v1.2.8
Redhat ES3
(Final box will probably be running ES4)

Thanks,

-- 
Chad Eldridge
Security | Web.com
celdridge@corp.web.com
404.260.2580

