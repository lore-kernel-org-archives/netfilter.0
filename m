From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Re: Rate-limiting to halt brute-force attack
Date: Fri, 16 Nov 2012 14:20:58 -0430
Message-ID: <50A68B12.4070101@gmail.com>
References: <201211160922.36606.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5u6XX0goVxl79Fl7rgeIXL6NOPi9EFGSBQbdswIoKig=;
        b=er0Hieb7xtMOElzu+BNzDkFTak/wzbI2SuHW7cMYytFwLi6PRSGiCkIFn7z71rFCnA
         ChK7TuWp/CvuIaJFMhJqZpunK/cLg+nLubbgzHetvEySgrM62mTqpfEbTQRmD5sDM+H2
         Bn+ANgc7xKWUETgKg/AA3MoNOPBLj68omwcj6bF2Zv89/7c8L/K2AuIQKYX/o+8te7gq
         hiWY90UNRlF6HTRkTBbyzrq2rJUprKi4T849rvJWU+Hk9qV8sDIOMtQetRpanTg2a8KQ
         Hc/TqACfLEVRiWMONtcLzJmOjPgx4SqDalqhx3ZF5c6USGykBabUSTkJtehl0PHqjJja
         a33Q==
In-Reply-To: <201211160922.36606.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: netfilter@vger.kernel.org

In order to block 3 SSH attempts in 40 seconds, I'm doing the following:

First, this will syslog all silently dropped SSH attempts (after third 
in 40 seconds):
# iptables -A LOG-BlockdSSH -m recent --rcheck --seconds 40 --hitcount 3 
--name BlockdSSH --rsource -j LOG --log-prefix "iptables/BlockdSSH: " 
--log-tcp-options --log-ip-options

But LOG chain passes the packet to the following rule, so we must drop it:
# iptables -A LOG-BlockdSSH -m recent --rcheck --seconds 40 --hitcount 3 
--name BlockdSSH --rsource -j DROP

This registers the IP address in a set of recent module:
# iptables -A BlockdSSH -m recent --set --name BlockdSSH --rsource -j DROP

Any new SSH attempt from that IP address will reset the counter to 10 
days (--update), and also log that packet:
# iptables -A NoJodan -p tcp -m tcp --dport 22 -m recent --update 
--seconds 864000 --name BlockdSSH --rsource -j LOG-BlockdSSH

This creates the set "SSH" containing all SSH connections, regardless 
they are "good" or not:
# iptables -A NoJodan -p tcp -m tcp --dport 22 -m recent --set --name 
SSH --rsource

If the limit is reached, this rule chains to BlockdSSH; that will LOG 
and block any connection from that IP address:
# iptables -A NoJodan -p tcp -m tcp --dport 22 -m recent --update 
--seconds 40 --hitcount 3 --name SSH --rsource -j BlockdSSH

You must create these chains and make all new packets enters into 
NoJodan chain.

For example, the first SSH packet will not match first rule of NoJodan 
because the recent extension hasn't that IP address in the BlockdSSH 
set, so the packet will continue and will not be diverted to 
LOG-BlockdSSH. Second rule will match and the IP address is registered 
in SSH set in recent. Third rule will not match because is the first 
packet and not the third in 40 sec.

Second packet (seconds later) also will not match first NoJodan rule, 
will be registered in the SSH set, and also third rule does not affect him.

Third packet will not match first rule because it isn't registered in 
BlockdSSH. This packet will match the second rule but also the third 
rule in which the limit is 3/40sec. That packet will go to iptables 
BlockdSSH chain. In this chain, that will be registered in the set named 
"BlockdSSH" because it reached the limit (I did choose the same name as 
the iptables chain: BlockdSSH), so now this IP address is the the black 
list and the packet is dropped.

Fourth packet will match the first rule in NoJodan, because this IP 
address was registered in the BlockdSSH set (black list set) in recent 
and will be forwarded to LOG-BlockdSSH chain. In this chain the packet 
is being logged and dropped (first and second rule).

They must wait 10 days or change their IP address to have a respond from 
SSH server.

I don't know why I'm doing that BlockdSSH chain will target to DROP 
instead of LOG-BlockdSSH. Surely these rules may be improved.

You may adapt this idea to your ports and times. Also this may be used 
to block port scanning (modifying LOG chain to not log every packet), 
ping flood, etc.

Regards.


On 16.11.2012 09:52, Dimitri Yioulos wrote:
> Hi, folks.
>
>   A few days ago, a major brute-force attack was launched
> against our (sendmail) mail server. It looks like a bot is
> aiming lots of zombies at us. Here's how OSSEC hids reports
> an attempt from one of the zombies:
>
> OSSEC HIDS Notification.
> 2012 Nov 13 09:08:16
>
> Received From: (plymouth) 192.168.1.2->/var/log/messages
> Rule: 40111 fired (level 10) ->  "Multiple authentication
> failures."
> Portion of the log(s):
>
> Nov 13 09:07:44 plymouth ipop3d[29926]: Login failed
> user=hod auth=hod host=201-93-132-240.dsl.telesp.net.br
> [201.93.132.240]
> Nov 13 09:07:44 plymouth ipop3d[29925]: Login failed
> user=lee auth=lee host=201-93-132-240.dsl.telesp.net.br
> [201.93.132.240]
> ~
> ~
>
> To remediate, I've put fail2ban in place on the mail server,
> and it's working. However, the attacks are still beating at
> the door, and it's significantly increased the load on the
> mail server . I'm now thinking of adding rules to our
> iptables/Netfilter firewall to rate-limit the brute-force
> connections. The rules I'd add are these:
>
> iptables -A INPUT -p tcp --dport 110 -m state --state NEW -m
> recent --set
>
> iptables -A INPUT -p tcp --dport 110 -m state --state NEW -m
> recent --update --seconds 15 --hitcount 3 -j DROP
>
> As the mail server sits in a DMZ, and packets are forwarded
> to it, is the INPUT chain the best place to put these
> rules, or should they go in the FORWARD chain (with
> appropriate modifications)?
>
> Of course, I don't want to stop legitimate mail. Is this the
> best course of action?
>
> Thanks.
>
> Dimitri
>
