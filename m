From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: qos tc mark bridge
Date: Wed, 25 Aug 2004 13:11:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512DA@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I can do both, but not at the same time. My idea was:
> 1. Sort the traffic by (LAN, Company, WWW)
> 2. LAN, Company forward without shaping, put no mark on this packets.
> 3. Sort WWW-traffic by application into three buckets (chains...)
> 3.1 SSH, SSL connections to bucket 1, mark this packets with 1.
> 3.2 HTTP, SMTP, FTP connections to bucket 2, mark this packets with 2
> 3.3 the rest to bucket 3, mark this packtets with 3.

i *think* this was the part of your message that contained your actual =
question.  you're correct that "-j MARK" only works in MANGLE, and =
MANGLE doesn't allow jumping to custom chains; however, i don't see how =
what you want to do is impossible:

# don't mark packets from the LAN
iptables -t mangle -A PREROUTING -i $INT_IF -s $LAN -j ACCEPT

# SSH, SSL get mark 1
iptables -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 22 -j MARK =
--set-mark 1
iptables -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 443 -j MARK =
--set-mark 1

# HTTP, SMTP, FTP get mark 2
iptables -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 80 -j MARK =
--set-mark 2
iptables -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 25 -j MARK =
--set-mark 2
iptables -t mangle -A PREROUTING -i $INT_IF -p tcp --dport 21 -j MARK =
--set-mark 2

# anything else gets mark 3
iptables -t mangle -A PREROUTING -i $INT_IF -j MARK --set-mark 3

i venture to guess that i'm completely missing your point, as this =
doesn't seem that complicated.  maybe you need to re-phrase what your =
actual question is?

-j

