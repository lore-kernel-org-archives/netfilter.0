From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Problem using hashlimit for bandwidth limit
Date: Thu, 28 Aug 2014 14:03:44 +0530
Message-ID: <CAA5aLPhZo+qGMcFA=HOm-KgcczyJvf_27rxnG3_1h8hQpK+kHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=WgPKnD/wcuHjg2S9QhVbRqc2JisxZGnkY+pBoDLH1B8=;
        b=MyI2XxUI1vWE9qZuHTgwonXDhcdHcYN4qTsAjYSrqGh8jDj7iPJaWqkpBPCOtkUuUz
         aglNOn91atDqDKygX63iVoG/d4/htJgvMcG4OX8DsokPuwkhbBIRgnWUPrIVft+JSV4Y
         Gh36dMPqb/Xd6GYQn2pVhSqbVQqpybaG7dsuVFoolAlBzvAyOFosY+AA+Zdq7C55Jt7Q
         QRmbtqd62jhkUdcRhERH/7Guh9g41GYFSQ0Y/32cFFpc2TCFcayCBil4y/x5BQloErBR
         GwNUYY8fHmZ5plDMZTdXW2zB+TeXRbu+zdOqeXrnV8gmtc455USh/Fq/nSc4ZnxPg+OD
         t35A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!


I want to use hashlimit for giving all my users a fix set of bandwidth
of 512kbps for accessing internet.


I am using following command.


# allowing return packets so that rate limiting is done only on forward packets.

iptables -A FORWARD -s 192.168.192.168 -j ACCEPT

# If limit is upto 512 then allow

iptables -A FORWARD -m hashlimit --hashlimit-name test512
--hashlimit-mode srcip --hashlimit-htable-size 1000
--hashlimit-htable-max 1000 --hashlimit-upto 64kb/s --hashlimit-burst
128kb -j ACCEPT

# else drop

iptables -A FORWARD -j DROP


I am not observing the expected behaviour.

I am sending ping of 100 bytes continously at 10 msec interval.

What I observed is , I got back reply of only first 2 pings and for
remaining there is no reply. Nest reply came only after 103 Seconds
!!! and that too only a single reply.


output of iptables -L -n -v also shows only 2 packets matching this rule.


output of command cat /proc/net/ipt_hashlimit/test512 come like


59 10.10.10.10:0->192.168.192.168:0 764416 6688000 3328000

the number 764416 keeps on increasing but not observed any reply till
it reaches the value of 3328000. But it takes huge time (~103 Seconds)
to reach that value.


Can anyone please explain all this behaviour ?


Thank you .
