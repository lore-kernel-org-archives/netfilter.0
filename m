From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: IP spoofing
Date: Thu, 10 Apr 2003 13:39:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF50C701F@alderaan.smgtec.com>
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
To: farshadas@excite.com, netfilter@lists.netfilter.org

iptables -t nat POSTROUTING --source <my_bounced_ip> -o <outbound
interface> -p icmp -j SNAT --to-destination <my_bogus_ip>

-----Original Message-----
From: Farshad [mailto:farshadas@excite.com]=20
Sent: Thursday, April 10, 2003 1:27 PM
To: netfilter@lists.netfilter.org
Subject: IP spoofing


Just a naive question:
using netfilter, is it possible to grab a packet and change its IP
source address and then reinject it as if it has been sent from another
source?

thanks!



_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!


