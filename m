From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Wed, 23 Mar 2005 13:24:20 -0600
Message-ID: <4241C264.5060800@riverviewtech.net>
References: <2F413D5F33545D4A8465BBEE900238CC3FA74E@cymmail.cymphonix.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2F413D5F33545D4A8465BBEE900238CC3FA74E@cymmail.cymphonix.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Trevor Paskett <tpaskett@cymphonix.com>
Cc: netfilter@lists.netfilter.org

I'll take a stab at this.  I too saw the original post but did not reply as I did not have any good answer at the time and still do not.  But this would be my thought process on this matter.

Per Trevor's original post the problem arises when the Linux 2.6.9 Squid box redirects traffic back to it's self when it is on a different subnet.  Yet the  "Test Machine" can ping the "Linux 2.6.9" system.  To what address are you trying to ping the "Linux 2.6.9" on 192.168.12.165 or 192.168.255.165?  The address that you are pinging will make a difference as the packets travel through the network.  If you try to ping the 192.168.12.165 address the ping packets will travel from the "Test Machine" through the "Linux 2.6.9" system's br0 interface on it's way in to the router via the 192.168.255.1 address and out of the router via the 192.168.12.1 address to the "Linux 2.6.9" system's 192.168.12.165 address.  Now if you consider that packet path and change the packet to be a port 80 TCP connection the packet will follow this path.  Traffic leaving the "Test Machine" through the "Linux 2.6.
 9" system's br0 interface where it will be intercepted and redirected to port 3128 of whi
ch address?  I'll assume that it will be redirected to 192.168.12.165:3128 thus going directly in to Squid on the "Linux 2.6.9" system.  The problem will be the return traffic from the Squid system back to the "Test Machine" in such that the source address on the packet will probably be the 192.168.12.165 address of the "Linux 2.6.9" system not what the TCP stack on the "Test Machine" is expecting.

I'm assuming that you have a valid reason for putting Squid on a different subnet than the client machines in question.  If I were trying to do this from the ground up I would make sure of a few things:

1)  REDIRECT or DNAT traffic coming from the client machine to proxy with a known address.
2)  SNAT traffic coming from the proxy with a known address back to an address the client machines are expecting.  I'm not sure as of how to do this as the source address that they are expecting will be different depending on where they are trying to connect to.  Seeing as how Squid can correctly transparent proxy traffic when it is on the correct subnet I'm going to assume that it knows how to handle this issue.

As there are a LOT of things going on in this mix I'm sort of at a loss as to what to do beyond this point with out more information as to what you are doing and why you might be doing this on a technical level, I don't care about politics.  I'm willing to try to help in any way that I can but I need more data to work with on this and more time to think about it to see if I can come up with a solution.



Grant. . . .

Trevor Paskett wrote:

