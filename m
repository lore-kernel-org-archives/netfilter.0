From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: Re: Firewall L7
Date: Thu, 19 Apr 2007 15:15:17 -0300
Message-ID: <3da957060704191115v62303fdh838beab7328ed331@mail.gmail.com>
References: <3da957060704180538m12ec86edr2536867007a8d05@mail.gmail.com>
	<462612C7.3090504@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=PO7w39WG+UjHsgK0Eetzj6fPVGRTqS3eADMzZ9PemgXKPZWxPhJv6AYSkhB+9zx+L+C/RSLVgjhj0qhBftPHDua6dMc9vmWI2foYzPFTHcIQH5fIZrvLiE/Y0lCD0sTLRoVJIynNofGez5aaDXtyGvEMBfZn6mLersqkOm33dfQ=
In-Reply-To: <462612C7.3090504@solutti.com.br>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

My rulez....

## Limpando as regras do IPTABLES
iptables -F
iptables -t nat -F
iptables -t mangle -F

## Ativando repasse de pacotes ##
echo 1 > /proc/sys/net/ipv4/ip_forward

## instalando modulos do IPTABLES ##
modprobe iptable_nat
modprobe ip_nat_ftp
modprobe ip_conntrack
modprobe ipt_conntrack
modprobe ip_conntrack_ftp
modprobe ip_tables
modprobe ipt_LOG
modprobe ipt_limit
modprobe ipt_REJECT
modprobe ipt_layer7

# Criando NAT para toda a rede.
#iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE

## Ativando regras do Layer 7
# Bloqueando de skype para skype
iptables -A FORWARD -m layer7 --l7proto skypetoskype -j DROP

# Bloqueando o Skypeout
iptables -A FORWARD -m layer7 --l7proto skypeout -j DROP

# Bloqueando o Messenger
#iptables -A FORWARD -m layer7 --l7proto msnmessenger -j DROP
#iptables -A PREROUTING -m layer7 --l7proto msnmessenger -j DROP
iptables -t filter -A FORWARD -m layer7 --l7proto msnmessenger -j DROP

#Bloqueando o Goddamn ORKUT por string usando o Algoritmo bm (pode-se
usar o km tambem)
iptables -t filter -A FORWARD -m string --string "orkut" -j DROP --algo bm

#Bloquendo torrents
iptables -t filter -A FORWARD -m layer7 --l7proto bittorrent -j DROP

# Mudando para Statefull
#iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


These rules are blockin' gmail, hotmail and my mail server.....
But its just a few rulez....
Some wrong?

Cheers

Stephan

-- 
---------------------------------------------------------------------
Stephan Higuti
MSN: higutisam@hotmail.com
Email: higuti.sam@gmail.com
---------------------------------------------------------------------

