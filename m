From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: ICMP: What should be blocked?
Date: Wed, 05 Mar 2003 16:09:57 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E65A2C5.3030007@mega-bucks.co.jp>
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

I been googling the web trying to find what rules I should set up for 
ICMP but I've seen some people say one thing while other say something 
completely different.

One question I have not been able to find an answer to though, should I 
block ICMP messages of type 11 (TTL exceeded)?

Also if anyone knows of a good resource that explains what ICMP messages 
I should block (why and how :) could they let me know? I understand that 
it of course depends on my level of paranoia and how friendly I want to 
be to the rest of the net, but I get the feeling from my readings that 
the are some ICMP messages that just should not be let through a 
firewall ....

Thanks,

Jc


