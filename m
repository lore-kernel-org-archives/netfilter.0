From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: Can't confirm limit rule works with tcpdump output.
Date: Thu, 29 Jul 2004 15:04:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4109828F.90609@aptalaska.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ok I have this rule in my firewall:

iptables -A INPUT -p udp -d <HOSTA> --dport 1646 -m limit ! --limit 
10/sec --limit-burst 20 -j LOG --log-prefix "IPTABLES Radius limit: "

 From what I have read this should create a bucket that can hold 20 
tokens and fill it at a rate of 10 tokens per second.  For every packet 
with the DST address <HOSTA> on port 1646 take a token out of the 
bucket.  If the bucket is completely empty then match (because of 
negation) and process the LOG target.

This is not what happens because my tcpdump output shows nothing close 
to 10 packets per second yet the rule matches and logs.

I know I'm missing something here can someone point it out to me?

Thanks,
schu

