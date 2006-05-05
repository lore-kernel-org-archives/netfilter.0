From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: iptables empty ipset matches on address of 0.0.0.0?
Date: Thu, 04 May 2006 17:34:24 -0700
Message-ID: <BAY106-F1F8468438D28D95E7FFD6D6B50@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Good day,

My question is regarding the iptables ipset match (-m set ...).  What I am =

seeing is that an empty ipset set of type iphash (I have not tried this wit=
h=20
any other ipset type) seems to yield a match on packets with an IP address =

of 0.0.0.0.  The packets of concern here are DHCP client requests, for whic=
h=20
a source IP of 0.0.0.0 is expected.

With any rule, like the LOG target example below, that uses an empty ipset =

to match against source address, I see a match but, since the ipset set is =

empty, this seems odd.

iptables -A INPUT -m set --set emptyset src -j LOG --log-prefix "What the!?"

Is this how the match is supposed to work?  Even though 0.0.0.0 may be=20
equivalent to "any", if the set is empty it seems like a match should _not_=
=20
occur.

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/


