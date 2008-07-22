From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: More ethernet port same ip address
Date: Tue, 22 Jul 2008 16:03:10 +0300
Message-ID: <38db14850807220603p15221841g4fcfb72a2d91ddf0@mail.gmail.com>
References: <48819901.6030604@unipex.it> <4884D160.7060701@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=PFtOa5/zpaPH/xAh/olOWJTVK3LhE7I11UeWAlrhfrY=;
        b=cljSgmtw0zmRI3+KsXff2lQYdJrVZrmTQ19dEvpTy7CKpzzl3/j+lidbcLPFDWbpZJ
         IWsbj1vd4nwI8OrZCjVA8So61+DRV3QCmDyEmpi2nTWN+e1CogMtjGubB/okZ5Pec2To
         2TfMfV6A1mikNZG3nOMZNUII79rkEt1J0PrU8=
In-Reply-To: <4884D160.7060701@unipex.it>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have just now the next working configuration:

pc1->switch_access_port_vlan17->
   ->  (vlan17)(172.19.0.20)

->switch_Trunk_port_for_vlan17_vlan18
pc2->switch_access_port_vlan18->
   -> (vlan18)(172.19.0.20)

arp_proxy is set on.
Also you need to set up forwarding:
echo 1 > /proc/sys/net/ipv4/ip_forward

+ I recommend to clear firewall rules for testing purpose:
iptables -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

2008/7/21, Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>:
>
> pc1 <--> | vlan5 ------------- stp| <->  |stp ----------- stp| vlan 5<-> srv
> port 1
> pc2 <--> | vlan6 -switch1-  stp| <-> |stp switch2 stp| vlan 6<-> srv port 2
> pc3 <--> | vlan7 ------------- stp| <->  |stp ----------- stp| vlan 7<-> srv
> port 3
>
> Here, for make the communication working, I have to setup the three
> vlan(s) on the server port's, but they must have the same address.
> And, with the "bridge" solution I think that I cannot.


-- 
Best regards
Anatoly Muliarski
