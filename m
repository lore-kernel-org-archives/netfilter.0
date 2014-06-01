From: dapiot holmp <dapiotholmp@gmail.com>
Subject: ebtables not blocking arp (or anything). I am using knoppix
Date: Sun, 1 Jun 2014 12:47:52 +0100
Message-ID: <CAKBM6-PHW3C5r0v+KiFd1nuP7oUrZyw=T_AEs0Nea-1o38D2sg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=L2yCEeHREB68xI0jdam/wh2lHOZJChVEXtNZZqrK8lM=;
        b=LejIgaeAZ+/MQyFsTfnA9Iygx0FYreocRdOD3jS5jbt9UTwnStWDxEP2ISTCujF5yM
         bwth7LP4PvsueROnmoMnEHlZk4idjoAoXAbEWmojl29q1pdqtzLg1fU27F72KXXoEXlx
         SJAiXl/Cf0Vfh719KLZe+yVjzADtst98yy6bdoFObLXdD+/deGto3ZY5r+snNmpWr95x
         NzMhMltrQeE0ftt7yD6r6k1Gi6phbUAvNWzgNTATaiX1tU28CH92qKPHfmVhcVzt4mbT
         1aI7lBfJ0ZTbymchqCh9zOLB9DcckARskOGisN6O7rsjV40gDuOqC5kyTgJg8er18bxF
         EciA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I know what ARP does but for fun, and to see what ebtables can do, I
want to try to block ARP.

I know arptables can apparently do it but i'm wondering if ebtables can.

I am using Knoppix.

Unfortunately I can't manage to block arp, as I see it in wireshark
and as this terminal output proves.

I looked at the arp table, and the MAC for 10.0.0.3 is there.
I deleted that MAC entry.
checked it was deleted.

I pinged that IP
That MAC entry reappeared straight away.

I figured
$ sudo ebtables -A INPUT -j DROP
and
$ sudo ebtables -A OUTPUT -j DROP

I thought that would be enough to stop the ARP but they weren't and I
use all these ebtables commands

I have no LAN cable, i'm on WLAN, connected and the interface i'm using is wlan0

$ sudo ebtables -A INPUT -j DROP
$ sudo ebtables -A INPUT -p ARP -j DROP
$ sudo ebtables -A INPUT -i wlan0 -p ARP -j DROP
$ sudo ebtables -A OUTPUT -j DROP
$ sudo ebtables -A OUTPUT -o wlan0 -p ARP -j DROP
$ sudo ebtables -A OUTPUT -p ARP -j DROP
$


The output below demonstrates it not stopping ARP


knoppix@Microknoppix:~$ arp -a
....
? (10.0.0.3) at 00:11:09:81:0a:df [ether] on wlan0

knoppix@Microknoppix:~$ sudo arp -d 10.0.0.3
knoppix@Microknoppix:~$ arp -a
....
? (10.0.0.3) at <incomplete> on wlan0

knoppix@Microknoppix:~$ ping 10.0.0.3
PING 10.0.0.3 (10.0.0.3) 56(84) bytes of data.
64 bytes from 10.0.0.3: icmp_req=1 ttl=128 time=5.67 ms
....

knoppix@Microknoppix:~$ arp -a
? (10.0.0.3) at 00:11:09:81:0a:df [ether] on wlan0
knoppix@Microknoppix:~$


I have tried some more ebtables commands and printed the ebtables chains


root@Microknoppix:~# ebtables -A INPUT -i wlan0 -j DROP
root@Microknoppix:~# ebtables -A OUTPUT -o wlan0 -j DROP
root@Microknoppix:~# ebtables -L
Bridge table: filter

Bridge chain: INPUT, entries: 4, policy: ACCEPT
-j DROP
-p ARP -j DROP
-p ARP -i wlan0 -j DROP
-i wlan0 -j DROP

Bridge chain: FORWARD, entries: 0, policy: ACCEPT

Bridge chain: OUTPUT, entries: 4, policy: ACCEPT
-j DROP
-p ARP -o wlan0 -j DROP
-p ARP -j DROP
-o wlan0 -j DROP
root@Microknoppix:~#

But I find that ARP still works, and i'd have thought maybe everything
would be blocked but I can still use wget for example.  So it seems
that nothing is blocked.

iptables does block stuff though doesn't do arp, but it is working.

I have added rules that specify the source mac if the computer whose
mac i'm trying to block

# ebtables -A INPUT -s 00:11:........ -j DROP
# ebtables -A INPUT -s 00:11:........ -i wlan0 -j DROP

so if that computer makes a request for my or another computer's mac
in its broadcast, it should be blocked from reaching my NIC.

or if I make a request for its MAC, it should be blocked
# ebtables -A OUTPUT -d 00:11:09:81:0A:DF -o wlan0 -j DROP

but I do a ping, it makes an arp request, arp's still not blocked.

iptables is fine though. (i'm guessing they can be used together and
i'm not sure I can stop iptables to test that).
