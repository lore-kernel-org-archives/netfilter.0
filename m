From: "Chris Hoeschen" <chris.hoeschen@primevest.com>
Subject: RE: Mangling problem
Date: Wed, 21 May 2003 08:26:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <06f501c31f9c$9f34e930$7035a8c0@hoeschen>
References: <000001c31f8f$1866f1d0$88cc858b@TOSHIBAFIRE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c31f8f$1866f1d0$88cc858b@TOSHIBAFIRE>
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
To: 'Regina Reine' <regina@erg.abdn.ac.uk>
Cc: netfilter@lists.netfilter.org

I maybe wrong but I don't believe netfilter will process any packets not
intended for that box.  TCPDump will see it as in a hubbed environment
all nodes receive all packets but only those that are destined for that
box will netfilter process.

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
| Chris Hoeschen - Distributed System Analysts        |
| PrimeVest Financial Services                        |
| (320) 656-4035 E-Mail: chris.hoeschen@primevest.com |
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

"Only two things are infinite, the universe and human stupidity, and I'm
not sure about the former." 
  -- Albert Einstein
Hippopotomonstrosesquippedaliophobia is the fear of long words


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Regina Reine
Sent: Wednesday, May 21, 2003 6:50 AM
To: netfilter@lists.netfilter.org
Subject: Mangling problem



Hi,
I am doing an experiment with iptables. I use a hub to connect two
computers. Computer A captures the video packet (or any packets) and
computer B runs iptables and my code in Red Hat 8. Basically, with hub,
computer B will be able to see the packets coming to computer A. I would
like computer B to preroute this packet and put these packets in
userspace where I run my code. 

I uses :

** Iptables -t mangle -I PREROUTING -p udp -I eth0 -j QUEUE

However, seems like I only be able to capture broadcast packets. (But
TCPDUMP could see the udp packets). I have checked my code (just a
simple code that scan what kind of packets and it worked with udp
generator such as iperf or hping). 
I have tried a few other similar ways but still only could capture
broadcast packets. Does anybody spots my mistake or could give me advice
for better solution? Thank you

Best regards,
Regina Reine





