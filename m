From: Ravi Kanth Vanapalli <vvnrk.vanapalli@gmail.com>
Subject: Changing the incoming interface of the packet using iptables MARK and
 ip route commands
Date: Tue, 30 Apr 2013 23:06:03 -0400
Message-ID: <CALyk9ewHd1EgDJ-LhSQsOZwasJE-CM9nuLH9djtLOMKHPnJm0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=CWeKn5KT2Nvp6PNr1GNa0cjJtqbf83mTsi/fRDZv7DM=;
        b=gAda7heBDL6VWviGy7JgpTPG5WpYPY8pk2/x4ga30rVZCrYotot7pqKJm+nB+Uh2H5
         R7rfth/woP5F/VjNoTQkf9oC4AmPjC0Yu0xlMzn18jeHGXt8eKwFMArheyvnGzGdPhxI
         zz+GDWYWdQve5x7PL4BvUdAedUDUpPMNZJhnJB2e18ixqsDj4eRcCY02702pj5RbpSHB
         FTKo5ILFC01ozmq+kB67i8J9W9BTRjMXP5qAcoOM4kMsOf9uQWQcyCvplJej2o7PH8GW
         cdnsMwOivALoBkymzu6KEWYI8A+pqOfCu3VE3STUMJILM12A/Y7bGlh70wGEsnxMCnc2
         Su3Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I was trying to change the incoming interface of the packet using
iptables MARK and ip route commands.

I have tried this approach after going through the weblink
belowhttp://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-4.html#ss4.5
which suggests the use of iptable Mark and iproute2 utilities instead
of ROUTE target. but could not find any success chaging the incoming
interface of the packet in the receiving path.

I have an application 'A' which binds to an interface 'intfA' in linux
i.e the application sends and receives packets only on via intfA.

Sending path

In a tunnel based setup, I was able to send packet's out from 'intfA'
to 'tap0' using the following iptable commands.

iptables -t mangle -A OUTPUT -d 8.9.10.11/32 -j MARK --set-mark 1 ip
rule add fwmark 1 priority 9000 table 1

My default routing entry in main table is pointing to 'intfA'

In table '1' I have made the default routing table entry point to 'tap0'

route add default dev tap0 table 1

I could observe from the kernel dmesg logs that the outgoing interface
of the packet changed succesfully from 'intfA' to 'tap0'.

In the return path

After 'tap0' gets the encrypted packet from tunnel, it decrypts it and
injects the plain text packet with destination 'a.b.c.d' into the
linux kernel via the 'tap0' interface.

So at the kernel prerouting hook, I see the packet coming with IP =
'a.b.c.d' and with incoming 'tap0'.

Following iptable rules were used to change the incoming interface

iptables -t mangle -A PREROUTING -d a.b.c.d/32 -j MARK --set-mark 2 ip
rule add fwmark 2 priority 8000 table 2

In table '2' I have made the default routing table entry point to 'intfA'

route add default dev intfA table 2

I tried to log the packets at the PREROUTING hook and the INPUT hook
using the following iptable commands.

iptables -t mangle -A PREROUTING -d a.b.c.d/32 -j LOG --log-level 0
--log-prefix "VPN PREOUTING: " iptables -t mangle -A INPUT -d
a.b.c.d/32 -j LOG --log-level 0 --log-prefix "VPN INPUT: "

I was hoping the incoming interface of the packet to be changed from
'tap0' to 'intfA' between the PREROUTING hook and INPUT hook. But
surpisingly the interface doesn't change in both the kernel log trace.
I could see the incoming packets marked with mark 2 as well.

From the dmesg log's i confirmed that the Incoming interface still
remains as 'tap0' after the INPUT hook.

I wanted to understand the reason behind this behaviour for the
iptables commands I have used. . Not sure if I missed anything in
iptables commands I used which is causing this issue.

- RV
