From: "antonio.dibacco" <antonio.dibacco@aruba.it>
Subject: Cannot route through an if without ip
Date: Sun, 14 May 2006 08:09:05 GMT
Message-ID: <20060514080905.18403.qmail@mx1.aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org


I have an ethernet (eth1) without any assigned ip, nevertheless I would like 
to route through this IF but issueing the following command gives an error: 

route add -net 192.168.1.0 dev eth1 

If the same IF has an address the command will be correctly executed. 

Why? 


