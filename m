From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Why is can't my clients use DNS?
Date: Thu, 9 Feb 2006 11:48:17 +0100 (CET)
Message-ID: <56494.193.173.147.3.1139482097.squirrel@webmail.sterenborg.info>
References: <c0e9781f0602090218y2d8cc31dy@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c0e9781f0602090218y2d8cc31dy@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, February 9, 2006 11:18, Greg Cope wrote:
> Hi All,
>
> I have a simple firewall/router.
>
> Behind are a few servers.
>
> I need to be able to;
>
> - Let clients use external dns (does not work)
> - ssh onto firewall (works)
> - NAT packets onto webservers behind firewall (works)
>
> This is a simple problem, but I can't seem to crack it - please can
> someone point out my stupidity;
>
> Some of the rules I have;
>
> ${IPTABLES} -A INPUT -p udp -s ${EXT_DNS_IP} --source-port 53 -d
> ${DMZ_IP_RANGE} -j ACCEPT
> ${IPTABLES} -A INPUT -p udp -s ${EXT_DNS_IP2} --source-port 53 -d
> ${DMZ_IP_RANGE} -j ACCEPT
> ${IPTABLES} -A FORWARD -p udp -s ${EXT_DNS_IP} -d ${DMZ_IP_RANGE}
> --sport 53 -j ACCEPT


I'm sorry, but for me it's not enough information. Are your clients DMZ
servers or real clients ? I think there's some rules missing to evaluate =
it
properly.

For your problem :
> - Let clients use external dns (does not work)

You need to create rules like these (I'll assume your "clients" are DMZ
servers) :
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

$ipt -A FORWARD -m state --state NEW -i <if_dmz> -s <net_dmz> \
  [-d <ip_ext_dns>] -p udp --dport 53 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -i <if_dmz> -s <net_dmz> \
  [-d <ip_ext_dns>] -p tcp --dport 53 -j ACCEPT

$ipt -t nat -A POSTROUTING -o <if_inet> -s <net_dmz> [-d <ip_ext_dns>] \
  -p udp --dport 53 -j SNAT <ip_inet>
$ipt -t nat -A POSTROUTING -o <if_inet> -s <net_dmz> [-d <ip_ext_dns>] \
  -p tcp --dport 53 -j SNAT <ip_inet>


Gr,
Rob



