From: "Peter Marshall" <peter.marshall@caris.com>
Subject: dns question
Date: Thu, 18 Nov 2004 08:32:11 -0400
Message-ID: <000d01c4cd6a$a1b8b240$49caa8c0@caris.priv>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I am sure this is a stupid question ...but I will ask anyway.  Should I be
allowing my dns server (in my dmz) connect to root servers ?   At the moment
it is being bloced, and the only thing it can connect to is my ISP's DNS
server.  Basically, my dns server serves requests for servers in my dmz for
my internal users.  If it can't find the hit, it passs the request on to my
ISP's ... I am trying to clean up my firewall logs, and noticed that the DNS
server is always trying to query root servers.  I was just not sure if this
should be allowed.  If it is not, (and I suspect there is no need to) Is
there a way to make my DNS server stop quering the root servers ?

PS  DNS is a rh9 box running bind.


Thanks,
Peter




