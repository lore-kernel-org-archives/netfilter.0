From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: mangle tables.
Date: Wed, 11 Sep 2002 00:18:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7E6FA7.5030903@fugmann.dhs.org>
References: <FLEKIPPLAEDMJMOOBBDPOEDGCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: stewart.thompson@shaw.ca
Cc: Antony Stone <antony@soft-solutions.co.uk>, netfilter@lists.samba.org

Stewart Thompson wrote:
> would show the order it went through the tables. Alternately, you
> could look at the source code, or talk to someone who is familiar
Ok. I finally took a look at the code. (Quite easy to read actually)

There are 5 builtin chains:
prerouting, input, forward, output and postrouting.
and four tables: conn_track, mangle, nat and filter.

These are traversed in the following order:
(read left to right)
prerouting: 
conntrack, mangle, nat
input: 
	mangle, filter, nat, conntrack
forward: 	mangle, filter
output: 
	conntrack, mangle, nat, filter
postrouting: 
mangle, nat, conntrack

Of course, forwarded packets traverse: prerouting,forward,postrouting.
locally generated packets traverse: output,postrouting
packets for the machine itself: prerouting, input.

If you want to doublecheck, then look at lines:
041-060: netfilter_ipv4.h
223-233: ip_conntrack_standalone.c
205-217: ip_nat_standalone.c
170-181: iptable_mangle.c
117-122: iptable_filter.c

All taken from kernel 2.4.19

The sequence is defined through constants, and I do not think that these
has not changed from 2.4.18. I have not looked at other versions.


Regards
Anders Fugmann


