From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: Check my firewall please?
Date: Fri, 21 Apr 2006 10:24:40 +0100
Message-ID: <79328ea80604210224ja7c5bffl1c56a97ae13374c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Sorry if you get so many of these posts, but I'd be grateful if you
could check my firewall/NAT rules on my box which now acts as an ADSL
router:

#!/bin/bash

MYADDR=3D89.145.208.16

function pppnat()
{
        # Source NAT on ppp0 - change source address of packets sent
        # out to the address on interface ppp0

        # The following iptables command should only be used to change
        # the source IP for dynamically allocated IP addresses, as it
        # forgets existing connections if the link goes down.
        # iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE || klear

        iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to ${MYADDR}

        # Port-forward 22 onto big (so ssh works).
        iptables -t nat -A PREROUTING -p tcp --dport 22 -i ppp0 \
                                      -j DNAT --to 10.0.0.1

        # Port-forward 12003 onto suhaib (so azureus works properly).
        iptables -t nat -A PREROUTING -p tcp --dport 12003 -i ppp0 \
                                      -j DNAT --to 10.0.0.3
}

function pppfilter()
{

        iptables -N pppfilter || klear

        # Accept connections that do not originate from ppp0
        iptables -A pppfilter -m state --state NEW -i ! ppp0 -j ACCEPT || k=
lear

        # Accept packets from ppp0 for connections that already exist
        iptables -A pppfilter -m state --state ESTABLISHED,RELATED \
                              -j ACCEPT || klear

        # Log NEW ssh connect attempts from ppp0
        iptables -A pppfilter -p tcp --dport 22 \
                              -m state --state NEW \
                              -i ppp0 \
                              -j LOG --log-prefix=3D"[ssh] " || klear

        # Accept ssh packets from ppp0
        # TODO: only accept ssh packets from work IP
        iptables -A pppfilter -p tcp --dport 22 -j ACCEPT || klear

        # Log all new connection attempts
        # Not needed really, is it?...
        # iptables -A pppfilter -m state --state NEW \
        #                       -m limit --limit 10/minute -i ppp0 \
        #                       -j LOG --log-prefix=3D"[block addr] " || kl=
ear

        # Reject everything not already accepted
        iptables -A pppfilter -j REJECT || klear


        # Jump to that chain from INPUT and FORWARD chains.
        iptables -A INPUT -j pppfilter || klear
        iptables -A FORWARD -j pppfilter || klear
}

pppnat
pppfilter

