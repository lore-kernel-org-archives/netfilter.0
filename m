From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re[2]: Counting traffic - another question
Date: Tue, 27 Jul 2004 15:26:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407271526.15564.Antony@Soft-Solutions.co.uk>
References: <1304297675.20040727143400@op.pl> <200407271359.13020.Antony@Soft-Solutions.co.uk> <1368880926.20040727155717@op.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1368880926.20040727155717@op.pl>
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

On Tuesday 27 July 2004 2:57 pm, Marcin Sura wrote:

> Tuesday, July 27, 2004, 2:59:13 PM, you wrote:
> > No need to MARK the packets (unless you want the MARKs for something
> > else?),
>
> Yes, I need MARKs for traffic shaping. Sorry, I forgot to mention this.

Okay, no problem, continue MARKing them then, but I still think you can count 
them in FORWARD mangle.

> > and you can specify input & output interface in the FORWARD table to
> > identify which way through your firewall the packets are going.
>
> Ok, so I change the rules (i still use statsin and statsout for ...
> hmm ... order :)
>
>  $IPTABLES -t mangle -A FORWARD -i $LOCAL_IF -o $INET_IF  -j statsout
>  $IPTABLES -t mangle -A FORWARD -i $INET_IF -o $LOCAL_IF -j statsin

No, don't put the "-j statsout" or "-j statsin" at the end.   The rule I 
suggested previously is actually complete:

iptables -A FORWARD -t mangle -i eth0 -o ppp0 -p tcp --dport ssh

You do not need to have a "-j target" at the end of a rule if you don't want 
one.   The above rule will still count the packets, and you can see the 
packet/byte counters with "iptables -L FORWARD -t mangle -nvx".

Regards,

Antony.

-- 
"It would appear we have reached the limits of what it is possible to achieve 
with computer technology, although one should be careful with such 
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the list;
                                                           please don't CC me.


