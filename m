From: "Michael K" <micke@klintan.se>
Subject: RE: host names and IPs
Date: Tue, 22 Apr 2003 22:11:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3090b$6b472220$0200a8c0@klintan.local>
References: <b83p7i$tg8$1@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <b83p7i$tg8$1@gatekeeper.tmr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

What you could do is to create a crontab with the following bash script

--start---
#!/bin/bash
NEWIP=`host klintan.cjb.net | awk '{print $4}'`

if [ -f /etc/current_ip ]
then
        OLDIP=`cat /etc/current_ip`
else
        # 1st time run
        OLDIP="255.255.255.255/32"
fi

if [ "$NEWIP" != "$OLDIP" ]
then
        RULENUM=`iptables -L INPUT --line-numbers | grep "$OLDIP" | grep
"tcp dpt:domain" | awk '{print $1'}`
        if [ -z "$RULENUM" ]
        then
                iptables -A INPUT -p tcp -s $NEWIP --dport 53 -j ACCEPT
        else
                iptables -R INPUT $RULENUM -p tcp -s $NEWIP --dport 53
-j ACCEPT
        fi
        echo $NEWIP > /etc/current_ip
fi
--end---

But I'm sure that there are other (and better) ways

/Klintan

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> bill davidsen
> Sent: Tuesday, April 22, 2003 6:05 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: host names and IPs
> 
> 
> In article <003301c305a1$c04ab1a0$0500a8c0@effenberger>,
> Florian Effenberger <floeff@arcor.de> wrote:
> 
> | I'm on Linux 2.4.20 with iptables 1.2.7a. I have a syntax 
> as follows:
> | 
> | ===
> | iptables -A INPUT -p tcp -s www.myhostname.com --dport 53 -j ACCEPT 
> | ===
> 
> What is it you're trying to do here? A packet with your 
> source address would be going through the OUTPUT table, no? 
> An INPUT packet with your own IP would be spoofed. Are you 
> trying to accept DNS requests from yourself, in tcp (instead 
> of normal udp) mode?
> 
> | Now it seems that www.myhostname.com is resolved only the 
> first time 
> | the rule is set and that a fixed IP address is stored.
> | 
> | However, www.myhostname.com has a dynamically assigned 
> address and I 
> | would like to have iptables resolve the IP address everytime.
> | 
> | Is that possible? If yes, how? Or will it produce too much load?
> 
> There are several ways to re-resolve it, but I'm not clear on 
> why you don't just specify by interface.
> 
> How about some clarification on what you're trying to do, 
> rather than how you want to do it?
> -- 
> bill davidsen <davidsen@tmr.com>
>   CTO, TMR Associates, Inc
> Doing interesting things with little computers since 1979.
> 
> 



