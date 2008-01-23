From: vcarela <vcarela@ac.upc.edu>
Subject: Could iptables read a trace file?
Date: Wed, 23 Jan 2008 13:14:36 +0100
Message-ID: <1201090477.8584.15.camel@vcarela-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

I would like to know if iptables can read from a trace file.

The only way I know is to use a dummy interface and then do a tcpreplay
to the dummy interface, but I do not know why the iptables do not run i=
n
this interface, perhaps it drops all the pkts before them arrive to the
iptables level, I say iptables level because I can see the pkts with
tcpdump, that works in lower level, in the dummy interface. Also I trie=
d
to modify with tcpwrite the source and destination MACs of the trace
file with the dummy's MAC but did not work.

Any hints?

Valent=C3=ADn

