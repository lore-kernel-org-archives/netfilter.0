From: jrw@ngi.be
Subject: ip_conntrack
Date: Thu, 17 Oct 2002 11:37:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A4C806B83AC1974E8A2AC21267B922D62D272E@exchange.int.ngi.be>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
How could I remove a connection listed in the ip_conntrack file?
Because, now, I must wait until the timeout...
And if it's not possible, is there a way to change the timeout?

In my rules, I have the following line :
${IPTABLES} -A FORWARD -o eth1 -m state --state ESTABLISHED,RELATED      -j
ACCEPT 
and thus, old connection are accepted even if I restart iptables. I must
reboot the server to clean the connections listing.

Thansk for any help

-- 
  .''`. | Jean-Robert WIAME 
 : :' : | jrw AT ngi.be
 `. `'  | BELGIUM 
   `-   |  
--

