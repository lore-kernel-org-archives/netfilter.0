From: Silva Paulo <psdasilva@yahoo.com>
Subject: Problem with unaccepted rules!
Date: Fri, 4 Sep 2009 15:38:39 -0700 (PDT)
Message-ID: <112176.44749.qm@web112010.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252103919; bh=vIHdekoxlNkhyLRIhY+UsMns7ilyvMoZC6g7SJYKmu0=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=a+sNt37rNmvfmv8RqSM95KmAeLvV66CkAeEDA5pUzGoB1efxMMQLYFjTUVWW3AGXohL33mHxuQwkOXfTr1q3Y7Pft2PxkbMG3MuqUJtw+TuGqn5KG5DViS6w7KszSnQuZUG/2MSxAfuSs69+6gJotxAKdvciC27FuwSlRZ4qZbQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm having the following problems with iptables 1.4.3.2 on gentoo linux. Also tried with  masked (unstable) version 1.4.4 with the same results.

1. Guarddog generated script fragment
+ iptables -N logdrop2
+ iptables -A logdrop2 -j LOG --log-prefix 'DROPPED ' --log-level 4 --log-ip-options --log-tcp-options --log-tcp-sequence
+ iptables -A logdrop2 -j DROP
+ iptables -N logdrop
+ iptables -A logdrop -m limit --limit 1/second --limit-burst 10 -j logdrop2
iptables: No chain/target/match by that name.
+ iptables -A logdrop -m limit --limit 2/minute --limit-burst 1 -j LOG --log-prefix 'LIMITED ' --log-level 4
iptables: No chain/target/match by that name.
+ iptables -A logdrop -j DROP

2. A rule of a script I wrote
# iptables -A OUTPUT -j ACCEPT -m state --state NEW,ESTABLISHED,RELATED
-o wlan0 -p tcp -m multiport --dports 80,443 -m multiport --sports
1024:65535
iptables v1.4.3.2: invalid port/service `1024:65535' specified
Try `iptables -h' or 'iptables --help' for more information.

I have tried several combinations of this command with no success!
On open suse 11.1 box of a friend ran the command without any problem with iptables 1.4.2-rc1!

Any help on this?
Thanks



      
