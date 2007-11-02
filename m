From: Bertram Scharpf <lists@bertram-scharpf.de>
Subject: Port forwarding inside router
Date: Sat, 3 Nov 2007 00:10:02 +0100
Message-ID: <20071102231002.GA16374@bart.bs.l>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

sorry, I have to ask another time. I do port forwarding for
a host inside my local domain. Say my router is 192.168.7.1,
the HTTP hosting machine is 192.168.7.33; queries from
outside reach it perfectly and those from for example
192.168.7.80 do as well. The commands that do this are

  dst=192.168.7.33
  prt=80
  src=192.168.7.1

  $IPT -t nat -A PREROUTING -i ppp0 -p tcp --dport $prt -j DNAT --to $dst:$prt
  $IPT -t nat -A PREROUTING -d $src -p tcp --dport $prt -j DNAT --to $dst:$prt
  $IPT -t nat -A POSTROUTING -d $dst -m conntrack --ctorigdst $src -j SNAT --to $src

The only host that doesn't reach 192.168.7.33 is the router
itself. Now I desire to run a proxy on the router. I want
calls to 127.0.0.1, to 192.168.7.1 and to its ppp0 address
_from_ the router to be redirected to 192.168.7.33. They
don't.

  router ~ # telnet 192.168.7.1 80
  Trying 192.168.7.1...
  Connected to 192.168.7.1.
  Escape character is '^]'.
  ^]
  telnet> quit
  Connection closed.
  router ~ # /etc/init.d/lighttpd stop
   * Stopping lighttpd ...                [ ok ]
  router ~ # telnet 192.168.7.1 80
  Trying 192.168.7.1...
  telnet: connect to address 192.168.7.1: Connection refused
  router ~ # 

What do I miss?

Thanks in advance,

Bertram


-- 
Bertram Scharpf
Stuttgart, Deutschland/Germany
http://www.bertram-scharpf.de
