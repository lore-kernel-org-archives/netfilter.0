From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: transparent bridge troubles?
Date: Fri, 7 Jan 2005 12:42:27 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679643@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: mdpeters <michael.peters@lazarusalliance.com>, netfilter@lists.netfilter.org

You missed a QUEUE target

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j

QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state=20
RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE


Becomes

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -j LOG
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j
QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state
RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -j LOG

