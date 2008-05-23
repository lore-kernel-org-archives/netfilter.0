From: "Sapytsky Ilya" <sova00@gmail.com>
Subject: policy routing and iptables troubles
Date: Fri, 23 May 2008 11:20:27 +0400
Message-ID: <dbf157780805230020y42d02abcucf43c5d2e4a759ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=j2QqVcQot3HAFES8lA0ey+rCk1/7tN6Jp8bzLXQ2ij8=;
        b=kQSy1qMXl6SrT3uiWHsNotTmq3XQaFeF62lFmSsg72wzfKj/2rWyh42FmBQbV3u6pd3tQaam3MySR8l7LxlJHEypJC7F2eL9H6cRLHbS6mpxK2vjMQO8zhWKpDGhJTMBDP+S2bcSQo36HFRchQrtxr1RixQM13dFMRz6QrYyD/U=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Good day!
I'm getting trouble in policy routing on debian etch with
linux-2.6.18-4-486 router and dual network interface.
I want to make second MX for my domain on the same server as first,
but on another network interface from second ISP.

That is my firewall settings:
CSD is remote host
TEST1 is my server with MX

#INPUT
iptables -t mangle --append PREROUTING --protocol tcp --syn -m state
--state NEW --source $CSD --dst $TEST1 --in-interface eth1 --jump
CONNMARK --set-mark 0x1
iptables -t mangle --append PREROUTING -m connmark --mark 0x1 --source
$CSD --dst $TEST1 --in-interface eth1 --jump CONNMARK --restore-mark
iptables --append INPUT -m connmark --mark 0x1 --source $CSD --dst
$TEST1 --in-interface eth1 --jump ACCEPT

# OUTPUT
iptables -t mangle --append OUTPUT -m connmark --mark 0x1 --source
$TEST1 --dst $CSD --jump CONNMARK --restore-mark
iptables --append OUTPUT -m connmark --mark 0x1 --source $TEST1 --dst
$CSD --out-interface eth1 --jump ACCEPT


that is my ip settings:
GATE is my default gw for eth1 interface

ip route add $GATE dev eth1 table ytk
ip route add default via $GATE dev eth1 table ytk
/sbin/ip rule add fwmark 0x1 table ytk

The result is:
iptables INPUT rules passes well, but output rules fails, because
packets wanted to get out through eth0.
May 22 16:18:09 test kernel: marked output finded IN= OUT=eth0
SRC=<TEST1> DST=<CSD> LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=TCP SPT=22 DPT=3029 WINDOW=5792 RES=0x00 ACK SYN URGP=0

I googled this quiestion last 3 days and i have unsuccessful result.
Where is mistake and why packets, marked as 0x1, doesn't goes through eth1?
Anybody has any ideas about this question?
Thanks in advance.
