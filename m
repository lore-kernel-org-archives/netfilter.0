From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Tue, 04 Nov 2008 15:53:57 -0800
Message-ID: <4910E095.2050003@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <4910D722.6050008@riverviewtech.net>
Reply-To: dmiller@amfes.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4910D722.6050008@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
>> Does the above communication involve NAT?  No "hosts" or private 
>> networks involved - all public IP's between them (unless of course 
>> the packets traverse private IP ranges within the ISPs' networks 
>> before coming back out.
>
> Possibly, at least for general internet access.  There will be NAT 
> between the private LAN IP address space (192.168.0/24 and 10/8) and 
> the internet.
>
> That being said, if you establish a VPN between Router C and Router D 
> across the internet (which I'm going to assume will be done), you can 
> have LAN to LAN traffic with out NATing in between them.  This can 
> happen because the VPN will encapsulate the traffic leaving the 
> 192.168.0/24 network going to the 10/8 network.  This encapsulation 
> raps the packets and uses the globally routable IP address of Routers 
> C and D as the source and destination IPs for the /VPN/ traffic.  When 
> the VPN traffic reaches Router D, it will decapsulate it and send it 
> out to the LAN on its end.
>
> So, yes NAT is used to send normal traffic to the internet and no NAT 
> is not used (VPN encapsulation is) to send LAN to LAN traffic.
>
*Head bouncing on desk*  You just had to do it.  You just HAD to throw 
something else in, didn't you?  Ok - no VPN during these discussions!!!  
That's next thread.
>> Two offices on opposite sides of the world linked via Internet.
>
> *nod*
>
> This means that you will most likely be dealing with VPNs
Once again - I'm using language that's too ambiguous.  I actually 
probably inferred that - but I didn't intend to.  The INTENT was to 
illustrate a clumsy, inefficient, amateurish connection between Internet 
connected sites using non-VPN capable home-office consumer-grade 
firewall routers - the under $20 kind.

You're assuming a level of capability and courtesy for the sysadmin I am 
not - nor am I talking about higher-level protocols.  So from Los 
Angeles, they'll have to type in the public IP address of the New York 
router to reach that office.

*Exasperated shrug* Now that I've typed that - it really doesn't make 
too much sense.  All right - fine.  I guess a VPN was needed somewhere.  
But darn it - the VPN operates at a higher level - somewhere along the 
line the VPN server/router needs to translate the virtual IP's to 
something the rest of the world understands - and that means NAT!
>
>> So the world's most expensive super-duper whatchamacallit (fill in 
>> the blank here with router, firewall, bridge, modem, magic cauldron), 
>> placed between giant corporate's network (using private address 
>> space) and the Internet - will perform NAT?  Somewhere somehow NAT 
>> (in particular, source NAT for outbound access from the private and 
>> destination NAT to provide services to Internet) must be performed?
>
> Correct.  The word you are looking for is usually a router that does 
> firewalling, or sometimes knows as a firewalling router.  (Remember 
> that firewalls really /filter/ traffic while routers /route/ traffic, 
> sometimes altering it along the way.)
>
> Even IBM and Microsoft (presuming they are using private class IP 
> address space) are either running NATing routers between their 
> internal corporate networks.  (As an alternative they could be doing 
> proxying, but it is most likely that they are using NAT.)
Again with the proxy (what's the matter with you?  Trying to give me a 
complete answer that accounts for the exceptions?  Geez....)

I think my confusion stems from my own introduction to IP, which was via 
WindozeNT 4.0.  Somewhere along the line NAT was referred to in some 
documentation as a "poor-man's solution" to doing "proper" routing - and 
that concept has carried forward with me to where I keep thinking NAT is 
somehow an inferior solution to the "proper" way of doing things.  If 
the only "proper" (read: other) way of connecting LAN's to the Internet 
is by assigning public IP's to workstations (and of course 
purchasing/reserving/controlling such IP's) - then I can drop the 
inferiority complex I've held with regard to NAT.

-- 
Daniel L. Miller, VP - Engineering, SET
AM Fire & Electronic Services, Inc. [AMFES]
dmiller@amfes.com 702-312-5276
