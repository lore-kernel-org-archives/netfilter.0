From: Peggy Kam <ppkam@n-dsi.com>
Subject: multiports
Date: Thu, 04 Aug 2005 15:36:30 -0400
Message-ID: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
Reply-To: ppkam@n-dsi.com
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
To: netfilter@lists.netfilter.org

Hi,

Is it possible to match multiple source and destination ports at the
same time?  It seems to me that it is not possible.  I am using iptables
version 1.2.11 and I have tried the following command:

iptables -A INPUT -p tcp --src 192.168.1.0/255.255.255.0 -m tcp -m
multiport --sports 22,80  --dst 192.168.22.123 -m multiport --dports
22,80 -j ACCEPT

Please correct me if I have the wrong syntax.  Any advice is
appreciated.

Thanks in advance,
Peggy


