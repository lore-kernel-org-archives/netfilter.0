From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: DROP command
Date: Thu, 3 Jul 2003 13:55:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E355A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Remus <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org

Reverse the order

-----Original Message-----
From: Remus [mailto:rmocius@auste.elnet.lt]=20
Sent: Thursday, July 03, 2003 1:44 PM
To: netfilter@lists.netfilter.org
Subject: DROP command

Hi folks,

I have a Linux box firewall (iptables 1.2.7a) with NAT/MASQUERADING.
How I can block all local network access to my firewall excluding some
local
IP addresses?
I tried these command but it doesn't work:

/usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.0/24 -j DROP
/usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.20 -j ACCEPT

Thank you in advance

Remus





