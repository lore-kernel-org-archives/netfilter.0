From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: RE: Logging question
Date: Wed, 9 Feb 2005 12:08:22 -0500 (EST)
Message-ID: <15388.142.169.215.10.1107968902.squirrel@142.169.215.10>
References: <7643.142.169.215.10.1107965476.squirrel@142.169.215.10>
	<!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAWHMJM5wRT0u+QcOQ5qBuJQEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4ww
	L6DwAQAAAAWHMJM5wRT0u+QcOQ5qBuJQEAAAAA@rogers.com>
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
To: dave beach <drbeach@rogers.com>
Cc: netfilter@lists.netfilter.org

On Wed, February 9, 2005 11:32 am, dave beach said:
> Here are the actual rules in the nat/POSTROUTING chain from my rc.firew=
all
> script ($EXT_INT is eth0, $INT_INT is eth1, $EXT_IP is the ip address
> bound
> to eth0):
>
> #
> ###############################
> # STEP 5.11 - nat/POSTROUTING #
> ###############################
> #
> #   SNAT all packets to the firewall's external interface addr
> #
>       $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j SNAT --to-source
> $EXT_IP
> #
> #   Log the outbound data
> #
>        $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j ULOG --ulog-nlgro=
up
> 4
> --ulog-prefix "RAW OUT: " --ulog-qthreshold 1
>        $IPTABLES -t nat -A POSTROUTING -o $INT_INT -j ULOG --ulog-nlgro=
up
> 5
> --ulog-prefix "RAW OUT: " --ulog-qthreshold 1
> #
>

As a side note, it becomes obvious now why you don't get any log for eth0=
:

The packet going out on eth0 get SNAT'ed and suddently stop iterating
through that chain, its next step : the wire road.

The reason on why you got all the log for eth1 is that such outgoing pack=
ets
_don't_ match the requierement for being SNAT'ed. They, obviously, contin=
ue
iterating: they don't match the eth0 logging rule, but they next match
the eth1 rule.

All of this would work if eth0 logging rule was on top. Also, eth1 loggin=
g
rule position doesn't matter in this case.

Sorry if you already got it.

Have a nice day,

Samuel


