From: "dave beach" <drbeach@rogers.com>
Subject: RE: Logging question
Date: Wed, 9 Feb 2005 11:32:04 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAWHMJM5wRT0u+QcOQ5qBuJQEAAAAA@rogers.com>
References: <7643.142.169.215.10.1107965476.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7643.142.169.215.10.1107965476.squirrel@142.169.215.10>
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

Here are the actual rules in the nat/POSTROUTING chain from my rc.firewall
script ($EXT_INT is eth0, $INT_INT is eth1, $EXT_IP is the ip address bound
to eth0):

#
###############################
# STEP 5.11 - nat/POSTROUTING #
###############################
#
#   SNAT all packets to the firewall's external interface addr
#
      $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j SNAT --to-source
$EXT_IP
#
#   Log the outbound data
#
       $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j ULOG --ulog-nlgroup 4
--ulog-prefix "RAW OUT: " --ulog-qthreshold 1
       $IPTABLES -t nat -A POSTROUTING -o $INT_INT -j ULOG --ulog-nlgroup 5
--ulog-prefix "RAW OUT: " --ulog-qthreshold 1
#

My expectation when I wrote these rules was that they'd provide me with
complete logs for all packets outbound on eth0 and eth1, right before they
went out on the wire. In reality, they are generating no logs whatsoever for
eth0 and what I thought were complete logs for eth1. I'm no longer sure
about the latter.

As you've suggested, I'll try moving the logging rules to the
mangle/POSTROUTING chain and see what happens. It's not where my tidy mind
would prefer to have the rules, but that obviously gets trumped by needing
to have them where they work.

-----Original Message-----
From: Samuel Jean [mailto:sj-netfilter@cookinglinux.org] 
Sent: February 9, 2005 11:11 AM
To: dave beach
Cc: netfilter@lists.netfilter.org
Subject: RE: Logging question

On Wed, February 9, 2005 10:35 am, dave beach said:
> Thanks, Samuel.
>
> So, if I understand correctly, the reason that nothing at all is being 
> logged out eth0 (via the rule in the nat/POSTROUTING chain) is because 
> all those packets are related to packets previously seen by the state 
> machine and thus don't traverse that chain.

Unless you tell my that you put the logging rule _after_ the DNAT rule.
I assume the above is right, but a bit unbeleivable. If that's really what
happen (entries already exist), you can verify if my assumption/explanation
is right by unloading the ip_conntrack module (and everything depending on).
And test again with fresh conntrack.

>
> Okay, but that leaves me with the question about why I'd see so many 
> packets logged out eth1 via a similar rule in the same place. The 
> above explanation seems to tell me that each and every packet so 
> logged would be the "first", and thus new.

Perhaps you've put your eth1 logging after eth1 DNAT and you see log for the
eth0 NAT. Is that possible case ?

>
> I guess the way to test this would be to move BOTH rules to 
> mangle/POSTROUTING. I'd expect, based on the above, to see the packets 
> logged out eth1 to jump dramatically. Does this sound generally correct?

Both logging rules at top of this chain should tell you the truth.

Cheers,
Samuel



