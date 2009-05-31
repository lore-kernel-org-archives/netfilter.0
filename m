From: Marek Kierdelewicz <marek@piasta.pl>
Subject: SNAT and obsolete SAME
Date: Sun, 31 May 2009 20:02:49 +0200
Message-ID: <20090531200249.27173129@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

SAME target has been marked obsolete and removed from netfilter some
time ago. Searching mailing list archives I have found some claims that
SNAT with address range specified behaves like SAME. Can anyone confirm
following rule working the way I think it should (to be compatible with
SAME behaviour)?

rule:
iptables -t nat -j SNAT --to 80.80.80.0-80.80.80.10 -s 192.168.0.0/24

1) Let's assume 192.168.0.10 connects to news.google.com. Outgoing
connection is SNATted to 80.80.80.1.
2) While previous connection is in ESTABLISHED state, 192.168.0.10
connects to yahoo.com. Connection is SNATted to 80.80.80.1.
3) Sleep 1000, after that host 192.168.0.10 has no connections in
ESTABLISHED state.
4) Host 192.168.0.10 one again connects to news.google.com. Outgoing
connection may be SNATted to address other then 80.80.80.1.

Should current implementation of SNAT target work according to above
scenario?

Cheers,
Marek Kierdelewicz
