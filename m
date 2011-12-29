From: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Subject: Re: iptables rules with non-transparent squid proxy
Date: Thu, 29 Dec 2011 09:54:41 -0200 (BRST)
Message-ID: <1290077511.173.1325159681096.JavaMail.root@mercurio.contatogs.com.br>
References: <CF4E8296A16C1A408B28BFFED33EA8B301FEED35@SRVEX1APS.caoamontadora.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CF4E8296A16C1A408B28BFFED33EA8B301FEED35@SRVEX1APS.caoamontadora.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Mensagem original -----
> De: "Pablo Antonio Costa" <pablo.costa@caoamontadora.com.br>
> Para: netfilter@vger.kernel.org
> Enviadas: Quinta-feira, 29 de Dezembro de 2011 9:38:32
> Assunto: iptables rules with non-transparent squid proxy
> Hi all,

Hi Pablo

 
> for squid non-transparent ( ad auth ). how can i set for clientes
> access??? )
> 
> my lines
> 
> 
> iptables --policy INPUT DROP
> iptables --policy OUTPUT ACCEPT
> 
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> iptables -A INPUT -s <client_IP>/32 -p tcp --dport 22 -j ACCEPT
> iptables -A INPUT -s <client_IP>/32 -p tcp --dport 3128(squid default
> port) -j ACCEPT
> iptables -A INPUT -j DROP 

( this last rule is not necessary)

> 
> ssh works fine, but squid not ( all rules drops on my last rule
> "iptables -A INPUT -j DROP" )

as you are not using statefull firewall, you must think about INPUT+OUTPUT

you should insert a rule like this:

iptables -A INPUT -i ethx ( your wan interface) -p tcp -m multiport --sport 21,80,443 -j ACCEPT

BTW please read tnis doc:
http://www.frozentux.net/documents/iptables-tutorial/

it's the best document that i have already read about iptables...80)

best regards

> 
> Thanks in advance!
> 
> At.
> PC
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

-- 
Paulo Ricardo Bruck
Consultor Linux
cel 011 9235-4327 tel 011 3596-4881/4882
http://www.contatogs.com.br
