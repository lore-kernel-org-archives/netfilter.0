From: "Alex. van Meerendonk" <a.van.meerendonk@st.hanze.nl>
Subject: Problem with fxp
Date: Sat, 26 Jun 2004 15:23:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406261322.i5QDMSS1013852@dep.oprit.rug.nl>
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
To: netfilter@lists.netfilter.org

Hello,

I'm running Debian with kernel 2.6.6 and iptables 1.2.9 but for some reason
I can't get fxp to work except when I set the firewall to accept every
incoming connection.

The weird thing is that it worked before but after I updated the whole
system some ago to kernel 2.6.x, fxp simply 'stopped' working.

Fxp from my ftpserver to another still works, but incoming fxp transfers
'hang' after sending the port command.

I've opened all required (20, 21 both UDP and TCP) ports on the firewall and
the required passive port range I configured proftpd on.

Thanks to google I found some article about kernels 2.4.x and higher not
being able to do FXP transfers. Is this true and is there some workaround?


Greets,
Alex. van Meerendonk


