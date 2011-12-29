From: Pablo Antonio Costa <pablo.costa@caoamontadora.com.br>
Subject: iptables rules with non-transparent squid proxy
Date: Thu, 29 Dec 2011 11:38:32 +0000
Message-ID: <CF4E8296A16C1A408B28BFFED33EA8B301FEED35@SRVEX1APS.caoamontadora.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,

for squid non-transparent ( ad auth ). how can i set for clientes access??? )

my lines


iptables --policy INPUT DROP
iptables --policy OUTPUT ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A INPUT -s  <client_IP>/32 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s  <client_IP>/32 -p tcp --dport 3128(squid default port) -j ACCEPT
iptables -A INPUT -j DROP

ssh works fine, but squid not ( all rules drops on my last rule "iptables -A INPUT -j DROP" )

Thanks in advance!

At.
PC
