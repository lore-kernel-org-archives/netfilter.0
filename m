From: deniska@westnet.com.au
Subject: Traffic counts wrongly in OUTPUT.
Date: Sat, 5 Mar 2005 17:46:03 +1030
Message-ID: <12893.1204475977$1110006499@news.gmane.org>
Reply-To: deniska@westnet.com.au
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

My counter in OUTPUT grows with >10MBytes/sec but I have only 64kbit of
bandwidth. I have QoS shaping outgoing traffic, so, my guess is, the
kernel sends packets as quick as possible but most of them are
dropped in a queue by QoS.

Now the question: is it possible to obtain the correct value of
out-counters in iptables?

Regards,
D.

