From: "Domenico Gargano" <d.gargano@planetek.it>
Subject: Refused SYN packets for 15min.
Date: Wed, 25 Feb 2004 17:33:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403CDC51.16545.1D46DD2@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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
To: netfilter@lists.netfilter.org

Hi all,
I've got a strange problem on my fw, here's my lan:

Fw with 3 eth

eth0: external router
eth1: internal LAN
eth2: DMZ

During the day, sometimes happens that the fw stop accepting incoming SYN packet 
(and I can't establish a new connection) for 15 min. mantainig instead the 
ESTABLISHED connection.
I've disabled syn-floodin protection in kernel, I've tried flushing rules, raised kernel 
buffers, looked inside /proc/net/ip_conntrack finding nothing strange.
My client coming from Internet can't see my website, or a LAN client can't connect to 
internet or DMZ.
During this "ban" time (15 min.) it seems I can't do nothing restoring connections.
Also it seems that my fw "ban" not all the net, but some client.

Any ideas?
Thanks

my sys: rh9, kernel 2.4.20-30.9 (latest official patch)
my hw: 2cpu PIII Xeon + 1,5gb RAM



-- 
~~~~  Domenico Gargano  [Network Administrator]  ~~~~
Planetek Italia s.r.l.                        :tel:+39 080 5343750
Via Massaua, 12 - I-70123 BARI     :fax:+39 080 5340280
~~~ email: gargano@planetek.it ~~~ www.planetek.it ~~~



