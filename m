From: Bertram Scharpf <lists@bertram-scharpf.de>
Subject: Port forwarding inside local domain
Date: Mon, 20 Aug 2007 16:11:02 +0200
Message-ID: <20070820141102.GA19046@bart.bertram-scharpf.homelinux.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

just another question. Let my router be 192.168.7.33 with
interfaces eth0 and ppp0; then this works perfectly here:

  # iptables -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 \
      -j DNAT --to 192.168.7.49:80

However, I want to request from inside my local domain the
same way. This seems to end in a drop or an infinite loop:

  # iptables -t nat -A PREROUTING -d 192.168.7.33 -p tcp --dport 80 \
      -j DNAT --to 192.168.7.49:80

Besides that I want to know what is going wrong here, I
further would like to ask how I could debug this.

Thanks in advance.

Bertram


-- 
Bertram Scharpf
Stuttgart, Deutschland/Germany
http://www.bertram-scharpf.de

