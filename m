From: "J.T. Moore" <jtmoore@international-auto.com>
Subject: Blackholing probing addresses
Date: Fri, 29 Jul 2005 17:05:07 -0400
Message-ID: <00c701c59481$34966250$1500a8c0@domain.internationalauto.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Does anyone have recommendations on how to automatically blackhole =
addresses. I've gotten tired of looking through our iptables logs and =
seeing tons of probes against every ip on our network. I'd rather not =
reduce the log sensitivity because I like to see details about what's =
going on, but I'd love to be able to detect certain patterns and =
blackhole all traffic from the source ip for a given period of time.=20

For example, if a source tried to access tcp port 25 on two unused =
addresses within a minute, I'd like to be able to add the source ip to a =
target chain that silently drops all traffic from the address, but then =
remove the address from the chain after 30 minutes.=20

It looks like I should be able to do something at least pretty close to =
this with the QUEUE target. I also just ran across the ipset utility =
which also looks like it will be helpful. I'm interested to know if =
anyone else is doing something like this and if so, I'd be very =
interested to know what your experiences have been with it.=20

Thanks in advance,

J.T. Moore
International Auto Parts


