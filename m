From: "Vincent" <cs83152@csie.chu.edu.tw>
Subject: Need a method to reset the ip_conntrack_count
Date: Thu, 13 Oct 2005 17:32:05 +0800
Message-ID: <007d01c5cfd8$fa089840$aa0ba8c0@l7.com.tw>
References: <002601c5b390$1d641d10$fefefe0a@jesseh7ht76e8n>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002601c5b390$1d641d10$fefefe0a@jesseh7ht76e8n>
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

Hello folks,

I have encountered one question. Does it have a way to flush the
conntrack table beside reloading the ip_conntrack module
 (because I use the method of building into kernel.

As far as I know, the current conntrack number was recorded in the
/proc/sys/net/ipv4/netfilter/ip_conntrack_count
So I want to know whether it exists a method or not to reset the current
counter of conntrack.

My Enviroment:
Kenel: 2.6.10
Iptables: 1.2.9

Any hint are appreciated.

Vincent



