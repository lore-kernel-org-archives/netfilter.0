From: Christopher Piggott <cpiggott@gmail.com>
Subject: fwmark in the OUTPUT chain
Date: Wed, 29 Sep 2010 13:51:02 -0400
Message-ID: <AANLkTinezQJPvc-WaBt9L64Z-cEGqm9ugSeaL6xTnA3W@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=zjWteNWedZIsP6H0j5T5zLc003Aq/xKXfztcXVRESrA=;
        b=hiuvVRxUcjK9mItd9HAKbPFgdPQmQ159aZKVfrbh1adrUXkJ+Gm1ILBD4KyAjiFzzk
         YW/hgapAQv1x4AYx64jqDL/MVtROb5mWROfmnahl2CwvXrx6U/osaYebd6DPSVu4gr+q
         sQKyQCSeVbwHcrMQoo3KCXJFlUu7zFSVzi+NE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

This question will probably make a lot more sense if you look at
http://wiki.ubuntu.org.cn/images/f/f0/Iptables.gif while you are
reading it.

I am trying to mark packets with a certain fwmark for routing
purposes.  The examples all say this is done in table "mangle" in the
"prerouting" chain; but in my case, the packets I want marked are from
the local system.  I have been marking them in the mangle table of the
OUTPUT chain.

This does, in fact, seem to set the correct mark on the packet, but,
unfortunately, the packet's source address seems to have already been
picked by this point.  In other words, if your user code calls
socket() then connect(), at some point a local address has been
chosen.  On the IPTables canonical packet flow diagram, I believet his
happens in the "Routing" block that comes just after "Firewall Reply."
 (Is that true?)

The problem I'm trying to solve is this:

Network 'wlan0' is wifi.
Network 'ppp0' is a cell card.  When connected, it is the
highest-priority default route.

I have some "bulk uploads" that must be routed over wlan0; all other
traffic should be routed via ppp0.  I identify the bulk traffic with
netfilter matching rules based on things like destination-port.

Now, if traffic wasn't able to go out wlan0 for x days, I assume that
there is a problem, and this traffic will in that case be sent via
ppp0.  I "change directions" by modifying the netfilter rules.

Example:

ip rule add pref 100 fwmark 4 table 9
ip rule add pref 101 fwmark 4 blackhole

iptables --table MANGLE --append OUTPUT --protocol tcp
--destination-port 1234 --jump MARK --set-mark 4

ip route add table 9 via xxx.xxx.xxx.xxx dev wlan0


THE GOOD NEWS: the packet goes out interface wlan0
THE BAD NEWS: the packet's source address is ppp0's network address
(not wlan0's)


I don't see a way out of this.  Anyone?

--Chris
