From: Rahul Jadhav <rahul@iatp.org>
Subject: Re: DNAT problem
Date: Thu, 21 Nov 2002 15:53:11 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDD55C7.9070200@iatp.org>
References: <000701c28fa2$bcbef3e0$0402a8c0@ftp.pricol.co.in>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: HCLFM <hclfm@pricol.co.in>
Cc: netfilter@lists.netfilter.org

HCLFM wrote:

> Hi,
>
> I have Redhat Linux 7.1 Kernel version 2.4.2-2.
> with iptables v1.2.7 .
>
> This nat module is loaded with ip_tables module
> iptable_nat 16160 0 (autoclean) [ipt_MASQUERADE]
>
> I'm trying to setup DNAT for port forwarding as per iptables documents 
> . I have ip forwarding enabled. I want port forward from external 
> interface to a internal server .
>
> But the setup is not working , I have tried with all possible styles 
> of PREROUTING chain.
> When I connect to external IP address with the particular port , I get 
> a "connection refused" error. But the software port forwarders work 
> perfectly. I feel that the problem lies in proxy ARP support of the 
> kernel.
>
> Any suggestions ?
>
> regards,
> U.SivaKumar

This may not exactly be your problem...
I had a similar problem and I found that the router wasn't forwarding 
traffic to the firewall machine. Check your router config to see if the 
traffic is getting thru to it.
goodluck!
Rahul

-- 
         __  __     __   __	
        /_/ /_ \  _/ /  /  \	Institute for Agriculture
       __  __/ / \  _/ / / /	and Trade Policy
      / / /   /  / /  / __/	2105 First Ave S
     / / / / /  / /_ / /	Minneapolis MN 55404
     \/  \__/   \__/ \/		http://www.iatp.org

       I N F O R M A T I O N   T E C H N O L O G Y

The best things in life are done by people with nowhere to turn.
                                -The Blind Assassin (Margaret Atwood)




