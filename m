From: Peteris Krumins <newsgroups@lf.lv>
Subject: Interesting problems
Date: Mon, 4 Aug 2003 23:41:07 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3276876863.20030804234107@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hello,

 I am experiencing some trouble w/ linux-2.4.22-pre10-ac1 and
 iptables 1.2.8 w/ patch-o-matic-20030802.


 The problem is like this:

  - there is a computer PII 266, now with 192mb ram, it's running
    custom linux distribution with 1 user process - getty, as I log
    in, a bash is spawned.

    Only ESTABLISHED,RELATED outbound connections are allowed, NEW and
    INVALID inbound are REJECTed.

    All the traffic is routed via this computer - 8Mbit link
    constant, - lots of users more than 300 - everyone does something
    different.

    I set up max. 20000 conntrack entries unfortunately
    after a day there already are already 15000 connection tracking entires
    and the load of the computer each 5 minutes jumps up to 2 then goes
    down to 0.3 and jumps to 2 again etc., 15 minute avg load keeps at
    0.7. But unfortunately entries are growing and growing, more ram
    is used, computer load grows and suddenly any traffic routed via
    this computer is killed, nothing flows through.
    Kernel shouts that conntrack table is full but a
    `wc -l /proc/net/ip_conntrack' shows around 20000 entries.
    A reboot helps.
     
    If i increase it even more (50000), the load gets so high that
    establishing a new connection takes more than a second and then
    the box dies anyway with the same error that conntrack table is
    full.

    The question is what could i do to avoid the growthy of connection
    tracking entries? I guess the entries taking up space are already
    established tcp connections which were not properly terminated, so
    they are there to timeout.

    I noticed exactly the same on 2.4.22-pre6 and pom20030714
    
    An ascii for network setup is:
                         ____
           .---.   .---./    \
INTERNET---| 1 |---| 2 |-------corporate network
           `---'   `---'\____/

1 - my box
 (ESTAB., RELATED allowed to internet everything else denied)
2 - traffic accounting/shaping and main router
 (much much faster box than box 1)


P.Krumins


