From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT problem with iptables...
Date: Wed, 11 Sep 2002 18:40:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911174019.UNZH287.mta02-svc.ntlworld.com@there>
References: <3D7F567F.3437E5C7@itdimensions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7F567F.3437E5C7@itdimensions.com>
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

On Wednesday 11 September 2002 3:43 pm, Marian Stepka wrote:

> Hi Guys;
>
> I'm fighthing almost second day with NAT problem. I need to translate
> local IP to 'normal' Inet IPs. I set up one box which have two NIC
> cards. One side is connected to local LAN with IP 192.168.0.x and other
> side is connected to 'copy' of firewall which is used in production. I
> would like to simulate situation as on Inet. I don't want to change IP
> of firewall which I would like to debug. I need to setup iptables on
> linux translating box as follows:
>
> 192.168.0.230 <-> 64.124.175.104
> 192.168.0.231 <-> 64.124.175.105
> 192.168.0.232 <-> 208.184.248.9

iptables -A PREROUTING -t nat -d 192.168.0.230 -j DNAT --to 64.124.175.104
iptables -A PREROUTING -t nat -d 192.168.0.231 -j DNAT --to 64.124.175.105
iptables -A PREROUTING -t nat -d 192.168.0.232 -j DNAT --to 208.184.248.9
iptables -A POSTROUTING -t nat -s 64.124.175.104 -j SNAT --to 192.168.0.230
iptables -A POSTROUTING -t nat -s 64.124.175.105 -j SNAT --to 192.168.0.231
iptables -A POSTROUTING -t nat -s 208.184.248.9 -j SNAT --to 192.168.0.232

plus the appropriate FORWARDing rules for whatever protocols you want to 
allow to/from these addresses.

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

