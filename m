From: Abogholo A <abogholo@gmail.com>
Subject: why scapy packet no effected by ip tables
Date: Wed, 16 Jul 2014 17:16:21 +0430
Message-ID: <CAPpnho=+jciiQzpa9gnihrJsBRnRkniQtfWHPcrr7s4-3KHSDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=yV/w6NEUwxqzcaRSsHrOIG6XCPiD9IHhqZ27i8S6SHk=;
        b=x+OfYm52LmbXcfUsoWQIIceGi3VjpbX3LMLHn7Lt0ltcK5yNt0+wz7h+ScjZGk/r/r
         8hahMQUDg9SU1Z94HAxRXkvx6g+xQvu10onNYdGGgRSSp8+szu76Av/c2PwjtP3sWOvU
         7BN4McDbL8SonGjijvogDC1bsPp3pb9l4oBSRb/FPBAVBd75USDUJh46K/+Wi0jCkfDT
         wDnoIBgWzPKn95BT4mFBqvB63XWEP1xWOu7JU+GCWO8Nl2gepCNqjs/PplGgJNViKyGW
         xA1ds0RLlm5avsg3nJh/AKGTvSzl5QcprNYb+q1w1zpsuzPinxIR/V7YjwwnYrZNh1Zd
         xGyQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

HI


i wrote this rule for change all udp destination ip address to 8.8.8.8
when dport is 53:

iptables -t nat -A OUTPUT -p udp -m udp --dport 53 -j DNAT
--to-destination 8.8.8.8

but when send this packet

sr1(IP(dst="4.2.2.4")/UDP()/DNS(rd=1,qd=DNSQR(qname="iranled.com")))

iptables no effected to them

why?

more details:

http://unix.stackexchange.com/questions/144729/iptables-rule-no-actions-on-scapy-packets
