From: "Bealach Na Bo" <bealach@gmail.com>
Subject: IPinIP ipencap with iptables
Date: Mon, 10 Apr 2006 22:19:44 +0200
Message-ID: <c4bf8e090604101319p2a7b3967te71f693fee608365@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello folks,

 I'm new to iptables and have got most things to work on my Debian FW
machine using iptables. What I'm really struggling with is
 finding the iptables equivalent of my current ipfw rules for IPinIP.
These are very simple in ipfw and allow me to connect to my work
machine.


 # Allow bi-directional IPinIP traffic
 ipfw add 300 allow ipencap from 192.168.0.0/24 to 193.0.252.50
 ipfw add 301 allow ipencap from 192.168.0.0/24 to 193.0.252.52
 ipfw add 310 allow ipencap from 193.0.252.50 to 192.168.0.0/24
 ipfw add 311 allow ipencap from 193.0.252.52 to 192.168.0.0/24


 Any help would be very much appreciated.


 Regards,


 Bealach

