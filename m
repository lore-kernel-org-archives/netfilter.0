From: "me" <todh@todhackett.com>
Subject: Connlimit troubles  ( still )
Date: Wed, 2 Jan 2013 07:49:15 -0800
Message-ID: <20130102153847.M1860@todhackett.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All

Over the holiday I upgraded to:
Netfilter v1.4.14
OS 3.6.10-2.fc17.i686

I have the following in my rules:
-A PREROUTING -i p1p1 -p tcp --dport 4800 -j DNAT --to 192.168.1.253
...
-A FORWARD -i p1p1 -o em1 -d 192.168.1.253 -p tcp --syn -m connlimit --connlimit-above 1
-j LOG --log-prefix " MultiIP "
-A FORWARD -i p1p1 -o em1 -d 192.168.1.253 -p tcp --syn -m connlimit --connlimit-above 1
-j REJECT --reject-with tcp-reset

With the old OS - I would see the above log entry some of the time and assumed that the
packet was dropped.

With the NEW OS - I am not seeing anything.

conntrack shows incoming and outgoing ( conntrack -L ) but the filter is not logging or
rejecting any of the connections.

What am I missing?

Oh, folks connect on tcp 4800, then get a UDP port from the endpoint application.  I can
view the endpoint application and see multiple connections from the same IP.

Thanks and Happy New Year!

todh

--
Todd Hackett             Chief Bottle Washer
PoBox 1168
Libby, MT 59923
406.293.3843

