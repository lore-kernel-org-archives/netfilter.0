From: "Brian Ugie" <bugie@pzs.com>
Subject: iptables and DNS
Date: Tue, 04 Jun 2002 09:51:31 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <scfc8dba.094@pzsj-office.pzs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,

  I am hoping that someone can explain the role that DNS has in
relation to iptables and if there is a way to stop iptables from
resolving. 

  I have a network where a netscreen firewall sits in front or our
servers. We map public IPs to the servers and do initial port filtering
from the netscreen. We also want to have each machine filter just in
case the windows box gets compromised ;). It has seemed to me that
iptables will not first use /etc/hosts to resolve but will go straight
to the DNS server. Is this a valid statement? nsswitch.conf lists file
first. Since DNS will resolve the server to a public address but it is
actually on a private address, iptables get confused and the net result
is long delays on ssh and ftp logins and server time outs on DNS
queries. 

  To test my theory I set the DNS record to the private ip and that
worked like a champ. I feel that I am left with only the option to
create views in bind.

  Has anyone else out there seen this or know of a better solution? 

Thanks in advance,

Brian

