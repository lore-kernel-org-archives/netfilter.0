From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Qustion wrt state RELATED,ESTABLISHED
Date: Wed, 7 Jul 2004 07:11:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040707051150.381201787@sterenborg.info>
References: <opsaq0vou24evsfm@smtp.pacific.net.th>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <opsaq0vou24evsfm@smtp.pacific.net.th>
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
To: netfilter@lists.netfilter.org

> Is my  assumtion correct that state RELATED,ESTABLISHED 
> checks all flags
> for match and thus this state can (and should be for 
> performance reasons)
> be the first in each table ?

No, it checks the *state*.

The first packet that is seen in a connection has state NEW, the rest
have state ESTABLISHED or RELATED (as with e.g. ftp). Since these
packets are let's say 99% in a connection, the ESTABLISHED and RELATED
match will match the most packets. Also see the byte/packet counters for
this (first 2 columns in the list below).
That's why you probably want that rule somewhere on top for performance
reasons because the rules are traversed in the order they are entered,
and therefore matched in the order they are entered.

> Chain INPUT (policy DROP 0 packets, 0 bytes)
>   pkts bytes       target     prot opt in     out     source  
>              destination

> 15172 2029K ACCEPT     all  --  any    any     anywhere       
>       anywhere           state RELATED,ESTABLISHED

Rule 1 (state checking)

>   0       0             BADTCP     tcp  --  any    any     
> anywhere             anywhere           tcp 
> flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG

Rule 2 (flag checking)

So you have 2 separate rules ; 1 for state and 1 for flag checking.


Gr,
Rob


