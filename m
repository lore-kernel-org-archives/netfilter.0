From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: TCP flags
Date: Wed, 6 Nov 2002 16:03:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005401c2856b$099aa5c0$0bc8c80a@dolphin>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>

Helo,

Can anyone just explain what is this means?

iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

I don't quite understand why there is a white space between SYN,FIN and
SYN,FIN.

.//Jet


