From: "Alexis" <alexis@tpys.com.ar>
Subject: off topic - hope somebody can help
Date: Thu, 10 Jun 2004 22:27:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c44f53$44b9be80$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Does anybody knows why ethernet interfaces stay's up even when i unplug the
ethernet cable?

I have 2 isp connected to a box, with a default route pointing both of them one
using a higer weight to use it as backup conection (using iproute2). Ok, if i
unplug the ethernet cable of eth of isp1 , the ethernet card stays up and nobody
can make any connection. But, if i "really" force the interface shutdown of
provider1 (doing ifdown eth1) the traffic goes instantly trough provider2.

Any idea how can i tear down an interface when i unplug the ethernet cable?

Thanks in advance.



