From: Kim Jensen <kimj@dawn.dk>
Subject: Re: using iptables for "route mapping"
Date: Mon, 24 Mar 2003 21:53:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303242153.17159.kimj@dawn.dk>
References: <200303241349.41852.marks@crvinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303241349.41852.marks@crvinc.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Mark Seamans <marks@crvinc.com>, netfilter@lists.netfilter.org

Hi Mark,

Using the following lines it is possible to copy the default routing tabl=
e=20
into a second. With the fwmark rule you can trigger the routing table fro=
m=20
iptables.

$ ip route flush table 4 > /dev/null 2>&1
$ ip route show table main | grep -Ev '^default' \
| while read ROUTE ; do
    ip route add table 4 $ROUTE
done
$ ip rule add fwmark 4 table 4
$ ip route add default via xxx.xxx.xxx.xxx table 4

Iptables part
$ iptables -t mangle -A PREROUTING -s aaa.bbb.ccc.ddd -j MARK --set-mark =
4

If your source is matching the rule, it will be send via the alternative=20
route, otherwise it will go via your normal route. Feel free to add more=20
hosts.

In case you wish to use loadsharing, then you have to use a different=20
approach. Read more about this at:
http://linux-ip.net/html/adv-multi-internet.html
http://www.ssi.bg/~ja/nano.txt

My problem here is that I still haven't heard about a solution where you =
have=20
a mixture of MASQUERAD'ing and NAT'ing.

At least I hope this will help you.

Regards
Kim


On Monday 24 March 2003 20:49, Mark Seamans wrote:
> Has anyone used iptables (realm support) to act like Cisco's route mapp=
ing?
> IE:  Using it as a core ISP router with multiple uplinks.  Route source=
 ip
> A to gateway X, while routing source ip B to gateway Y.
>
> I have played around with iproute2's tables and rules with no success.
>
> Mark


