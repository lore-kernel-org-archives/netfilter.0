From: bash <0x62ash@gmail.com>
Subject: IPSET question
Date: Mon, 27 Mar 2006 23:20:26 +0400
Message-ID: <20060327232026.618f7e56.0x62ash@gmail.com>
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
To: netfilter@lists.netfilter.org

 Hello All,
I have question about IPSET:
how to create new set with some random ip-addresses and nets (in cidr
format).

For example, I have "10.21.0.0/16", "10.90.20.0/26" networks and
"10.22.0.30", "10.23.0.30" ips.

I thought that "nethash" type of set will works, but as I see from
documentation (http://ipset.netfilter.org/ipset.man.html), "nethash"
can't handle net with /32. So i cant add "10.22.0.30" and "10.23.0.30"
ip in "nethash" SET :////

So... how to be? :)))


 -- 
Biomechanica Artificial Sabotage Humanoid

