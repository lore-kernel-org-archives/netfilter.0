From: "Vijay Kumar" <vijay@calsoftinc.com>
Subject: Vijay - port 25 to be blocked
Date: Tue, 28 Dec 2004 21:52:46 +0530
Message-ID: <E1CjK8v-0006v5-00@deer.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I want to allow my internal network to only connect to some specific =
email
servers.
Apart from these mail server  I want to block port 25 and 110 from my
internal network to anywhwere. I am doing the following :=20

iptables -I INPUT -I eth0 --dport 25 -d  !<ip addr of mail server>  -j
REJECT =20
=20
This does not seem to block the port 25 traffic. Where am I going wrong? =


Kindly help.=20

Regards,
Vijay Kumar

=A0



