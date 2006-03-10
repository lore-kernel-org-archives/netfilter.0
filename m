From: "=?ISO-8859-1?Q?Eduardo_Fern=E1ndez?=" <efgonzalez@gmail.com>
Subject: Rule to limit outbound packets?
Date: Fri, 10 Mar 2006 05:39:16 +0100
Message-ID: <fedfc260603092039y3b7fabfagf86b4310abab5696@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi!

I admin a linux router at a uni dorm, the internet link is adsl (low
upstream bw) so I to write a rule that limits (mostly outbound) p2p
traffic. I'm trying something like this:

iptables -A FORWARD -m limit --limit 200/s --limit-burst 200 -p tcp
--syn --dport 4662 -j ACCEPT
iptables -A FORWARD -p tcp --syn --dport 4662 -j REJECT

or

iptables -A FORWARD -o $IFOUT -m limit --limit 100/s --limit-burst
1000 -p tcp --syn --dport 4662 -j ACCEPT
iptables -A FORWARD -o $IFOUT -p tcp --syn --dport 4662 -j REJECT

but it doesn't seem to work. I can't use hashlimit because I only can
use 2.4 (any patch to use hashlimit in 2.4?).

Thanks a lot!

Edu

