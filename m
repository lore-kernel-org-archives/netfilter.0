From: "GeorgePing" <gping@ozemail.com.au>
Subject: ipchains port forward to a web server behind the masq'ing firewall
Date: Wed, 19 Mar 2003 14:51:10 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2edca$c8536340$35f0280a@GP2KPRO>
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
To: netfilter@lists.samba.org


I am working with linux 7.3, just can not set up the port forward rule to
re-direct external http access to the firewall (ppp0) into an internal
network web server.
The firewall is doing masq'ing.


could u pls give an example?

I tried   ipchains -A input -i ppp0 -p tcp  --sport 110 --dport 80:80 -j
REDIRECT --destination 10.40.240.100/32 , but don;t think it is correct.
Thanks for your help.

George


