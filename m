From: George Amanakis <gamanakis@gmail.com>
Subject: tc filter connmark
Date: Wed, 13 Aug 2014 17:00:51 +0200
Message-ID: <53EB7DA3.8020505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=jyKlROxu7f5QlOT6KarQOlxQorr6l+ZbETILl7lDJkc=;
        b=ayY3aG2Buu8OtqKNTD9Q29IAZejO+JZvPCV5QW2HLwkYUdTuk0G8sKD+56TNvqAtbf
         F361RGUiP/yXyH5SEIvASkJqMhH8cxz6qQF8TjKxk15iNlrn1r0ta1TzneV03qqVla0Y
         l6Vt6xYQxCuGZS04N716ia9YjGYhuhQab3y06S8VzgMFR1FQnczH6U2cbS2EhhPskTCX
         +KyIyioZ8ihPmX1+HYo3mt5tk1xh4E4WFe5hB1kLznFXfc5nnaXqAYm25d9Xy90357N1
         E8uqyrXkFrUGUO8/9NnRpRA8gedkuSiQomoitpvlk5rRGiVZjRnkE3jr4BDZ2wWPQh7V
         /sBw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear All,

I would be glad if you could help me out. I am running the following 
script:

-------------- cut - here -----------------

iptables -t mangle -N QOS
iptables -t mangle -A FORWARD -o eth0 -j QOS
iptables -t mangle -A OUTPUT -o eth0 -j QOS
iptables -t mangle -A QOS -j MARK --set-mark 3

iptables -t mangle -A PREROUTING -m mark --mark 3 -j ACCEPT ### (counter)

tc qdisc add dev eth0 root handle 1: htb
tc filter add dev eth0 parent 1: protocol ip prio 1 u32 \
     match u32 0 0 classid :1 \
action xt -j CONNMARK --save-mark

tc qdisc add dev eth0 ingress handle ffff:
tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 \
     match u32 0 0 classid :1 \
action xt -j CONNMARK --restore-mark

-------------- cut - here -----------------

Now if I insert (-I) in "PREROUTING" a "CONNMARK --restore-mark", my 
counter shows that egress filter "tc filter ... parent 1: ... CONNMARK 
--save-mark"marked them correctly.

However, if I remove the "CONNMARK --restore-mark" from "PREROUTING" my 
counter shows no traffic. This means that the ingress filter "tc filter 
... parent ffff: ... CONNMARK --restore-mark" is not working.

I tried this on latest Archlinux, Fedora 20 and Debian 7.6 and 
everywhere I get the same behaviour.What am I doing wrong?

Regards, George
