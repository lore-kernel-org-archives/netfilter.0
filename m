From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: NAT problem
Date: Mon, 6 Oct 2003 18:49:51 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <06ba01c38c0c$8de8b440$2800a8c0@karu>
References: <000001c38c05$923fb680$0f01a8c0@raul02>
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
To: Jose Pascual <jose.pascual@optivamedia.com>, netfilter@lists.netfilter.org

What you are trying to do is not possible with a straight forward
configuration.

You have to get the concept of DNAT right. DNAT only works when the DNAT ip
address is on seperate subnet.

For example,

192.168.0.1 <-> 192.168.0.254 <-> 192.168.1.1

you can DNAT requests coming from 192.168.0.1 to 192.168.0.254 to
192.168.1.1 by doing

/sbin/iptables -t nat -I PREROUTING -s 192.168.0.1 -p tcp --dport www -j
DNAT --to-destination 192.168.1.1

Venkatesh K

----- Original Message ----- 
From: "Jose Pascual" <jose.pascual@optivamedia.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, October 06, 2003 6:00 PM
Subject: NAT problem


> Hi all,
> I am new using iptables and surelly  this wil be an easy and stupid
question
> but perhaps you can help me. I want to understand NAT so I am trying to do
> the following:
>
> I have three computers in my LAN (192.168.1.1; 192.168.1.2 and
192.168.1.3).
> 192.168.1.1 has a web server and I would like to access it through
> 192.168.1.2 with NAT. For example openning my browser in 192.168.1.3 and
> connecting to 192.168.1.2   I  should see the same as if I connected to
> 192.168.1.1 web server directly, so I have done the following in
> 192.168.1.2:
>
>  iptables -t nat -A PREROUTING -p tcp --dport 80 -j
> DNAT --to-destination 192.168.1.1
>
>
>  iptables -t nat -A POSTROUTING -p tcp --sport 80 -j SNAT
> --to-source 192.168.1.2
>
> However it doesn't work. Anyone can help me?
>
> Thanks
>
> Regards
> Jose Pascual
>
>
>
>
>


