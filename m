From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: DMZ Question
Date: Mon, 4 Oct 2004 11:11:56 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679545@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>, Deepak Seshadri <dseshadri@broadbandmaritime.com>, netfilter@lists.netfilter.org
Cc: Imran Bashir <ibashir@broadbandmaritime.com>, Veena Rao <vrao@broadbandmaritime.com>, Syed Amjad Ali <sali@broadbandmaritime.com>, Zia Ullah <szia@broadbandmaritime.com>


> 2. ProxyARP the IP address (http://www.sjdjweis.com/linux/proxyarp/):
> 	echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
> 	echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
> This will then get the DNAT from iptables.
> 	iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
> ${My_NEW_ADDR}

Scratch this: It only applies to bridged configurations where NAT is NOT
used...

