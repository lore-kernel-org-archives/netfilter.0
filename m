From: Martin Goralczyk <martin.goralczyk@gmail.com>
Subject: How to route specific packets to specific interface or IP
Date: Fri, 24 Jun 2016 18:32:35 +0200
Message-ID: <CANivh0NCvw9HshOLkv7zZOKzei0hLXVPosTuqCmz19q3a=Ar3A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=gJvTXKs9vj+esUxqt/RB5AATFlcUmlDwNv3HN5FbkyE=;
        b=BvjeND6y87OqId/2s1+qMCqpDhODHtX/jkcmmtUpSLQp4rs1pKqjgG1k+Rhy0j9KPT
         nTEwmxKAPrXHsD5+nQDNfMIFKmDNYsmxmhliPhCI8BgvHnBXZUTepGuucbxnM5d+HL60
         su2mySqlvCfgBFTZ46x1cX6QJAp1E00Gi1gVDv+wQ1uF8hsoi8WQgHLXeMUdpARl0teX
         rcYQHHVCDopOesFWfeMvCVNB6K2WrcKT4j66z1v5ecOcR98wEQxWGG4IP2k1xrPHjHas
         etzPvtXw9+wZNISHtYCAvG22UV8ujLWi/Q8/OdgKFPnm1kNELVas9VN2Ru335eXtNnsM
         z2lA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am running a mailserver at home and also have a "real server" with a
static ip somewhere else. The real server runs an openvpn-server and
my router at home is connected to this vpn.  What I want is, that if
my mailserver sends anything over port 25, it will be routed over the
vpn tunnel to the real server, then there will be NATed and sent to
the destination. Also all packets incoming on port 25 on the real
server should be forwarded/NATed to the mailserver.

So as a first step I am trying to configure my router to send all
packets from source IP "Mailserver-IP" and with destination port 25 to
either the tun Interface or the openVPN IP. I have read iptables
documentation, but am unable to see the right way. Could anyone help
me out and turn me into the right direction?

Thanks for any help,

Martin
