From: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Subject: Masquerading on local ports
Date: 20 Mar 2003 15:03:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048169013.1491.107.camel@localhost.localdomain>
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

Hi everyone - this is my first post to this list - so if anything is
wrong with my way of posting please tell.

And here is the question. How is it possible to nat a lokal port?

IPTABLES -t nat -A PREROUTING -p tcp -d 127.0.0.1 --destination-port 81
-j DNAT --to-destination 127.0.0.1:80

telnet localhost 80  <<< works
telnet localhost 81  <<< Connection refused

Henry






