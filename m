From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: Dropping RST of SYN
Date: Mon, 08 Sep 2003 04:53:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20030908044636.01188b18@fluent2.pyramid.net>
References: <3F5C539E.8030704@chrisbrenton.org>
 <1063000297.827.26.camel@india.nsecure.net>
 <3F5C539E.8030704@chrisbrenton.org>
 <20030908204206.C148.ATNAK@chejz.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030908204206.C148.ATNAK@chejz.com>
References: <3F5C539E.8030704@chrisbrenton.org>
 <1063000297.827.26.camel@india.nsecure.net>
 <3F5C539E.8030704@chrisbrenton.org>
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
Content-Transfer-Encoding: 7bit
To: Atsushi Nakagawa <atnak@chejz.com>, Chris Brenton <cbrenton@chrisbrenton.org>
Cc: "Dharmendra.T" <dharmu@nsecure.net>, Ralf Spenneberg <lists@spenneberg.org>, Netfilter <netfilter@lists.netfilter.org>

At 08:58 PM 9/8/2003 +1000, Atsushi Nakagawa wrote:
>Both Dharmendra and Chris have pointed out perfectly legitimate reasons
>why it is a bad idea to drop RSTs in general.  However, these warnings
>have taken the original proposition slightly out of context. --AFAIS
>
>Ralf's response was to a question regarding the removal of outgoing RST
>packets that are generated in reply to incoming SYN packets.  (These
>RSTs being the kind that causes the "Connection Refused" TCP message)
>
>Hence, "dropping all RST packets", should implicitly have meant, "all
>outgoing RST packets".  (The -m state ... -j DROP line is ambiguous.)

There is a corner case when communicating with certain older stacks that 
have, er, unusual takes on the RFCs regarding TCP connections.  The Bay 
Networks (now Nortel) modem concentrators want to see RSTs in response to 
an unusual probe done by the stack when closing a connection:  if I 
remember correctly those things will close the connection (using FIN) and 
then send out an empty ACK, expecting a RST back from the other end.  I 
suspect this was some programmer's bright idea to avoid having to implement 
all the "overhead" of implementing a true TIME_WAIT state for a closed 
connection.

I ran into this as the software developer for an analog modem testing 
package that tests V.90 and V.92 modems, and it caused no end of grief for 
me as the old 2.0.0 kernels didn't react the way that Bay Networks wanted 
them to.  This caused the particular modem module to go out of service for 
45 seconds, so there were several failed connection attempts as the 
multiplexor did the active timeout thing instead of just moving to a 
different 6-tuple for IP connections.

I don't know where else this "idea" might have taken hold.

Stephen Satchell
Satchell Evaluations
OTTO:3800 and LOTTO modem testing products



-- 
Human beings, who are almost unique in having the ability to learn from the 
experience of others, are also remarkable for their apparent disinclination 
to do so.  -- Douglas Adams  


