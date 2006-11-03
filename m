From: "woger151" <woger151@jqpx37.cotse.net>
Subject: hashlimit bucket
Date: Fri, 3 Nov 2006 07:20:07 -0500
Message-ID: <006f01c6ff42$75dbc7a0$6401a8c0@apollosjf>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Can one have multiple iptables rules with hashlimit statements, with the 
same --hashlimit-name? And would that means there's actually just one bucket 
for all those rules? Can one have multiple hashlimit rules, period? What 
about different chains feeding into one chain with a hashlimit statement? Is 
that OK?

TIA 


