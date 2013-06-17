From: Allen Seelye <alleninmt@gmail.com>
Subject: 'Invalid packet' problem since upgrading
Date: Mon, 17 Jun 2013 07:36:50 -0600
Message-ID: <51BF10F2.2040808@gmail.com>
Reply-To: alleninmt@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=ddhmIDbPGJsni0lJd8sLauux7DYVnSMbgpVNKX/1ntQ=;
        b=TImc19dD5mrM8BuPI6D1eNn9z5ebCOzjIBxoPp9OffmZWejworZOBbES7cGC6FOHeI
         kcPgR92k7HCiN2SJkfCQTO6det//6Ow4IO0PniyQSMp8lvtlSeCSWvNiXWSF6kFoXjbV
         aFcwzODqQg3mpecDQZIPjULqxhFCx/K56xRQnmTNudgwEv+CpIL5NPvvqvb+oHrhL8PT
         15DevHk43OhfibRnV7+w5kV+nbOCd95KmndjQidKCMUj+/VDcgJmDu5GQ5tHqEOGpqSL
         d0gg+K4GPWOzS9p0jAgPuhMEqmfz1SCFkLHaYtHvJB1mI9jaSYQ7kiGJtav0EUP6V3/G
         oOOw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm not sure if this is an iptables issue or an Ubuntu issue.

I have a PC acting as a firewall and router, using iptables. We have a
Wii-U inside the network and until a few days ago, it had no
connectivity problems at all. I upgraded the firewall PC from Kubuntu
10.04 to 12.04 and suddenly the Wii-U cannot connect.

It would appear that this is not a problem with the Wii-U. If I connect
it directly to the Optimum modem, everything works fine. It's something
wonky with the Kubuntu PC, since I upgraded. Nothing in my
iptables.rules has changed. I'm using the same set of rules as before
the upgrade.

I called Nintendo tech support and they insist that there is nothing
special that needs to be done. Their solution was to put it in a DMZ but
I'd rather not do that if I can avoid it.

I do an internet connection test in the Wii-U and it passes but it can't
connect to any services which require talking to the nintendo network,
such as Hulu, Netflix, the Nintendo e-shop and quite a few games.

I also have several PC's, three Android devices, an old Wii, two
Nintendo DS's, an old Xbox, a PSP and a PS3 and none of them have
experienced any problems since the upgrade, they're all able to connect
fine.

I checked Nintendo's support site and their advice is to forward all
ports (specifically 1-65535) to the Wii-U, which I can't do for obvious
reasons.

Other things I've tried:

I've opened the firewall up completely, allowing all traffic through.
I've explicitly allowed all traffic on all ports, to and from the Wii-U.
I've tried running several older kernels.
I've tried shutting down apparmor.

None of these have worked.

The only thing that did work, was to remove the Kubuntu box completely
and connect my switch directly to the Optimum modem.

I have no rules in place restricting the Wii-U at all. I do a grep in
syslog for the Wii-U's IP and I get a lot of this:

--------------------------
kernel: [ 7236.919902] Invalid packet: IN=eth0 OUT=eth1
MAC=00:c0:f0:2d:9e:b4:18:2a:7b:85:09:e5:08:00 SRC=192.168.58.38
DST=23.43.226.90 LEN=1042 TOS=0x00 PREC=0x00 TTL=63 ID=3693 PROTO=TCP
SPT=1772 DPT=443 WINDOW=32768 RES=0x00 ACK PSH FIN URGP=0
--------------------------

If I'm interpreting this correctly, it thinks that there is a problem
with the packets coming from the Wii-U and it's dropping them. I've
tried removing the rule that drops invalid packets and it stopped
putting these warnings in the log, but the Wii-U still can't connect to
the Nintendo network.

There has to be a change in the way that iptables or something else on
the system is routing traffic or handling packets, but I have no idea
what that is.

Any help or advice is appreciated.

Thanks!
