From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 11:51:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40558A9E.4040202@stupar.homelinux.net>
References: <40556EE6.6040809@stupar.homelinux.net> <200403150907.28211.Antony@Soft-Solutions.co.uk> <40557989.2080306@stupar.homelinux.net> <200403151036.00538.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403151036.00538.Antony@Soft-Solutions.co.uk>
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

> On Monday 15 March 2004 9:38 am, Sasa Stupar wrote:
> 
> 
>>Antony Stone pravi:
>>
>>>If you actually mean source IP address based ACL, then you need to check
>>>your SNAT rule in the POSTROUTING chain of netfilter - make sure it is
>>>only applied to your external interface, not the interface where your
>>>proxy server is connected.
>>
>>Yes, I ahve ment source IP bassed, sorry my mistake. Anyway here is my
>>config for trasparent proxy:
>>-------------------
>>$IPT -t nat -A PREROUTING -i $INIF -s ! 192.168.10.10 -p tcp --dport 80
>>-j DNAT --to 192.168.10.10:3128
>>$IPT -t nat -A POSTROUTING -o $INIF -s $INNET -d 192.168.10.10 -j SNAT
>>--to 192.168.10.111
>>$IPT -A FORWARD -s $INNET -d 192.168.10.10 -i $INIF -o $INIF -p tcp
>>--dport 3128 -j ACCEPT
>>-------------------
>>Description:
>>192.168.10.10 is proxy server
>>192.168.10.111 is netfilter machine
>>INIF=192.168.10.111
>>INNET=192.168.10.0/24
>>
>>Is there something to add or change here?
> 
> 
> Yes.   Remove the POSTROUTING rule, because it is specifically changing the 
> source address of all packets sent to the proxy server to be that of the 
> firewall.
> 
> Regards,
> 
> Antony.
> 

Not good. Now my transparent proxy doesn't work anymore. :(
What's the catch?

Regards,
Sasa

PS: sorry Antony for sending directly to you but this list doesn't 
automatically put the list address when replying. Maybe something for 
moderators to configure.

