From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 10:38:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40557989.2080306@stupar.homelinux.net>
References: <40556EE6.6040809@stupar.homelinux.net> <200403150907.28211.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403150907.28211.Antony@Soft-Solutions.co.uk>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

Antony Stone pravi:

> On Monday 15 March 2004 8:52 am, Sasa Stupar wrote:
> 
> 
>>Hi!
>>
>>I have configure a transparent proxy and it is working fine. But now all
>>requests to squid came from my nat box and I can't use my MAC acl
>>anymore. Is there any option to provide to squid who is connecting and
>>not the nat box which is used for transparency?
> 
> 
> If you really mean MAC address based ACL, then no, you cannot use this to 
> identify clients any more, because all the packets will be coming from the 
> netfilter machine, so that is the only MAC address your proxy will know 
> about.
> 
> If you actually mean source IP address based ACL, then you need to check your 
> SNAT rule in the POSTROUTING chain of netfilter - make sure it is only 
> applied to your external interface, not the interface where your proxy server 
> is connected.
> 
> If you have a more complicated network setup than I am assuming, please supply 
> a description or a diagram.
> 
> Regards,
> 
> Antony.
> 

Yes, I ahve ment source IP bassed, sorry my mistake. Anyway here is my 
config for trasparent proxy:
-------------------
$IPT -t nat -A PREROUTING -i $INIF -s ! 192.168.10.10 -p tcp --dport 80 
-j DNAT --to 192.168.10.10:3128
$IPT -t nat -A POSTROUTING -o $INIF -s $INNET -d 192.168.10.10 -j SNAT 
--to 192.168.10.111
$IPT -A FORWARD -s $INNET -d 192.168.10.10 -i $INIF -o $INIF -p tcp 
--dport 3128 -j ACCEPT
-------------------
Description:
192.168.10.10 is proxy server
192.168.10.111 is netfilter machine
INIF=192.168.10.111
INNET=192.168.10.0/24

Is there something to add or change here?

Regards,
Sasa

