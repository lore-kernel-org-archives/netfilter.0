From: Doug Kehn <rdkehn@yahoo.com>
Subject: conntrack and PREROUTING
Date: Thu, 19 Jun 2008 16:57:18 -0700 (PDT)
Message-ID: <869998.64693.qm@web52012.mail.re2.yahoo.com>
Reply-To: rdkehn@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

Is the PREROUTING chain bypassed if a connection is ESTABLISHED?  There are hints to this in the documents I've read but I haven't found anything definitive.

I'm using Dansguardian with TinyProxy with the following rule:

iptables -t nat -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3129

Everything is working, from a proxy perspective, as expected.  However, if I play a high bit-rate (>4 Mbps) video stream over HTTP, the playback is very choppy.  The choppiness is due to ACK latency through the proxy.  (Video playback is fine if I remove the proxy.)  

I know I could just create a nat PREROUTING rule to bypass the proxy for the site I'm attempting to stream video from but I'm looking for a more general solution.  Thus, what I'm attempting to do is have ACKs bypass the proxy after the connection is ESTABLISHED.  I tried using the raw table in PREROUTING but the my rule was never hit.  (Thus, the reason for my first question.)  The raw table rules I attempted were:

iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i br0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -m state --state ESTABLISHED -j NOTRACK

   -and-

iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i br0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -m conntrack --ctstate ESTABLISHED -j NOTRACK

Is what I'm attempting to do possible with the existing implementation?  Does this even make sense?

I'm attempting to do this on a home router that is running Linux 2.6.18 with iptables v1.3.7-20070509


Thanks,
...doug



      
