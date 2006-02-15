From: Frank.Mayer@knapp-systems.com
Subject: SNAT of ICMP errors: impossible?
Date: Wed, 15 Feb 2006 12:29:14 +0100
Message-ID: <OF1C6E51C1.761C9A8A-ONC1257116.003D7BBC-C1257116.003F19A0@knapp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I'm not sure whether this is the correct list to aks for this:

I have an IPSec-tunnel 
        172.20.0.0/16---<my gateway>===<other gateway>---10.72.50.0/24
One problem is, that between <other gateway> and the target network, there 
is an MTU bottleneck that requires reducing the MTU from 1500 bytes to 
some lower value.
Via iproute, I did specify this reduced MTU for the corresponding route on 
my gateway, and my gateway does generate corresponding ICMP messages (host 
unreachable: fragmentation needed), BUT
        my gateway does send these messages with Src-Address: <my public 
ip> to Dst-Address: <10.72.50.x>,
so that they, of course, do not cross the tunnel.
As I did find out, this kind of packets does not seem to enter the 
POSTROUTING chain, so I cannot SNAT them.

What can I do?

Best Regards and many thanks in advance for your input,
Frank Mayer
UNIX Systemadministration
----------------------------------------------------
KNAPP Systemintegration GmbH
Waltenbachstrasse 9
8700 Leoben, Austria
----------------------------------------------------
Phone: +43 3842 805-921
Fax: +43 3842 82930-921
frank.mayer@knapp-systems.com
www.knapp.com

