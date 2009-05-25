From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 16:57:20 +0200
Message-ID: <20090525165720.39188eb5@catlap>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	<20090525141321.0b41719e@catlap>
	<3e7107590905250529o686b331do322e7e5b8849478b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e7107590905250529o686b331do322e7e5b8849478b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eduardo Sachs <edu.sachs@gmail.com>
Cc: netfilter@vger.kernel.org

>Could have a Virtual IP for sending the requests to the two firewalls.
>Could have a ldirectord for gateways. Remember that the ldirectord is
>"load balance" only for ports TCP/UDP.

So you use third box. Solution I presented allows you to do
load-balancing on routers alone. Without ldirector.

>> You can use keepalived [1] to have two virtual gateway IP addresses
>> on the network - GW1 and GW2. Assign half of the clients staticly to
>> GW1,
>>...
>How would I disclose two gateways in the network if I have only one
>DHCP? Could create VLANs. Correct?

Vlans are not required. You can define more then one router-gateway on
one ethernet segment in dhcp server, example from one of my boxes:

shared-network seg1{

  subnet 10.32.0.0 netmask 255.255.254.0 {
   option subnet-mask 255.255.254.0;
   option broadcast-address 10.32.1.255;
   option routers 10.32.1.254;   <---- first gateway definition

   range 10.32.1.128 10.32.1.191;
   }


  subnet xx.xx.177.0 netmask 255.255.255.224 {
   option subnet-mask 255.255.255.224;
   option broadcast-address xx.xx.177.31;
   option routers xx.xx.177.30; <---- second gateway definition
   }
}

Cheers,
Marek Kierdelewicz
