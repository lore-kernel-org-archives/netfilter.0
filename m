From: "dave beach" <drbeach@rogers.com>
Subject: RE: Logging question
Date: Wed, 9 Feb 2005 12:02:39 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA/2juzkSA1EqqQG7cqX3fCwEAAAAA@rogers.com>
References: <15388.142.169.215.10.1107968902.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <15388.142.169.215.10.1107968902.squirrel@142.169.215.10>
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
To: 'Samuel Jean' <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

That actually occurred to me - but it raised the question, and I apologize
if it's a silly one, of why the SNATted packets would jump out of the chain.
It didn't strike me as the same sort of a situation as a target match, where
rule position can be critical.

Of course, any minute now I'll actually TRY a few things and stop writing
messages about questions. 

-----Original Message-----
From: Samuel Jean [mailto:sj-netfilter@cookinglinux.org] 
Sent: February 9, 2005 12:08 PM
To: dave beach
Cc: netfilter@lists.netfilter.org
Subject: RE: Logging question

On Wed, February 9, 2005 11:32 am, dave beach said:
> Here are the actual rules in the nat/POSTROUTING chain from my 
> rc.firewall script ($EXT_INT is eth0, $INT_INT is eth1, $EXT_IP is the 
> ip address bound to eth0):
>
> #
> ###############################
> # STEP 5.11 - nat/POSTROUTING #
> ###############################
> #
> #   SNAT all packets to the firewall's external interface addr
> #
>       $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j SNAT --to-source 
> $EXT_IP #
> #   Log the outbound data
> #
>        $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j ULOG 
> --ulog-nlgroup
> 4
> --ulog-prefix "RAW OUT: " --ulog-qthreshold 1
>        $IPTABLES -t nat -A POSTROUTING -o $INT_INT -j ULOG 
> --ulog-nlgroup
> 5
> --ulog-prefix "RAW OUT: " --ulog-qthreshold 1 #
>

As a side note, it becomes obvious now why you don't get any log for eth0:

The packet going out on eth0 get SNAT'ed and suddently stop iterating
through that chain, its next step : the wire road.

The reason on why you got all the log for eth1 is that such outgoing packets
_don't_ match the requierement for being SNAT'ed. They, obviously, continue
iterating: they don't match the eth0 logging rule, but they next match the
eth1 rule.

All of this would work if eth0 logging rule was on top. Also, eth1 logging
rule position doesn't matter in this case.

Sorry if you already got it.

Have a nice day,

Samuel


