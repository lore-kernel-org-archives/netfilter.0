From: Juerg.Oehler@idzedi.admin.ch
Subject: filter rpc pgm#
Date: Mon, 14 Jun 2004 08:36:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <516423986E18D511B0A700508BB85789027F2A83@edi002ex.idzedi.admin.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

we are working with some tools based on rpc (such as nfs, legato, stornext
....). the authorisation based on ports forces us to open the firewall for
huge port-ranges. but there are only a few known rpc programnumbers, which
are linked to the right rpc-servers.

i am wondering if i could configure netfilter using these programnumbers?
are there already features in the core or extensions? 

could look like <iptables -A INPUT -p rpc --pgmnum 1073741827 -j ACCEPT>

thanks
have fun
juerg

