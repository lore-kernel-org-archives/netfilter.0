From: "Abe Froman" <abe__froman@hotmail.com>
Subject: ./runme extra doesnt prompt me for MATCH_STRING
Date: Sun, 19 Jun 2005 14:51:00 -0400
Message-ID: <BAY101-F22646AD0C81F9DC5176472B0F60@phx.gbl>
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

I am running patch-o-matic with extra, but it doesnt prompt me for the 
string package. Got any tips?

It goes:
...........

Testing rtsp-conntrack... not applied
The rtsp-conntrack patch:

Testing sip-conntrack-nat... not applied
The sip-conntrack-nat patch:

Testing talk-conntrack-nat... not applied
The talk-conntrack-nat patch:

.........

According to this page:
http://www.netfilter.org/patch-o-matic/pom-extra.html
the CONFIG_IP_NF_MATCH_STRING should come inbetween rtsp-conntrack patch and 
talk-conntrack-nat patch but its not sip-conntrack-nat patch

How do I get it to prompt for match string?



