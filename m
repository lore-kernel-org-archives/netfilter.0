From: mdew <mdew@mdew.dyndns.org>
Subject: blocking servers
Date: 06 Mar 2003 17:25:10 +1300
Sender: mldonkey-users-bounces+gnm-mldonkey-users-651=gmane.org@nongnu.org
Message-ID: <1046924708.1182.6.camel@nirvana.flat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <mldonkey-users-bounces+gnm-mldonkey-users-651=gmane.org@nongnu.org>
List-Id: <netfilter.vger.kernel.org>
List-Help: <mailto:mldonkey-users-request@nongnu.org?subject=help>
List-Post: <mailto:mldonkey-users@nongnu.org>
List-Subscribe: <http://mail.nongnu.org/mailman/listinfo/mldonkey-users>,
	<mailto:mldonkey-users-request@nongnu.org?subject=subscribe>
List-Archive: <http://mail.gnu.org/pipermail/mldonkey-users>
List-Unsubscribe: <http://mail.nongnu.org/mailman/listinfo/mldonkey-users>,
	<mailto:mldonkey-users-request@nongnu.org?subject=unsubscribe>
Errors-To: mldonkey-users-bounces+gnm-mldonkey-users-651=gmane.org@nongnu.org
Content-Type: text/plain; charset="us-ascii"
To: mldonkey-users@nongnu.org
Cc: netfilter@lists.netfilter.org


Ive been messing with iptables, trying to block the connection o 
certain mldonkey general servers.

On my firewall, i used these lines...

iptables -A FORWARD -s 10.0.0.3 -d 148.216.18.89 -j DROP
iptables -A FORWARD -s 10.0.0.3 -d 24.128.236.196 -j DROP
iptables -A FORWARD -s 10.0.0.3 -d 24.132.124.37 -j DROP

but I still managed to connect to the servers

-- 
mdew <mdew@mdew.dyndns.org>
