From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Rules for blocking Email from libero.it domain
Date: Mon, 28 Oct 2002 09:04:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006901c27e8a$fbde4630$8c01a8c0@sundaram>
References: <OF4868D659.17C45E12-ON65256C60.003E4AD9-65256C60.004175C4@lntinfotech.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, harish.k@lntinfotech.com

Hi,

I want to block all incoming mail from the libero.it domain. I have NATed
mail server.

I set the following rules in my firewall, But still I am getting mails from
this domain.

Can you please help on this.?

#libero.it - 195.210.91.83
SIP=195.210.91.83
$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A FORWARD -s $SIP -j DROP


[root@gw root]# dig libero.it

; <<>> DiG 9.2.0 <<>> libero.it
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8861
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 0

;; QUESTION SECTION:
;libero.it.                     IN      A

;; ANSWER SECTION:
libero.it.              86169   IN      A       195.210.91.83

;; AUTHORITY SECTION:
libero.it.              86169   IN      NS      ns2.libero.it.
libero.it.              86169   IN      NS      ns1.libero.it.

;; Query time: 4 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Mon Oct 28 09:00:45 2002
;; MSG SIZE  rcvd: 79

-SR


