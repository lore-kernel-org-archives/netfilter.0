From: Vinicius <cviniciusm@terra.com.br>
Subject: Doubt about ulog and postgresql?
Date: Sun, 27 Feb 2005 23:37:46 -0300
Message-ID: <cvtvtc$bkv$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I did put the followed rule in the iptables "iptables -I 
RH-Firewall-1-INPUT 8 -p tcp -j ULOG --ulog-prefix "Firewall: "", just 
before the last rule (rulenum 8) that rejects all packets.

I did set up the file /etc/ulogd.conf to use a postgresql table such as 
the example at /usr/share/doc/ulogd-1.21/, and I have created the 
database ulogd and the table ulog as suggested there, with the same user 
and password than the ones on ulogd.conf.

So, when I did do "/etc/init.d/ulogd restart" the system entered an 
endeless loop.

Where could I find information about how to use postgresql with ulog 
propely, please?

The relevants info:
kernel-2.6.10-1.766_FC3
kernel-utils-2.4-13.1.49_FC3
iptables-1.2.11-3.1.FC3
ulogd-1.21-1
ulogd-mysql-1.21-1
ulogd-pgsql-1.21-1
postgresql-7.4.7-3.FC3.1
postgresql-libs-7.4.7-3.FC3.1
postgresql-server-7.4.7-3.FC3.1

TIA,
Vinicius.


