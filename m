From: caruso bruno <b.caruso@laposte.net>
Subject: This rule doesn't work!...
Date: Tue, 11 Nov 2003 19:45:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311111945.01103.b.caruso@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi

I have seen recently that I had many attempt connection from source address 
127.0.0.1, source port 80. 

I had theses rules in my list:
iptables -A INPUT -i ppp0 -s "127.0.0.0/8" -m limit --limit 30/m -j LOG 
--log-prefix "iptable NO_ROUTABLE_ADDR "
iptables -A INPUT -i ppp0 -s "127.0.0.0/8" -j DROP

I haven't any log in syslog just for this rule otherwise everything goes well. 
I don't understand why theses rules doesn't work.

Best regards

Bruno


