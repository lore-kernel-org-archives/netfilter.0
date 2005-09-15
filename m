From: Jan Eidtmann <cmak_@arcor.de>
Subject: Re: big table tweaks ?
Date: Thu, 15 Sep 2005 20:41:41 +0200
Message-ID: <20050915204141.2329eff9.cmak_@arcor.de>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2B98@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7742E2B98@farmer.vikus.com>
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

thanks for all your interest and replies! :)

well, i found a solution for my problem this morning. actually,
my setup was kind of stupid ( i was tired):

Chain INPUT (policy DROP)
target     prot opt source               destination
<...> # allow local stuff
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:!0x16/0x02 state NEW
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
antip2p    all  --  0.0.0.0/0            0.0.0.0/0
<...> # allow services

NOTE: table "antip2p" drops all those networks i don't like or trust.
      see http://www.bluetack.co.uk/config/antip2p.txt

so almost every new incoming packet had to go through antip2p.

solution: only sent those packets to antip2p that actually hit a
service-port:

Chain INPUT (policy DROP)
target     prot opt source               destination
<...> # allow local stuff
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp flags:!0x16/0x02 state NEW
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
antip2p    tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:21
antip2p    tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22
antip2p    tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
<...> # allow services but walk through antip2p for each service (like above)

# iptables-show antip2p | tail -n2
87228     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           source IP range 222.158.0.0-222.159.255.255
87229  6194  307K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

this works smoother of course (as there are a lot less packets
going through antip2p).
not a perfect solution for busy hosts, but it works for me.

cheers,
jan

