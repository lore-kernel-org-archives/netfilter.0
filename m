From: "wchristian@gmx.net" <wchristian@gmx.net>
Subject: redirect local port to another local port
Date: Fri, 14 Jan 2011 00:17:29 +0100
Message-ID: <AANLkTikH4=yxqQW60iD5+fqc6ZwG=YKmn5u9AQ0Y9Zyw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi!

I want to redirect packets incoming on eth0 on port 12345 to port
12346 on the same machine.
Already got it working with this command:
iptables -t nat -A PREROUTING -i eth0 -p tcp --src 1.2.3.4 --dport
12345 -j REDIRECT --to-ports 12346
Client 1.2.3.4 can connect to 12345, but is logical connected to
service on 12346.

But I want this for all sources, so I omitted the src-param.
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 12345 -j REDIRECT
--to-ports 12346
This way the client can't connect to the service.
Could someone explain me this=A0behavior, please?

I am forwarding both ports with my home-router (Fritz!Box) to the
machine, I also tried to forward the external port 12345 to the local
machine:12346, but this also does not work.
Could the service causing the problem?

Greets
