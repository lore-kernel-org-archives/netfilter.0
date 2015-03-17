From: Murugan Venugopal <muruga86@gmail.com>
Subject: Re: Remote telnet session - "conntrack -L" TO value displays incorrectly
Date: Tue, 17 Mar 2015 19:00:16 +0530
Message-ID: <CAMVHObP+CdxYifyT1w6kqjwm-krCtQaeWUK-AWPLZPsOcR9o7Q@mail.gmail.com>
References: <CAMVHObNhJyq6UkAuXRoyvfoFCsi+jotKaqYi34W1-G7fzK8N1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=5HcHiWoL5s56lUeukPmr4gA+pSJQAfJKQ5mMCz2RhVA=;
        b=QBKr4UN0qlMcVeUagdHEJUTE3fiLGOYr/XtG4gaImevrWe27sa8KamT8DnoYbQPMgB
         E2u/CEP9002FPzlvEpnKyDvm+g62f2PDF2In7Qs+NaijDrpGBH1PC8Dwp4qRhk8iEWGz
         kE4rD0G5uG0uZZWVWWRS/9tbOJyS7o6EVluAt3DdqB+0vxN6pjd4dMr4WUDH1F8qWlDS
         kgrGOaVNmJo2F7AVDmwSKjbc8Jy2i8inDQH89dnMFy40Sk7kbj28JD021r3ko89cIDtf
         4cFKiRT45eUDjm6Awj6IuznOr7Hb3n5HleQmEjTWijt7niRZlbAt1Of+htSxxlCDWGs1
         m7Bg==
In-Reply-To: <CAMVHObNhJyq6UkAuXRoyvfoFCsi+jotKaqYi34W1-G7fzK8N1w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

This issue occurs for both telnet and ssh sessions.
I believe this could be bug, or some one clarify its a expected behavior.
The output in linux server console is ok, while the output from the
telnet or ssh session displays
nf_conntrack_tcp_timeout_unacknowledged value instead of actual TO value.


SSH:
#conntrack -L -p tcp --dport=22
tcp      6  299 ESTABLISHED src=192.168.2.1 dst=192.168.2.2
sport=34812 dport=22 packets=250 bytes=20861 src=192.168.2.2
dst=192.168.2.1 sport=22 dport=34812 packets=151 bytes=19606 [ASSURED]
mark=0 use=2
conntrack v1.0.0 (conntrack-tools): 1 flow entries have been shown.

Telnet:
#conntrack -L -p tcp --dport=23
tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1369 dport=23 packets=252 bytes=14212 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1369 packets=231 bytes=63012 [ASSURED]
mark=0 use=3
conntrack v1.0.0 (conntrack-tools): 1 flow entries have been shown.

//Packages used:
conntrack-tools-1.0.0
libnetfilter_conntrack-0.9.1
libnfnetlink-1.0.0
iptables-1.4.16
Linux kernel 2.6.34.8


Regards,
Murugan

On Sat, Mar 14, 2015 at 2:30 PM, Murugan Venugopal <muruga86@gmail.com> wrote:
> Hi Everyone,
>
> I face an peculiar issue.
> I have a Linux server box from where telnet session is done via remote PC.
> "conntrack -L" displays correct details in Linux server box, while in
> the remote telnet session (To value is displayed as 299 for
> established tcp connection).
> Then i created one more telnet sessions, here too for the current
> telnet connection entry the TO value is being displayed in correctly.
>
> Logs:
>
> // In TELNET SESSION1 (sport=1369 dport=23)
>
> #conntrack -L -p tcp --dport=23
> conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
> tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1369 dport=23 packets=252 bytes=14212 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1369 packets=231 bytes=63012 [ASSURED]
> mark=0 use=3
>
>
> // In TELNET SESSION1 (sport=1369 dport=23)---> 2 telnet sessions
>
> #conntrack -L -p tcp --dport=23
> conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
> tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1369 dport=23 packets=372 bytes=15239 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1369 packets=258 bytes=63295 [ASSURED]
> mark=0 use=3
> tcp      6 7495 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1415 dport=23 packets=90 bytes=3747 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1415 packets=67 bytes=7115 [ASSURED]
> mark=0 use=2
> #
>
> // In TELNET SESSION2 (sport=1415 dport=23) ---> 2 telnet sessions
>
> #conntrack -L -p tcp --dport=23
> conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
> tcp      6 7496 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1369 dport=23 packets=374 bytes=15319 src=192.168.1
> .254 dst=192.168.1.64 sport=23 dport=1369 packets=259 bytes=63823
> [ASSURED] mark=0 use=2
> tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1415 dport=23 packets=97 bytes=4036 src=192.168.1.25
> 4 dst=192.168.1.64 sport=23 dport=1415 packets=71 bytes=7340 [ASSURED]
> mark=0 use=3
> #
>
> On further analysis, i notice the strange value 299 is obtained from
> value 300 set in
> /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_unacknowledged 300.
> When i modify this value from 300 to 400 then both the telnet sessions
> display 399 instead of 299.
>
> // In Telnet1 (sport=1566 dport=23) --> 1 telnet session
>
> #conntrack -L -p tcp --dport=23
> tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1566 dport=23 packets=101 bytes=4151 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1566 packets=75 bytes=3557 [ASSURED]
> mark=0 use=3
> conntrack v1.0.0 (conntrack-tools): 1 flow entries have been shown.
> #
>
> // In Telnet1 (sport=1566 dport=23) --> 2 telnet sessions
>
> #conntrack -L -p tcp --dport=23
> tcp      6 7497 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1567 dport=23 packets=86 bytes=3540 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1567 packets=67 bytes=3907 [ASSURED]
> mark=0 use=3
> tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1566 dport=23 packets=110 bytes=4520 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1566 packets=80 bytes=4291 [ASSURED]
> mark=0 use=3
> conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
> #
> #
> // In Telnet2 (sport=1567 dport=23) ---> 2 telnet sessions
> #
> #conntrack -L -p tcp --dport=23
> tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1567 dport=23 packets=93 bytes=3829 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1567 packets=70 bytes=4074 [ASSURED]
> mark=0 use=4
> tcp      6 7454 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
> sport=1566 dport=23 packets=112 bytes=4600 src=192.168.1.254
> dst=192.168.1.64 sport=23 dport=1566 packets=81 bytes=4610 [ASSURED]
> mark=0 use=2
> conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
>
>
> I feel this anomaly is strange and could some one clarify whether this
> is normal expected behaviour or some error.
>
> Thanks in advance.
> Murugan
