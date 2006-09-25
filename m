From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Countermeasures for SYN flood and DDoS attacks
Date: Mon, 25 Sep 2006 12:37:41 -0700
Message-ID: <BAY119-F49065D82325C9618A5088D6240@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I am looking to add protection to my linux and iptables based firewall 
specifcially for SYN flood and DDoS attacks to start with and, to that end, 
was trawling through the archives of this mailing lists and other places Mr. 
Google suggested I visit.

Unfortunately, what I found suggests that there is some debate about how 
best to approach this.

Specifically, many postings suggest using a 'limit' match such as...

-A INPUT -p tcp --syn -j syn-flood
-A FORWARD -p tcp --syn -j syn-flood
-A syn-flood -m limit --limit 100/second --limit-burst 150 -j RETURN
-A syn-flood -j LOG --log-prefix "SYN flood: "
-A syn-flood -j DROP

...or testing for TCP flag combinations...

-A INPUT -j syn-flood
-A FORWARD -j syn-flood
-A syn-flood-i -p tcp --tcp-flags ALL ACK,RST,SYN,FIN -j DROP
-A syn-flood-i -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
-A syn-flood-i -p tcp --tcp-flags SYN,RST SYN,RST -j DROP


....but other postings say that such rules will not help and in fact may even 
themselves act as a kind of internal DoS!

Here are a couple of example postings on this topic:
1) http://www.webhostingtalk.com/archive/index.php/t-355411.html
2) 
http://forums.devshed.com/security-and-cryptography-17/iptables-syn-flood-rule-for-a-busy-webserver-277224.html

So my question is, has there been a resolution to this debate?  If so, what 
was the result?

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Add fun gadgets and colorful themes to express yourself on Windows Live 
Spaces   
http://clk.atdmt.com/MSN/go/msnnkwsp0070000001msn/direct/01/?href=http://www.get.live.com/spaces/features


