From: Ashutosh <ashutosh@teneoris.com>
Subject: FTP Connection State Tracking Issue
Date: 29 Nov 2004 19:19:40 +0200
Message-ID: <1101748780.12476.3083.camel@ashutosh.teneoris.com>
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
Cc: ashutosh@teneoris.com

Hi Everyone,

My question is, that if I have already loaded the ftp connection
tracking and nat modules, do i still need to write scripts like the
following on my firewall, to enable FTP Access from inside to outside ( 

My Default Rules are -

Allow Outgoing connection tcp on port 21
Deny all other outgoing connections

Scripts
(For Active FTP)
iptables -A INPUT     -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED-j ACCEPT
iptables -A OUTPUT-p tcp --dport 20 -m state --state ESTABLISHED-j
ACCEPT

(For Passive FTP)
iptables -A INPUT     -p tcp --sport 1024: --dport 1024:  -m state
--state ESTABLISHED-j ACCEPT
iptables -A OUTPUT-p tcp --sport 1024: --dport 1024:  -m state --state
ESTABLISHED,RELATED-j ACCEPT

-- 
Ashutosh Naik
Teneoris Networks India Pvt. Ltd
www.teneoris.com


