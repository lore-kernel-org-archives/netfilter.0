From: "Simpson, Doug" <DSimpson@friedmancorp.com>
Subject: natting specific ports
Date: Fri, 13 Dec 2002 11:48:32 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CAFAAEC91CC8D511952000062938C6F12ECDC0@ozlan.fcdomain.net>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I want to "NAT" just specific ports to my Public IP.  Do the commands below
make sense?  I want my internal network to be able to telnet and send email.
(eth0 is my External NIC - it is exposed to the internet) 
iptables -t nat -A POSTROUTING -p tcp --sport 25 -o eth0 -s $INTERNAL_IP -j
SNAT --to $EXTERNAL_IP
iptables -t nat -A POSTROUTING -p tcp --sport 23 -o eth0 -s $INTERNAL_IP -j
SNAT --to $EXTERNAL_IP

Thank you,
Doug

