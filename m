From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Problems with policy based routing
Date: Fri, 16 May 2003 13:33:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030516133353.21233a21.arnt@c2i.net>
References: <000147C2.3EC4D93D@192.168.206.251>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000147C2.3EC4D93D@192.168.206.251>
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

On 16 May 2003 10:27:47 UT, 
<rwaeger@m-logix.de> wrote in message 
<000147C2.3EC4D93D@192.168.206.251>:

> Hi!
> 
> Maybe a routing and iptables guru can help me....
> 
> We're trying to setup a policy based Linux router to route "normal" 
> services (like http(s) or ftp) over a DSL line and all other services
> (like smtp, ssh, pop3) over a leased line. The leased line router is 
> listening to an official IP net. There are some internal servers (mail
> and web) which are using official IPs (but nated at Firewall-1). All 
> traffic for and from these servers have to go over eth1. 
> 

..you checked out 'ip rule help'?

[arnt@lana arnt]$ /sbin/ip rule help
Usage: ip rule [ list | add | del ] SELECTOR ACTION
SELECTOR := [ from PREFIX ] [ to PREFIX ] [ tos TOS ] [ fwmark FWMARK ]
            [ dev STRING ] [ pref NUMBER ]
ACTION := [ table TABLE_ID ] [ nat ADDRESS ]
          [ prohibit | reject | unreachable ]
          [ realms [SRCREALM/]DSTREALM ]
TABLE_ID := [ local | main | default | NUMBER ]



-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



