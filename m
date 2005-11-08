From: "jywang" <jywang@cnic.cn>
Subject: How to reroute the skb
Date: Tue, 8 Nov 2005 08:55:19 +0800
Message-ID: <002401c5e3ff$16f50850$060ae29f@javaboy>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Hi,all
    in the NF_IP_LOCAL_OUT function, i change the destination ip,
so, the packet should be reroute. but, i don't know how to do this.
should i must change the sock associate with the skb. that means i
must change the source ip, source port, destination ip and port in
the inet_opt.

i don't know how to resolve.

jinyi




