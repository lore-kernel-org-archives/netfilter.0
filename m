From: =?ISO-8859-15?Q?Fr=E9d=E9ric_Massot?=
 <frederic@juliana-multimedia.com>
Subject: Iptables & Net-SNMP
Date: Wed, 04 Feb 2004 20:07:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <bvrfsk$8tb$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Do you Know if it is possible on a firewall (Netfilter) to measure the 
consumption of the bandwidth by server IP addresses ?

By installing Net-SNMP on the firewall and MRTG on another server, I 
know how to measure the total consumption of the bandwidth.

To separate measurements by server IP addresses, I think of connecting 
Iptables to Net-SNMP, but I do not see how and if it is possible ?

The installation of Net-SNMP on each server is not interesting, being 
given that certain server can communicate between them, and that there 
is traffic coming from the internal network.

Here is, if somebody has an idea...

Best regards.
-- 
==============================================
|              FREDERIC MASSOT               |
|     http://www.juliana-multimedia.com      |
|   mailto:frederic@juliana-multimedia.com   |
===========================Debian=GNU/Linux===



