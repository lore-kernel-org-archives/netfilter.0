From: Gianni Pucciani <gp.puccio@tin.it>
Subject: rules don't work!
Date: Tue, 06 Apr 2004 03:53:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40720D9A.6030001@tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
I'm new to the use of iptable. I set this script for my home 
workstation, but when I apply these rules anything stop functioning.
Can anyone give me some help?
Thanks

PS Comment are italian, but hope rules be quite clear...


#!/bin/sh
#G.P
#last update 050404
#Script di inizializzazione per settare un insieme di regole
#di packet filtering tramite iptables.

#definire le policy (comportamento di default)per le catene di default
/sbin/iptables -P INPUT DROP #ogni pacchetto in ingresso scartato
/sbin/iptables -P OUTPUT DROP #ogni pacchetto in uscita accettato
/sbin/iptables -P FORWARD DROP #ogni pacchetto di passaggio scartato

#flush di tutte le catene
/sbin/iptables --flush

#elimina le catene
/sbin/iptables -X miacatenain
/sbin/iptables -X miacatenaout


#creare una nuova catena
/sbin/iptables -N miacatenain
/sbin/iptables -N miacatenaout

#aggiungere una regola a INPUT e OUTPUT per passare
#dalle regole appena definite. Ogni pacchetto fa match e passa
#alla catena 'miacatena' corrispondente
/sbin/iptables -A INPUT -j miacatenain
/sbin/iptables -A OUTPUT -j miacatenaout

#######aggiungere le regole alla catena di ingresso#########

#ICMP
#Consentire traffico icmp
/sbin/iptables -A miacatenain -p icmp -j ACCEPT

#CUPS
#Consentire traffico cups in ingresso
/sbin/iptables -A miacatenain -p tcp --dport 632 -j ACCEPT
/sbin/iptables -A miacatenain -p udp --dport 632 -j ACCEPT


##EDONKEY
#Consentire traffico tcp alla porta 4663
/sbin/iptables -A miacatenain -p tcp --dport 4663 -j ACCEPT
/sbin/iptables -A miacatenain -p udp --dport 4663 -j ACCEPT

#SSH
#Consentire traffico ssh in ingresso

/sbin/iptables -A miacatenain -p tcp --dport 22 -j ACCEPT
/sbin/iptables -A miacatenain -p udp --dport 22 -j ACCEPT

#TOMCAT
#Consentire traffico web in ingresso x Tomcat da ufficio
/sbin/iptables -A miacatenain -p tcp --dport 8080 -d 192.168.1.2 -s 
131.114.136.26 -j ACCEPT

#Consentire traffico web in ingresso x Tomcat da rete locale
/sbin/iptables -A miacatenain -p tcp --dport 8080 -d 192.168.1.2 -s 
192.168.1.0/255.255.255.0 -j ACCEPT

#LOOPBACK
#Consentire tutto il traffico tramite l'interfaccia di loopback
#/sbin/iptables -A miacatenain -i lo -j ACCEPT

#######aggiungere le regole alla catena di uscita#######

#Consentire connessioni ftp in ingresso
#/sbin/iptables -A miacatena -p tcp --dport 2020 e 21 in uscita
#/sbin/iptables -A miacatena -p tcp --dport

##EDONKEY
#Consentire traffico tcp alla porta 4663
/sbin/iptables -A miacatenaout -p tcp --dport 4663 -j ACCEPT
/sbin/iptables -A miacatenaout -p udp --dport 4663 -j ACCEPT

#DNS
#Consentire traffico dns in uscita
/sbin/iptables -A miacatenaout -p tcp --dport 53 -j ACCEPT
/sbin/iptables -A miacatenaout -p udp --dport 53 -j ACCEPT

#SMTP POP3
#Consentire traffico smtp
/sbin/iptables -A miacatenaout -p tcp --dport 25 -j ACCEPT
/sbin/iptables -A miacatenaout -p tcp --dport 110 -j ACCEPT

#SSH
#Consentire traffico SSH in uscita
/sbin/iptables -A miacatenaout -p tcp --dport 22 -j ACCEPT
/sbin/iptables -A miacatenaout -p udp --dport 22 -j ACCEPT

#WEB
#Consentire traffico web in uscita
/sbin/iptables -A miacatenaout -p tcp --dport 80 -j ACCEPT

#LOOPBACK
#Consentire tutto il traffico tramite l'interfaccia di loopback
#/sbin/iptables -A miacatenain -i lo -j ACCEPT


#########applica le modifiche#########
/sbin/service iptables save

/sbin/service iptables restart

