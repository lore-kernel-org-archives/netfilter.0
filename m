From: Nick Khamis <symack@gmail.com>
Subject: IPTables - Going Stateless
Date: Tue, 21 May 2013 11:07:10 -0400
Message-ID: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=/plckz5wJvizOGZoU3KYfZW8/q6q21k1dC2FNHw8Wv8=;
        b=l+qBL/PFuHlXHjoGgES4X/72y4im+PAghyaMMUDGtNUEExfNbLay+91kEnJ4bIXVIm
         cNT4cHALVb4Lr9lRxnqWJlMm6c/CWs5xZGVktArpOoZv170Xk/eX6Onfq42/d94qauZy
         SU2amScP4yBJP61RlR0mY/QNC4/26+VEGIUvYcbYv3YaV4XJIxZuXlwSNo8FJuc5/rNU
         rsjyGQQ0zngIb+Jitxs5gsN9uvohq4djgM28rNgAZrAorI4y8yVFO9FPiPDjOGztWujT
         +CGy8U/coyiHl1XVpBslHIShaQSReAP6BPC4E+pz2SrWm647kHS4JiRDpWqQoxhfMCnX
         IuIg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Everyone,

We recently moved our stateful firewall inside, and would like to
strip down the firewall at our router connected to the outside world.
The problem I am experiencing is getting things to work properly
without connection tracking. I hope I am not in breach of mailing list
rules however, a stripped down configuration is as follows:

#!/bin/bash
IPTABLES='/sbin/iptables'

#Set interface values
INTIF1='eth0'

#flush rules and delete chains
$IPTABLES -F
$IPTABLES -X

#echo -e "       - Accepting input lo traffic"
$IPTABLES -A INPUT -i lo -j ACCEPT

#echo -e "       - Accepting output lo traffic"
$IPTABLES -A OUTPUT -o lo -j ACCEPT

#echo -e "       - Defined Chains"
$IPTABLES -N TCP
$IPTABLES -N UDP

#echo -e "       - Accepting SSH Traffic"
$IPTABLES -A TCP -p tcp -m tcp -s 192.168.2.0/24 -d 192.168.2.5
--dport 22 -j ACCEPT
$IPTABLES -A TCP -p tcp -m tcp -s 0.0.0.0/0 -d 192.168.2.5 --dport 22 -j DROP

#echo -e "       - Accepting input TCP and UDP traffic to open ports"
$IPTABLES -A INPUT -i $INTIF1 -p tcp --syn -j TCP
$IPTABLES -A INPUT -i $INTIF1 -p udp -j UDP

#echo -e "       - Accepting output TCP and UDP traffic to open ports"
$IPTABLES -A OUTPUT -o $INTIF1 -p tcp --syn -j TCP
$IPTABLES -A OUTPUT -o $INTIF1 -p udp -j UDP

#echo -e "       - Dropping input TCP and UDP traffic to closed ports"
# $IPTABLES -A INPUT -i $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
# $IPTABLES -A INPUT -i $INTIF1 -p udp -j REJECT --reject-with
icmp-port-unreachable

#echo -e "       - Dropping output TCP and UDP traffic to closed ports"
# $IPTABLES -A OUTPUT -o $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
# $IPTABLES -A OUTPUT -o $INTIF1 -p udp -j REJECT --reject-with
icmp-port-unreachable

#echo -e "       - Dropping input traffic to remaining protocols sent
to closed ports"
# $IPTABLES -A INPUT -i $INTIF1 -j REJECT --reject-with icmp-proto-unreachable

#echo -e "       - Dropping output traffic to remaining protocols sent
to closed ports"
# $IPTABLES -A OUTPUT -o $INTIF1 -j REJECT --reject-with icmp-proto-unreachable


Everything works fine with the REJECT rules commented out, but when
included SSH access is blocked out. Not sure why, isn't the sequence
correct (i.e., the ACCPET entries before the DROP and REJECT)?

Also, any pointers or heads up when going stateless would be greatly
appreciated.

Kind Regards,

Nick
