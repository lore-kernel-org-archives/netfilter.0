From: "cc" <cc@kdtc.net>
Subject: SNAT
Date: Wed, 22 Feb 2012 10:04:32 +0800
Message-ID: <20120222014817.M7308@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Long story short, I'm now rebuilding a netfilter firewall 
script as the original died with the firewall.  Well, died
in the sense that it got corrupted.

Instead of needing to specify the following for each required
port that needs to be used to connect to external sites,
how do I just let any traffic originating from the LAN
to connect?  (I'm feeling this isn't the right way of doing
things.  I appreciate any corrections.)

$IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
           --dport 1025: -j SNAT --to-source $EXTIP

But the above rule 'looks' like it should work; but it
doesn't.  tcpdumping the traffic, it seems the traffic is
going one way and not the other.

So if I want to set the firewall to allow the following
situations: machine A in $LAN_NET  wants to RDP to an external
site,  it can.  If machine B wants to surf the net, it also
can.  I don't need to separately do the following:

  $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
           --dport 3389 -j ACCEPT
  $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
           --dport 80 -j ACCEPT
  $IPT -A FORWARD -i $LANETH -o $EXTETH -p tcp -s $LAN_NET \
           --dport 443 -j ACCEPT

  $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
          --dport 3389 -j SNAT --to-source $EXTIP
  $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
          --dport 80 -j SNAT --to-source $EXTIP
  $IPT -t nat -A POSTROUTING -o $EXTETH -p tcp -s $LAN_NET \
          --dport 443 -j SNAT --to-source $EXTIP



Now if I remembered, I used MASQUERADE when I was using 
a dynamic IP.  Now with a fixed IP, I shouldn't be using
MASQUERADE (seems less of a headache) as the manual says 
it's more appropriate to use SNAT for fixed IP.

Any help/clarifications/hints appreciated.

Ed
