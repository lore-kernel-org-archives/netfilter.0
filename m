From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[4]: REJECT target
Date: Fri, 11 Apr 2003 02:01:29 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <142627702738.20030411020129@lf.lv>
References: <43614623471.20030410222329@lf.lv>
 <008701c2ff97$9d98b310$3201a8c0@ESTACAO> <119615248079.20030410223354@lf.lv>
 <003d01c2ffb2$42c91090$3201a8c0@ESTACAO>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003d01c2ffb2$42c91090$3201a8c0@ESTACAO>
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
To: =?ISO-8859-1?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaONlcw==?= <leolistas@solucoesip.net>
Cc: netfilter@lists.netfilter.org

Friday, April 11, 2003, 1:41:00 AM, you wrote:


LRM>     Well, what i've read and studied is that mangle and nat table should NOT
LRM> be used for filtering stuff. If you wanna really REJECT something based in a
LRM> mangle MARK, you can safelly do that in the INPUT/OUTPUT/FORWARD tables.

yes, i have read the same. but i still havent found out why cant i use
nat and mangle tables for filtering.

LRM>     Seems that you cannot reject and send something in the mangle and nat
LRM> tables. You can only DROP a packet, that means, dissapear with it. No
LRM> notification of any kind can be sent from nat or mangle.

Why is it so?

LRM>     You told you need something that was MARKed in MANGLE to be rejected.
LRM> What exactly are we talking ? Is this a routed packet that will reach
LRM> another machine ? If yes, is it leaving or is it arriving in your network ?
LRM> If no ( packet is for the machine ), is it arriving or leaving the machine ?
LRM> Can you send me some iptables rules so I can help you ?

I queue some packets which arrive into my machine to userspace, the
userspace tool looks at the MARK value of a packet and does something
accoring to it.

(is there another way to mark (make a distinguishable mark) a packet
as soon as it enters the machine? I could change TOS as it enters
and make it 0 as it leaves machine, but this is uneffective method)

The packets can be either arriving for that machine or for a network
and also packets only arrive to the machine (machine does not send any
itself).

here are some rules i just made (similat to those i use, but
simplified and commented):

--
alias i='iptables'
i -A PREROUTING -t mangle ..something.. -j MARK --set-mark 1 -i eth0
..
.. N more rules all with -j MARK
..
i -A PREROUTING -m <my custom match which matches only marked packets>
-m limit --limit 3/minute --limit-burst 2 -j QUEUE

# my userspace tool examines NF_MARK and NF_ACCEPTs the packet so it
# continues traversing the PREROUTING chain.

now here i want to REJECT the packet with tcp-reset if it's -p tcp or
icmp-port-unreachable if it's -p udp but not simply DROP it.
--

as i mentioned the only way i found out to REJECT them is add a 2 rules
in INPUT -t filter and FORWARD -t filter (which would match if packet
is marked with my match), but this is inconvenient
because of 2 reasons - packet still has to travel from mangle to nat
then to filter and only then it gets dropped (adds latency) and i have
to duplicate the rules as i dont know if the packet will be destinated
for my machine or for network behind the machine.


P.Krumins


