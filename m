From: John Mathey <jmathey@attbi.com>
Subject: IPTABLES forward to multiple dests
Date: Mon, 07 Apr 2003 13:29:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030407132655.02187e10@mail>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,
         I would like to know if there is a way to forward a packet to 
multiple destinations. If I receive a packet, and I filter for specific 
charactersistics, ( ie: port and protocol), can I somehow forward that to 
multiple destinations on my private network. I don't see how since once you 
forward it it's gone from our control, but if there was someway to make a 
copy of that packet and forward the copy, thay MIGHT accomplish it.

Any ideas or suggestions are appreciated

Thanks
John



