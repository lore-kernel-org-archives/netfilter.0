From: Indrek Paas <indrekpaas@gmail.com>
Subject: Iptables and voip (sip) traffic
Date: Fri, 9 Apr 2010 16:53:05 +0300
Message-ID: <o2m596a60ad1004090653r8d00d435wfa96256b847dece8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=V5gGF98Fup5FZdc1ALadx0uz5kIiDjQ9nDrzsifviZ4=;
        b=OYv4DVmA/ppLUPkx47W7wFkFOtZnfSCojw53OxC4P+9M5Yhsf0KjnCA7QWFSHHbjer
         pAV7ym5kIGs7TjpuND4OCV1b2EwbwTUTI9DJSdAJXNxYH9RBtsKxRdFzgQ8vA+zvMmAr
         fSXvwAx5KPBF2TKp1JLrLeOpZrpfXVlei4wCM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have searched information about iptables and Sip protocol used for
Voip calls. I remember that this particular protocol had problems
passing firewalls which were configured to use NAT. I have found small
articles and posts with suggestions to rules but these have not been
helpful and I am at a loss. The basic idea is this.

Internet -- Linux firewall -- lan -- "Voip adapter" also "eth0 - ext"
and "eth1 - int"

Voip adapter has static ip address and I used these rules to forward
the traffic to port 5060. And for some reason calls are either silent
or the phone cannot be reached.

IPTABLES -t nat -A PREROUTING  -p tcp -m tcp   -d "ext.ip.addr"
--dport 5060 -j DNAT --to-destination "Voip_adapter_int_ip":5060
IPTABLES -t nat -A POSTROUTING -o eth1 -p tcp -m tcp   -d
"Voip_adapter_int_ip" --dport 5060 -j SNAT --to-source "ext.ip.addr"

IPTABLES -N RULE_SIP5060
IPTABLES -A OUTPUT -p tcp -m tcp -d "Voip_adapter_int_ip" --dport 5060
 -m state --state ESTABLISHED,RELATED  -j RULE_SIP5060
IPTABLES -A OUTPUT -p udp -m udp -d "Voip_adapter_int_ip" --dport 5060
 -m state --state ESTABLISHED,RELATED  -j RULE_SIP5060
IPTABLES -A FORWARD -p tcp -m tcp -d "Voip_adapter_int_ip"  --dport
5060  -m state --state ESTABLISHED,RELATED  -j RULE_SIP5060
IPTABLES -A FORWARD -p udp -m udp -d "Voip_adapter_int_ip"  --dport
5060  -m state --state ESTABLISHED,RELATED  -j RULE_SIP5060
IPTABLES -A RULE_SIP5060 -j LOG  --log-level 4 --log-prefix "RULE
SIP5060 -- ACCEPT "
IPTABLES -A RULE_SIP5060  -j ACCEPT

Also have tried these rules which can be found on various sites.

IPTABLES -A FORWARD -o eth0 -p udp --dport 5060 -j ACCEPT
IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source "ext.ip.addr"

And voip service provider claims that the Linux router should be
switched to their Thompson device. Because iptables "interferes with
their service". So any help and information is greatly appreciated.

Sincerely,

Indrek Paas
