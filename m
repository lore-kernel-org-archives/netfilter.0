From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: State NEW and --syn flag
Date: Tue, 20 Jul 2004 10:38:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407201038.42003.Antony@Soft-Solutions.co.uk>
References: <TBEXEDU01kJSFsxf4yp000000d3@smtp.maurickcollege.nl>
Reply-To: "'iptables'" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <TBEXEDU01kJSFsxf4yp000000d3@smtp.maurickcollege.nl>
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
To: 'iptables' <netfilter@lists.netfilter.org>

On Tuesday 20 July 2004 10:15 am, Rob Sterenborg wrote:

> Hi all,
>
> When writing a rule, if one doesn't specify a state, state NEW is assumed,
> right ?

No, all states are assumed - that means the rule would match NEW, ESTABLISHED, 
INVALID (but not RELATED).

If you don't specify the state, then the packet will match if whatever you do 
specify (eg IP address, destination port, etc) agrees.

eg: iptables -A FORWARD -s 192.168.192.168 -j ACCEPT
will match all packets from 192.168.192.168, no matter what protocol, what 
destination address, what state, which interface they came in on, etc....

> If the first packet of a connection arrives, it has state NEW and
> subsequent packets are ESTABLISHED or RELATED. The first packet also has
> the --syn flag set so new packets could also be identified by --syn.

Correct, so long as you're talking about normal packets, part of valid 
connections.

> If checking for state NEW, is there any reason to also check if the
> --syn flag is set or is it enough to just rely on state NEW ?

Depends on your degree of security paranoia :)

A (correct) NEW packet will have the SYN flag set, however a packet which does 
not have the SYN flag set (or perhaps has the ACK flag set, even though it's 
the first packet we've seen from that source), will still be regarded as NEW 
by netfilter (because it's not part of an established connection).

If you let through NEW packets which do not have SYN (only) set, then the 
result depends on the O/S on the machine they get forwarded to.   I suggest 
http://www.insecure.org as a source of data on what different systems do with 
different strange flag combinations in packets they receive.

One thing is almost certain - letting through NEW packets which don't have SYN 
set is very unlikely to result in an ESTABLISHED connection being created.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


