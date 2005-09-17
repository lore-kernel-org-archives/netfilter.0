From: "Giacomo" <delleceste@gmail.com>
Subject: obtain external address of an interface
Date: Sat, 17 Sep 2005 14:29:34 +0200
Message-ID: <000d01c5bb83$77de3b90$0300a8c0@giacomino>
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
To: netfilter lists <netfilter@lists.netfilter.org>

Good morning, what kernel space function could i use to get the ip address 
of the
interface connected to the external Internet?

When i receive a packet, i would like to compare its destination address 
with the one
corresponding to the interface connected to the internet, to distinguish
packets that originate from my internal net between those who come from the 
internet

Thanks.

Giacomo 


