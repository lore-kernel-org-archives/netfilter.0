From: "IT Clown" <iptables@mailbox.co.za>
Subject: Re: passive ftp
Date: Sat, 17 Apr 2004 20:18:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-287954911@mail01.infosat.net>
References: <web-287943006@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-287943006@mail01.infosat.net>
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

Sorry i left out something about the following rule:
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 20 -j ACCEPT
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 21 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

When i set the rule i can connect to passive mode ftp
servers but when it needs to list the contents of the ftp
server it will list nothing or i will get disc from the ftp
server.



On Sat, 17 Apr 2004 19:50:35 +0200
 "IT Clown" <iptables@mailbox.co.za> wrote:
> Hi 
> 
> I am having some trouble to access passive mode ftp
> sites.I
> have a firewall with ip forwarding enabled.When a pc on
> the
> network want to access passive ftp servers i need to do
> the
> following in my rules ( on the server ):
> 
> -A OUTPUT -p tcp -m multiport --dport 21,20 -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth0 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> But i do not want every query to be forwarded i only want
> say ftp access to be forwarded. Why does the following
> not
> work ( on the server ):
> 
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 20 -j ACCEPT
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 21 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> Regards
>
______________________________________________________________
> Herbalife Independent Distributor
> http://www.healthiest.co.za
> 

______________________________________________________________
Herbalife Independent Distributor http://www.healthiest.co.za

