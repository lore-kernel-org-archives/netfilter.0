From: "Carlo Florendo" <carlo@hq.astra.ph>
Subject: Re: Help Required
Date: Thu, 31 Jul 2003 08:34:07 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c001c356fb$73d64c70$200aa8c0@thorin>
References: <20030730093120.M51327@vfmindia.biz>
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
Content-Type: text/plain; charset="us-ascii"
To: Sridhar Murthy <sridhar@vfmindia.biz>, netfilter@lists.netfilter.org

Hello,

> From: "Sridhar Murthy" 
> Hi Team,
> 
> I require help to my following setup:
> 
> I have a Redhat 8 Server with squid,smtp & pop3 with iptables running.
> 
> My requirement is we have a citrix server with local LAN ipaddress. People 
> from Internet will have to access this server from outside(my firewall is 
> having a public ipaddress which is dynamic assigned). I want to know what is 
> the rules that i have to add to allow the traffic which uses port number 
> 1494, to get into my network and access my citrix server which is having LAN 
> ip. Should any nat be added.
> 

Yes.  You need to do a DNAT.  

iptables -t nat --insert PREROUTING -i <external_interface> -p tcp --dport  1494 -j DNAT --to  <citrix_ip_address>
iptables --insert FORWARD -p tcp -i <external_interface> -d <citrix_ip_address> --dport 1494 -j ACCEPT

> Thanks in advance.
> 
> Regards,
> 
> Sridhar
> 


Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
URL: http://www.hq.astra.ph/resources



