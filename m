From: Jasbir Khehra <jasbir.k@gmail.com>
Subject: iptables v1.3.4: STRING match: You must specify `--algo'
Date: Mon, 07 Nov 2005 18:08:05 +0530
Message-ID: <1131367085.11452.9.camel@localhost.localdomain>
Reply-To: jasbir.k@gmail.com
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
Content-Type: text/plain; charset="us-ascii"
To: pablo@eurodev.net, netfilter@lists.netfilter.org

Hi,
   while  running this command
# iptables -t nat -I PREROUTING -p tcp -s 192.168.2.20 -m string
--hex-string '0d0a0d0a594d5347' -j REJECT

Not able to get the different options for '--algo' parameter . 
Kernel 2.6.14 iptables v1.3.4  thanks - Jasbir 


