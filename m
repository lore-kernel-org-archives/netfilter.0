From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: can i have boolean OR between multiple addresses in
Date: Tue, 13 Jun 2006 11:03:53 -0700
Message-ID: <BAY106-F2158D145223C4B78D0DEA3D68C0@phx.gbl>
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

Howdy,

If a single rule is really the way you want to go, maybe you can take=20
advantage of an iphash ipset?

Doing so would require the additional steps of creating the set and=20
populating it but, once that is accomplished you could use a single rule=20
which, asssuming the name of the set you create is 'limithosts',  would loo=
k=20
simething like:

iptables -A INPUT -m set --set limithosts src -m limit -j ACCEPT

The ipset site at http://people.netfilter.org/kadlec/ipset/ provides an=20
excellent explanation of what ipset is and how to use it.

Just a thought...

- Andrew Kraslavsky

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/


