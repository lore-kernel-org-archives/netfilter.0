From: Arthur Ulfeldt <arthur@untangle.com>
Subject: using libnetfilter-conntrack to redirect tcp sessions
Date: Mon, 22 Oct 2007 13:04:25 -0700 (PDT)
Message-ID: <15390174.378371193083465887.JavaMail.root@zimbra.untangle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>, netfilter@netfilter.org


for our project (untangle.com) we NFQUEUE packets and then decide where they need to go.
Our current attempt is to then once we have decided on the destination for a packet to delete
the conntrack entry corresponding to this packet and then create a new one that will cause this to be
redirected. My attempts to recreate a redirect entry have thus far failed probably because I don't understand
the mechanism by which nat entries are created and the relation between NAT entries and conntrack entries.
perhaps somebody on this list can enlighten me?

are NAT entries and conntrack entries the same thing?

can I do nat by creating conntrack entries?

can I change the destination of a DNAT or SNAT entry by changing or replacing its conntrack entry?

can I change a SNAT entry into a DNAT entry by changing or replacing its conntrack entry?

PS: is this the correct list to ask such a question?

yours confusedly,
  Arthur Ulfeldt
  arthur@untangle.com
  

