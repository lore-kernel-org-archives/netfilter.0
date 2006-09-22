From: "Oliver Schulze L." <oliver@samera.com.py>
Subject: Forwarding multiple UDP ports
Date: Fri, 22 Sep 2006 12:17:29 -0400
Message-ID: <45140C99.8040205@samera.com.py>
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
I have a intranet server that initiate UDP connections and I want to forward
those connections to and Internet IP.

I have a Linux box with 2 NICs.

My question is: can I forward UDP trafic from and internal server to the 
Internet?
Can I use this line:

iptables -t nat -A PREROUTING -p udp -s INTRA_SERVER -d INTRA_ROUTER 
--dport 1024:6000 -j DNAT --to-destination INET_IP:1024-6000

I'm testing it and I see the rule matched, the byte and packet counters 
are incrementing.
But, I see no traffic going out of the Internet NIC.
I'm not sure if the multi-port specification will work.

Thanks!
Oliver

-- 
Oliver Schulze L.
Get my e-mail after a captcha test in: http://tinymailto.com/oliver


