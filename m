From: Klaus Boehm <k.boehm@ewt.de>
Subject: view nat rules
Date: Mon, 29 Sep 2003 10:09:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F77E8BC.1090502@ewt.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

How can i view the nat rules.

i did iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source xx.xx.xx.xx
 
 and then i tried iptables -L POSTROUTING
but this doesn't work.

Thanks.

Klaus


--


ewt gmbh
data management group
tel: ++49 821 3106 319
fax: ++49 821 3106 399
url: www.ewt.de




