From: Erik Weber <bassman0@gmail.com>
Subject: patch-o-matic'd TTL, but it's not there
Date: Sat, 2 Jul 2005 13:24:08 -0700
Message-ID: <ffcea5260507021324388edaa8@mail.gmail.com>
Reply-To: Erik Weber <bassman0@gmail.com>
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

Dear Netfilter List,

I used patch-o-matic-ng apparently successfully to add the 'TTL' patch
(compiled & installed new kernel, modules, and iptables) and yet when
I give the command:

iptables -t mangle -A PREROUTING -i eth1 -j TTL --ttl-set 64

I receive the response:

iptables: No chain/target/match by that name

There are no additional instructions to follow on the Patch-o-matic
HOWTO, so I wonder what could be missing?  I have verified that the
apparently patched kernel is the one I am running and patch-o-matic
does not complain.

  -Erik Weber
  Geek

