From: Mike Mestnik <cheako@mikemestnik.net>
Subject: Statefull tcp failovers.
Date: Sun, 8 Mar 2015 16:34:48 -0500
Message-ID: <CAF8px57o8K8hgqzTdv3JhSwRM9_Y6uAPVBc1pR+hi_qDhF1ggw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm actually just looking for somebody to do the work for me or to put
enough building blocks in front of me so I can assemble them.  With
enough iptables foo I wrote this letter, because it should be simple.

The goal is to catch the, someone just kill9ed one of n web-servers
behind a DNAT or reverse web proxy on a REDIRECT.  I've looked at port
knock examples and I think that'd be the basis, plus some statistic so
it's a bit fuzzy on the logic.  The knocks I think would be like so,
this should look something like a state filter, so perhaps conntrack
can help with some of the heavy lifting.

Client is receiving disconnections, if the client wishes to disconnect
I doubt we'll have much of a chance.
1. Not connected.
2. SYN, cache it till we get to 4n.
3. not SYN ACK, like RST
4y. *Knock over to another node, chance to get this one again or the
last one we were just at.  Decrease probability for anyone getting
this DNAT|REDIRECT.
4n. Continue.
5. RST, could just be goodby.  Knock for a bit to see if followed by SYN.
6. SYN make sure to redirect elsewhere, no point in going back to
where we were just kicked out.  Slight decrease in probability for
anyone getting this DNAT|REDIRECT.
7. See 3.

* I'd really like this to be magical, if possible.  Don't relay the
packet back, ignore/drop it. Re-use the previous SYN.

The next server to client packet after SYM=0,ACK=1 should be scored as
well, increasing the probability for anyone getting this port.

iptables -N APACHE_IS; # 1 -p tcp/-[sd]port -j APACHE_IS?
iptables -N APACHE_IS_IN; # 2+
iptables -N APACHE_IS_IN_SYN; # 2
iptables -N APACHE_IS_OUT; # 3+
iptables -N APACHE_IS_OUT_SYNACK; # 4n
iptables -N APACHE_IS_OUT_RST; # 4y
iptables -N APACHE_IS_OUT_ACK; # 5
iptables -N APACHE_IS_IN_SYNTWO; # 6

iptables -A APACHE_IS -m conntrack --ctdir ORIGINAL -j APACHE_IS_IN
iptables -A APACHE_IS -m conntrack --ctdir REPLY -j APACHE_IS_OUT

iptables -A APACHE_IS_OUT ??? -m recent --name SAD_APACHE --set; #
Mark for this Apache instants to every one else.
iptables -A APACHE_IS_OUT_RST ??? -m recent --name CRY_APACHE --set; #
Along with this my phone/pager cries as well.
iptables -A APACHE_IS_OUT_ACK ??? -m recent --name HOME_APACHE --set;
# Could be useful?
iptables -A APACHE_IS_IN_SYNTWO ??? -m recent --rdest --name
YELL_APACHE --set; # Too much, where is my tomahawk?

iptables -A APACHE_IS_OUT ??? -m recent --rdest --name APACHE_A_MAD
--set; # This user can still recover unbeknownst.
iptables -A APACHE_IS_OUT_RST ??? -m recent --rdest --name
APACHE_A_BAD --set; # This user SYN retry, squelch the RST?
iptables -A APACHE_IS_OUT_ACK ??? -m recent --rdest --name
APACHE_A_BYE --set; # This user could be done or come back.
iptables -A APACHE_IS_IN_SYNTWO ??? -m recent --name APACHE_A_HOT
--set; # This user is promiscuous.
iptables -A APACHE_IS_OUT ??? -m recent --rdest --name APACHE_B_MAD --set
iptables -A APACHE_IS_OUT_RST ??? -m recent --rdest --name APACHE_B_BAD --set
iptables -A APACHE_IS_OUT_ACK ??? -m recent --rdest --name
APACHE_A_BYE --set; # This user could be done or come back.
iptables -A APACHE_IS_IN_SYNTWO ??? -m recent --name APACHE_A_HOT
--set; # This user is promiscuous.
iptables -A APACHE_IS_OUT ??? -m recent --rdest --name APACHE_C_MAD --set
iptables -A APACHE_IS_OUT_RST ??? -m recent --rdest --name APACHE_C_BAD --set
iptables -A APACHE_IS_OUT_ACK ??? -m recent --rdest --name APACHE_C_BYE --set
iptables -A APACHE_IS_IN_SYNTWO ??? -m recent --name APACHE_C_HOT --set
...

This is where I either get lazy or get board, well too many unknowns
up to this point anyway.
