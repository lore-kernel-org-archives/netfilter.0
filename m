From: justin <cmbb@dslr.net>
Subject: DOS/Crikey attacks, and ip_conntrack (retry)
Date: Mon, 20 Jan 2003 10:18:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <311608578750.20030120101825@dslr.net>
References: <61535048953.20030119135255@dslr.net>
Reply-To: justin <cmbb@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <61535048953.20030119135255@dslr.net>
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

Did nobody have ANY clue on this or what? I hate to re-send
but I think this is an important issue ... or should I be
sending this to the developers list instead?

---------------------------------------------------------

this
 http://www.qorbit.net/documents/maximizing-firewall-availability.htm

is a very interesting paper on the limitations of commercial
firewalls when their state tables are filled by DOS attacks.
It shows that even with a capability for two MILLION tracked
connections, a DOS attack using spoofed IPs, of 21mbit, will
fill this table up.. and the DOS succeeds.

The paper does not talk about netfilter/iptables, except to
point out that syncookies are a linux/bsd feature, that
mitigate SYN flood attack.

My question is this, ip_conntrack can be filled up fairly
easily with UNREPLIED entries. There seems to be some confusion
in the archives of this list as to whether behavior at the
limit is good or not:

1. With a hashsize of 16384, on a machine with 2gb of memory
or more, will the table fill up before
kernel memory is exhausted instead, and bad things happen?
is there any protection/tests built in that stop conntrack
filling kernel memory before it fills its set max table size?

2. When the ip_conntrack table is full, are old UNREPLIED
connections dropped to make room for new entries? (this,
the DOS attack will not succeed), or, are random UNREPLIED
entries removed, or, are packets just dropped?

3. Do kernel SYNcookies stop additional ip_conntract table
entries, when the kernel decides to start issuing them?

4. Using the patch for NOTRACK, that provides a path that
does not add an entry to the session table, does this mean
the only thing that will break is any ESTABLISHED tests
elsewhere in the rules? or does it break NAT completely
and thus can only be used for packets coming in for services
on the local box, not any hidden NAT'd services?

Ie: NOTRACK can be used for tcp/80 path only, correct?
-->port 80-->firewall+webserver---nat+portfwding--->other services

or is this also ok
--->port 27015 udp-->firewall---->nat+portfwding--->game servers
where the udp path is marked NOTRACK?


thanks, any answers would be very helpful.

-Justin


