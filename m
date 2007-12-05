From: jamr <jamr@7lan.net>
Subject: nat rules for 2 networks
Date: Wed, 05 Dec 2007 15:59:04 -0200
Message-ID: <1196877545.5936.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi list,
        
        I'm having problens regarding iptables using 2 different
        networks:
        
        In my interfaces I have:
        
        eth0 -> 10.6.6.0/255.255.255.0
        eth0:0 -> 192.168.7.0/255.255.255.0
        
        Sometimes, the workstations behind the nat firewall loses
        connection to
        some sites. The problem seems to stop when the user reboot his
        machine
        or I disable the transparent proxy rule.
        
        I don't know if there is any sysctl atribute to change for
        this...
        here are my rules:
        
        iptables -A PREROUTING -t nat -p tcp -d xxx.dyndns.info --dport
        2121 -j
        DNAT --to 10.6.6.1:22
        
        #bloqueio msn
        iptables -A FORWARD -p tcp -s 10.6.6.199 --dport 1800:1899 -j
        ACCEPT
        iptables -A FORWARD -p tcp -s 10.6.6.242 --dport 1800:1899 -j
        ACCEPT
        iptables -A FORWARD -p tcp --dport 1800:1899 -j REJECT
        
        # regras de nat
        iptables -t nat -A POSTROUTING -s 0/0 -j MASQUERADE
        
        #iptables -t nat -A POSTROUTING -s 10.6.6.0/255.255.255.0 -j
        MASQUERADE
        
        iptables -A FORWARD -s 10.6.6.0/255.255.255.0 -j ACCEPT
        iptables -A FORWARD -d 10.6.6.0/255.255.255.0 -m state --state
        RELATED,ESTABLISHED -j ACCEPT
        
        iptables -A FORWARD -s 192.168.7.0/255.255.255.0 -j ACCEPT
        iptables -A FORWARD -d 192.168.7.0/255.255.255.0 -m state
        --state
        RELATED,ESTABLISHED -j ACCEPT
        
        # liberacao de portas no servidor lapaz.poa.chipsat.com.br
        
        iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
        iptables -A INPUT -p tcp -m tcp --dport 4143 -j ACCEPT
        #iptables -A INPUT -p tcp -m tcp --dport 3128 -j ACCEPT
        
        # libera interfaces desejadas e bloqueia o resto tudo.
        
        iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j
        ACCEPT
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A INPUT -i eth0 -j ACCEPT
        iptables -A INPUT -p tcp -j REJECT --reject-with
        icmp-proto-unreachable
        
        
        # forca navegacao pelo proxy
        
        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
        REDIRECT
        --to-port 3128
        
        I'm runing SLES 10.
        
        Thanks in advance,
        
        Joao Reis

