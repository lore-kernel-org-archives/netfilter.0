From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Thu, 09 Apr 2009 16:29:50 +0300
Message-ID: <49DDF84E.2010302@caf.com.tr>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de> <49DAD5E0.9020303@caf.com.tr> <49DDB24A.80400@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DDB24A.80400@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 09.04.2009 11:31, Mart Frauenlob wrote:
> what about the 'policy' in the 'nat' table? Will it allow 'DROP'?

# /sbin/iptables -V
iptables v1.4.3.1
# /sbin/iptables -t nat -P OUTPUT DROP
iptables v1.4.3.1:
The "nat" table is not intended for filtering, the use of DROP is
therefore inhibited.


Try `iptables -h' or 'iptables --help' for more information.
# echo $?
2
# /sbin/iptables -t nat -L|grep OUTPUT
Chain OUTPUT (policy ACCEPT)

> what about the other non 'filter' tables?
> Will it be possible to 'DROP' in the mangle table? Or set it's policy to
> 'DROP'?

Yes

> Isn't dropping in the mangle table almost the same thing as doing that
> in the nat table?

No.  Not all packets in a connection traverse the nat table.

> At least it violates the concept of filtering in the filter table.

Yes.  Correct place to filter in in the filter table.  But if you insist
on doing the "wrong" thing, who is to interfere?

[...]
> I've seen quite some people (mostly unexperienced) mess up their box
> with that, most of them ending up asking for public help.
> It seems misleading to me, to make that options available.

Well, software does not grow on trees.  Someone has to write it but is
it really worth the effort to ban filtering in mangle et al?  Filtering
in the nat table was especially wrong because it didnot give the
expected result and I suppose that is reason for the patch/revized
behaviour.

-- 
Eray
