From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: ip_conntrack table is full with razor requests.  Something isn't
 timing out.
Date: Tue, 01 Mar 2005 08:32:05 -0900
Message-ID: <4224A715.8030907@aptalaska.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

List,

Since upgrading to 2.6.10 I have been having problems with my 
ip_conntrack table filling up.  It appears it is full of razor 
(http://razor.sf.net) requests from my internal mail server.

I raised the ip_conntrack_max to 8192 and there are only a few hosts 
behind nat so I am certain something isn't getting flushed out.

How do I go about diagnosing this.  What specifically does ip_conntrack 
need to see in the tcp session to mark the session as expired in the table?

Thanks,

schu

tcp      6 424864 ESTABLISHED src=192.168.98.2 dst=66.151.150.12 
sport=51075 dport=2703 packets=9 bytes=421 src=66.151.150.12 
dst=64.181.100.18 sport=2703 dport=51075 packets=7 bytes=577 [ASSURED] 
mark=0 use=1
tcp      6 401401 ESTABLISHED src=192.168.98.2 dst=66.151.150.35 
sport=50791 dport=2703 packets=7 bytes=317 src=66.151.150.35 
dst=64.181.100.18 sport=2703 dport=50791 packets=5 bytes=370 [ASSURED] 
mark=0 use=1
tcp      6 393358 ESTABLISHED src=192.168.98.2 dst=66.151.150.12 
sport=50627 dport=2703 packets=8 bytes=365 src=66.151.150.12 
dst=64.181.100.18 sport=2703 dport=50627 packets=5 bytes=370 [ASSURED] 
mark=0 use=1
tcp      6 376557 ESTABLISHED src=192.168.98.2 dst=66.151.150.35 
sport=49950 dport=2703 packets=9 bytes=421 src=66.151.150.35 
dst=64.181.100.18 sport=2703 dport=49950 packets=7 bytes=577 [ASSURED] 
mark=0 use=1
tcp      6 369805 ESTABLISHED src=192.168.98.2 dst=66.151.150.12 
sport=48990 dport=2703 packets=7 bytes=317 src=66.151.150.12 
dst=64.181.100.18 sport=2703 dport=48990 packets=5 bytes=370 [ASSURED] 
mark=0 use=1
tcp      6 368538 ESTABLISHED src=192.168.98.2 dst=66.151.150.35 
sport=48738 dport=2703 packets=7 bytes=317 src=66.151.150.35 
dst=64.181.100.18 sport=2703 dport=48738 packets=5 bytes=370 [ASSURED] 
mark=0 use=1
tcp      6 365641 ESTABLISHED src=192.168.98.2 dst=66.151.150.12 
sport=47914 dport=2703 packets=9 bytes=421 src=66.151.150.12 
dst=64.181.100.18 sport=2703 dport=47914 packets=7 bytes=577 [ASSURED] 
mark=0 use=1

