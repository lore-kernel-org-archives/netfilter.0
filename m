From: Frank.Mayer@knapp-systems.com
Subject: address ranges for DNAT?
Date: Thu, 2 Feb 2006 17:18:44 +0100
Message-ID: <OF4D424FC0.85176AB6-ONC1257109.0057FA9D-C1257109.00599B45@knapp.com>
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

I need to map a whole /24 network of incoming addresses to a different /24 
network, e.g.
10.0.1.0/24 -> 1921.168.27.0/24
such that 
10.0.1.1 is mapped to 192.168.27.1,
10.0.1.2 is mapped to 192.168.27.2,
and so on to
10.0.1.254 is mapped to 192.168.27.254

Is there any short syntax for this or do I really need to define 254 
single DNAT rules?

Thanks in advance for your help!

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

