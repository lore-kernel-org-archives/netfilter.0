From: Marc SCHAEFER <schaefer@alphanet.ch>
Subject: Complex multi-homed/NAT setup
Date: Thu, 23 May 2002 12:51:08 +0200 (MEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.3.96.1020523114750.1680A-100000@defian.alphanet.ch>
Reply-To: Marc SCHAEFER <schaefer@alphanet.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,

I have the following setup:

    external_net_1     \
                         firewall  ---- internal_net
    external_net_2     /

the machine on the internal_net only has one IP address (in this case
193.72.186.6, could be e.g. 192.168.x.x), but must be reachable from the
outside as: 62.2.159.14 and 194.38.85.209.

The firewall has addresses 62.2.159.15, 194.38.85.206 and 193.72.186.15
(again, this one could have been 192.168.x.x).

[ http://www-internal.alphanet.ch/~schaefer/nf_firewall/firewall.eps
  for the graphical version
]

The machine on the internal_net cannot do any special tricks. She must
receive all packets to 193.72.186.6 (the from can be an external address).
Now, the firewall must remember what was the incoming address (62.2.159.14
or 194.38.85.209) and re-NAT it accordingly when it goes out, and send it
on the correct outgoing interface.

So far I have problems to make the SECOND thing work (ie it works for
62.2.159.14, but not for the other: the address is correctly NATed
according to tcpdump -i external_net_2 -n, but does not ever reach the
inside).

You can look at the scripts and graphics at:

  http://www-internal.alphanet.ch/~schaefer/nf_firewall/

if you have any idea or hint please do :)

I will try to debug this more, but I wanted to know if what I wanted is at
all possible.

thanks for any idea.


