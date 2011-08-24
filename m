From: Adishesh M <adisheshsm@gmail.com>
Subject: ssh session are hanging when firewall is restarted
Date: Wed, 24 Aug 2011 19:12:11 +0530
Message-ID: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=9HFpZMXbC5iOp1SQxxL0SjVLtlCiVOwAqeVqpPpI1TQ=;
        b=tEvFzZEBJ93EK5u5MNF5OXgYpywfN1fSR3BlVCyjPxvQyVGqa5/qUbZyso0scbWAkj
         5CXu0cfjcTNaknNJGgxEdRjnaTWq6IVvFIaWLXdDnrdoTFPiTQQHLHK8lwwyVp80k0Sx
         UxFnACo2ZJUVxGzAN1IlhuIerejU7sALRVRA4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,
When we insert below rules into the ip tables, ssh sessions are
hanging ( infact all tcp connection are terminated).

=93iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
state --state NEW -j DROP=94.

what is the problem with this above rule. we used this rule to drop
bad tcp packets. when firewall is restarted using "service iptables
restart", ssh sessions are hanging.


Rule used for testing.

ssh session hangs
<set 1>
--------------------------
iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
state --state NEW -j DROP
iptables -A INPUT -d 10.255.13.157 -m state --state
RELATED,ESTABLISHED  -j ACCEPT
iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A  INPUT -d 10.255.13.157   -j DROP


ssh session hangs
<set 2>
----------------------------
iptables -N TEST_LAN_1
iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
state --state NEW -j DROP
iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
RELATED,ESTABLISHED  -j ACCEPT
iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACC=
EPT
iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP



ssh session does not hang
<set 3>
---------------------------------------
iptables -N TEST_LAN_1
iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
RELATED,ESTABLISHED  -j ACCEPT
iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACC=
EPT
iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP


ssh session does not hang
<set 4>
---------------------------------------
iptables -A INPUT -d 10.255.13.157 -m state --state
RELATED,ESTABLISHED  -j ACCEPT
iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A  INPUT -d 10.255.13.157   -j DROP


steps to reproduce the this issue
-----------------------------------------------
    iptables -F
    iptables  -X
    <Insert any one set of rules from set 1 or set 2 >
    service ip6tables stop
    service iptables save
    iptables -L -n
    service iptables restart
    iptables -L -n

Thanks and regards,
Adishesh
