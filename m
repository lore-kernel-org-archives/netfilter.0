From: "Jose Luis Hime" <jhime@synchro.com.br>
Subject: RE: Problems with NAT
Date: Thu, 29 May 2003 14:15:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c32605$dea23450$010319ac@jhime>
References: <1054223719.13048.37.camel@raylinux.internal>
Reply-To: <jhime@synchro.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054223719.13048.37.camel@raylinux.internal>
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
To: 'Ray Leach' <raymondl@knowledgefactory.co.za>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

The problem is that there are LAN C, LAN D and LAN E in other 3 cities,
also! So, the rule:

-t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to Firewall_IP_address

would work for LAN B, but not for the other LANs.

All LANs are connected to the same router.

Thanks again,
Jose Hime


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
Sent: Thursday, May 29, 2003 12:55 PM
To: Netfilter Mailing List
Subject: Re: Problems with NAT


On Thu, 2003-05-29 at 17:15, Jose Luis Hime wrote:
> Dear all:
> 
> I have the following network:
>               :
>               :    /---------\
> /-------\  Leased  | Router  |  Leased  /----------\
> | LAN B |----------| without |----------| Internet |
> \-------/  Line 1  | NAT     |  Line 2  \----------/
>               :    \---------/
>               :         |
>               :         |
>               :   /----------\
>               :   | Firewall |      /-------\
>               :   | Linux    |------| LAN A |
>               :   | with NAT |      \-------/
>               :   \----------/
>               :
>    CITY "B"   :     CITY "A"
> 
> 1. The router, the firewall and LAN A are in city "A"
> 2. LAN B is in another city (city "B")
> 3. LAN A must access the internet, LAN B must not;
> 4. Unfortunately my router does not support NAT;
> 5. Both the router and the linux firewall have real internet IP addresses;
> 6. So:
>    - The linux firewall must NAT packets from LAN A to the internet;
>    - The linux firewall must not NAT packets from LAN A to LAN B;
> 
> I created rules in table "filter" allowing communication between LAN A and
> LAN B:
>    -t filter -A INPUT   -s LAN A -d LAN B -j ACCEPT
>    -t filter -A INPUT   -s LAN B -d LAN A -j ACCEPT
>    -t filter -A FORWARD -s LAN A -d LAN B -j ACCEPT
>    -t filter -A FORWARD -s LAN B -d LAN A -j ACCEPT
> 
> After that, I created one rule in table "nat" in order to allow LAN A
> accessing the internet:
>    -t nat -A POSTROUTING -s LAN A -d 0/0 -j SNAT --to Firewall_IP_address
> 
> The problem is that LAN A is making NAT to LAN B.
> 
> Is there a way to prevent the firewall from NATing from LAN A to LAN B? The
> problem is that both traffics (LAN A->internet and LAN A->LAN B) are going
> through the same interface...
> 
Sure, change your nat rule:
  -t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to
Firewall_IP_address

> With ipchains, after reaching the INPUT and FORWARD rules the firewall
> would stop and would not reach the NAT rules. This behavior changed in
> iptables and it always check both tables (filter and nat).
> 
> Thanks in advance,
> Jose Hime
-- 
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--


