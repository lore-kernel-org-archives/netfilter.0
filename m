From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Trying to connect 172.31.0.0/21 on 2 different networks through
 iptables
Date: Wed, 05 Mar 2008 16:42:05 -0600
Message-ID: <47CF21BD.9030705@riverviewtech.net>
References: <8fb205ea0803041917o50cf3cbl814eb5f011fc9c72@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8fb205ea0803041917o50cf3cbl814eb5f011fc9c72@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/04/08 21:17, Rich wrote:
> MY side gateway county side
> 
> 172.31.0.0/21 eth0 172.31.5.240 main ip network is 10.0.0.0/128 with 
> a 192.168.14.1 interface to my eth1
> 
> eth1 192.168.14.12

Will you please clarify what your set up is.  I think you were trying to 
portray that your side of the gateway has an IP address of 
172.31.5.240/21 and the county side of the gateway has an IP address of 
192.168.14.1 or 192.168.14.12 (unknown subnet).  What is the 
10.0.0.0/128?  Should the /128 have really been a /25?

> This has been working great with no problems. I have been linking to 
> 2 servers on their side. A Novell and a Lotus Notes Server and they 
> have been link to our Novell and Lotus notes servers.

*nod*  This is as I would expect.

> Now here is the dilemma.
> 
> The county has decided to consolidate our IT operations. We will be 
> consolidating our Notes and Novell servers and consolidating our 
> workstations onto their physical network. We decided in our planning 
> that we would keep our 172.31.0.0/21 ip scheme. So we have brought in 
> new switches and router running parallel to the old ones. They come 
> into our buildings and link back to the county network. The new 
> infrastructure in no way physically touches our existing network. All 
> the traffic goes to the county network. There are vlans setup with no 
> problem.

Ok...

> This is the issue.
> 
> How can I get the "new" 172.31.0.0 network to talk to the old 
> 172.31.0.0 network till the conversion is done and the old 172.31.0.0 
> network is decommissioned. I tried to use the same iptables gateway 
> to go from the new network to the old to no avail. Can this be done? 
> Can I do it by building a seperate iptables router to handle the 
> traffic coming from the new network to the old?

In a word "Bridging".  Remember that subnets are separated from one 
another by routers.  So if you are wanting to have the same subnet on 
different sides of a router you will need to use an operation that can 
join the two sides of the subnet together making one big subnet.

(Presuming that I am correct on your physical layout above.)

I would recommend that you set up (augment) your existing IPTables box 
to include bridging or replace it with one that does bridging.  The 
bridging will allow you to combine your existing network and the new 
network in to one large network.

I am presuming that your existing network will stay on eth0 and the 
existing county network will stay on eth1 and that the new network will 
be on eth2.

Bridge eth0 and eth2 together in to a new bridge, br0.  Assign your 
172.31.5.240/21 address to br0 and keep your existing county address on 
eth1.  This way your existing routing scheme and firewalling between 
your subnet and the county subnet will work just fine.  All you are 
doing to the routing and firewalling is changing the interface that your 
network is on.

Chew on that and let me know if I got something wrong or if you need 
something else.



Grant. . . .
