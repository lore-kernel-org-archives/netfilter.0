From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect back to internal network
Date: Fri, 07 Nov 2008 14:51:46 -0600
Message-ID: <4914AA62.30000@riverviewtech.net>
References: <ebccda510811070906s62a2619di8a8d54dc4b3b9f9e@mail.gmail.com>	 <491490E0.7080701@riverviewtech.net> <ebccda510811071202n32907e65r296ad9a281aa3b3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ebccda510811071202n32907e65r296ad9a281aa3b3d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/07/08 14:02, Henrique Netfilter wrote:
> It actually worked, but only when I also added my PREROUTING DNAT 
> rule. So the final solution is like this:

*nod*

You have to have both the PREROUTING rule to DNAT the traffic to the new 
destination /and/ the POSTROUTING rule to cause the destination to send 
the reply traffic back through your router.

> iptables -t nat -I PREROUTING -i <internal_network_interface> -d 
> <Internet_Address> -j DNAT --to <Internal_Server_Address>
> 
> iptables -t nat -I POSTROUTING -o <internal_network_interface> -s 
> <LAN_address> -d <Internal_Server_Address> -j SNAT --to 
> <internal_network_IP>
> 
> Thanks once again.

You are welcome.

I'm glad that it worked the way that you needed it to.  :)



Grant. . . .