> So no takers on this? Nobody has the same issue, or can re-create it? We
> are desperate for a solution to this, and are willing to pay for a fix
> if necessary. Please help!!
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501
>  
> 
> -----Original Message-----
> From: Trevor Paskett 
> Sent: Friday, March 18, 2005 3:42 PM
> To: netfilter@lists.netfilter.org
> Cc: netfilter-devel@lists.netfilter.org
> Subject: RE: Transparent Proxy using bridging 2.6.9 and REDIRECT
> ondifferent subnet
> 
> I have more information o this problem. I have also cc'd the development
> list as I think this could be a bug, but it is probably something I'm
> doing wrong :)
> 
> With the test machine on another subnet that the REDIRECT linux box,
> everything works up until the return packet to the client with the HTTP
> body. Running ethereal shows that the test workstation gets a packet,
> but the src port is 1 and not 80 as it should be.
> 
> Adding some prink's into ipt_REDIRECT shows that when it goes through
> that module the port numbers are correct. I turned on debugging in
> ipt_nat_core.c and get this output:
> 
> Mar 18 16:29:52 debian kernel: Found best for tuple c02f1c98: 6
> 192.168.255.152:4012 -> 192.168.12.165:80
> Mar 18 16:29:52 debian kernel: Mangling f45a96a0: DST to 192.168.12.165
> 8888
> Mar 18 16:29:52 debian kernel: Mangling f45c0660: SRC to 192.168.255.3
> 80
> Mar 18 16:29:52 debian kernel: Mangling f45b4680: DST to 192.168.12.165
> 8888
> Mar 18 16:29:52 debian kernel: Found best for tuple ed1dbbb4: 6
> 127.0.0.1:33186 -> 127.0.0.1:3128
> Mar 18 16:29:52 debian kernel: Mangling f45c0de0: DST to 192.168.12.165
> 8888
> Mar 18 16:29:52 debian kernel: Mangling f45b4680: SRC to 192.168.255.3
> 80
> Mar 18 16:29:52 debian kernel: Found best for tuple ed1dbcf0: 6
> 192.168.255.3:80 -> 192.168.255.152:4012
> Mar 18 16:29:52 debian kernel: Trying implicit mapping
> Mar 18 16:29:52 debian kernel: Mangling f45c08a0: SRC to 192.168.255.3 1
> Mar 18 16:29:52 debian kernel: Found best for tuple ed1db9a4: 6
> 192.168.255.3:1 -> 192.168.255.152:4012
> Mar 18 16:29:52 debian kernel: Found best for tuple f426f898: 6
> 192.168.12.165:33187 -> 192.168.255.3:80
> Mar 18 16:29:52 debian kernel: Mangling f45c08a0: SRC to 192.168.255.3
> 80
> Mar 18 16:29:52 debian kernel: Mangling f45c0060: SRC to 192.168.255.3
> 80
> Mar 18 16:29:52 debian kernel: Mangling f4132cc0: SRC to 192.168.255.3 1
> Mar 18 16:29:52 debian kernel: Mangling f45b4c80: SRC to 192.168.255.3 1
> Mar 18 16:29:55 debian kernel: Mangling f4782aa0: DST to 192.168.12.165
> 8888
> Mar 18 16:29:55 debian kernel: Mangling f4782aa0: SRC to 192.168.255.3
> 80
> Mar 18 16:29:55 debian kernel: Mangling f4512dc0: SRC to 192.168.255.3 1
> Mar 18 16:29:55 debian kernel: Mangling f45c08a0: SRC to 192.168.255.3
> 80
> Mar 18 16:29:55 debian kernel: Mangling f4782da0: SRC to 192.168.255.3 1
> Mar 18 16:29:58 debian kernel: Found best for tuple e4611bb4: 6
> 127.0.0.1:33188 -> 127.0.0.1:2003
> Mar 18 16:30:01 debian kernel: Mangling f45a99a0: DST to 192.168.12.165
> 8888
> Mar 18 16:30:01 debian kernel: Mangling f45a99a0: SRC to 192.168.255.3
> 80
> Mar 18 16:30:01 debian kernel: Mangling f45a95e0: SRC to 192.168.255.3 1
> Mar 18 16:30:01 debian kernel: Mangling f45a95e0: SRC to 192.168.255.3
> 80
> Mar 18 16:30:01 debian kernel: Mangling f4512940: SRC to 192.168.255.3 1
> Mar 18 16:30:04 debian kernel: Found best for tuple e4b9fbb4: 6
> 127.0.0.1:33189 -> 127.0.0.1:2003
> 
> It looks like right after 'Trying implicit mapping' the SRC port gets
> changed to 1, when it should be 80. I've poked around ip_nat_core.c but
> have never looked in there before and can't find the problem. Am I
> looking to deep? Is it something more simple that this? I tried this
> with 2.6.11.4 and had the same result. Thanks!!
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501
>  
> 
> -----Original Message-----
> From: Trevor Paskett 
> Sent: Friday, March 18, 2005 10:41 AM
> To: netfilter@lists.netfilter.org
> Subject: Transparent Proxy using bridging 2.6.9 and REDIRECT on
> differentsubnet
> 
> I have the following setup
> 
> Test Machine ---> Linux 2.6.9 ---> Internet Router (Doing NAT)
> 192.168.255.152   192.168.255.165   192.168.255.1/24
> 				            192.168.12.1/24
> 
> I have blacked out all my iptables and ebtables all default ACCEPT
> policy.
> 
> The Linux 2.6.9 is bridging. I use the following rule to redirect port
> 80 traffic to Squid on the Linux 2.6.9 box:
> 
> iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
> 
> This works just like it should. No problem. The problems comes in this
> setup:
> 
> Test Machine ---> Linux 2.6.9 ---> Internet Router (Doing NAT)
> 192.168.255.152   192.168.12.165    192.168.255.1
> 				            192.168.12.1
> 
> When the Linux box is on a different subnet that the test machine the
> request will get to Squid, the rules get a packet count I see squid get
> the request. Then squid try to send the request back to the client and
> it hangs up. The browser just spins. The test machine and the Linux
> 2.6.9 can both ping each other so I know connectivity is ok.
> 
> Now if I bring up an alias br0:0 192.168.255.165 in the above setup,
> then everything works again. So does the br0 have to have an ip on the
> same subnet for REDIRECT to work? I have also tried adding ebtables
> rules like:
> 
> ebtables -t broute -A BROUTING -p IPv4 --ip-protocol 6 \
>         --ip-destination-port 80 -j redirect --redirect-target ACCEPT
> 
> Makes no difference. I have also tried some more complex variations
> like:
> 
> iptables -t nat -A PREROUTING -p tcp -m physdev --physdev-in eth1
> --dport 80 -j REDIRECT --to-port 3128
> iptables -t nat -A PREROUTING -p tcp -i br0 --dport -j DNAT --to
> i92.168.12.165:3128
> 
> All see to work the same. Broken :) I have messed around with settings
> on /proc/sys/net to no avail.
> 
> I'm using iptables v1.2.9 and Linux 2.6.9. Debian Woody. Thanks!!
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501
>  
> 
> 
> 
> 
> 


