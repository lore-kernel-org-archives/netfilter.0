From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: MAtching packets
Date: Thu, 30 Oct 2003 10:06:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006e01c39e8a$6b782fe0$de0018ac@admin.monash.edu.my>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28AC90@wardrive.citadelcomputer.com.au>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A28AC90@wardrive.citadelcomputer.com.au>
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
To: 'George Vieira' <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

Hey George!
I think youre right! I forgot to recompile my 2.4.20 kernel after I
patched it.
I now recall reading something similar to that before. I will look it
up. THANKS!

Regards
edmund

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of George Vieira
Sent: Thursday, October 30, 2003 9:52 AM
To: eturner@monash.edu.my; netfilter@lists.netfilter.org
Subject: RE: MAtching packets

not sure but don't you need something patched/enabled in the kernel to
allow the marked packets to work with tc??

something possibly like this?

[*]       IP: use netfilter MARK value as routing key

or something..

Thanks,
____________________________________________
George Vieira

> -----Original Message-----
> From: Edmund Turner [mailto:eturner@monash.edu.my]
> Sent: Thursday, 30 October 2003 12:34 PM
> To: netfilter@lists.netfilter.org
> Subject: MAtching packets
> 
> 
> 
> 
> Hey guys and girls, how ur day?
> I got a slight problem configuring tc on my firewall (traffic 
> control).
> Before I get kicked out the door and sent to the LARTC forum, I would
> like to add that the problem im facing is MARKING the packets via
> iptables.
> 
> Situation is as such
> LAN --> Firewall --> Router -->Internet
> 		|
> 		|
> 		--> DMZ
> 
> So much for the Ascii artist in me. :)
> The firewall has 3 interfaces:
> Eth0 = LAN --> 100Mbps NIC
> Eth1 = DMZ --> 100Mbps NIC 
> Eth2 = Internet --> 4MB link to internet
> 
> Background:
> DMZ Zone Eth1: Web/FTP, and SMTP servers. (100Mbps switches and NICs) 
> WEB/FTP server :10.100.1.1/24
> SMTP server:10.100.1.2/24
> 
> I need to mark packets for the LAN (192.168.0.0/16) to the DMZ server
> (10.100.1.1) to classify them in classes.
> 
> This is what I tried :
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
> --set-mark 9
> /sbin/iptables -A PREROUTING -i eth1 -s 10.100.1.1 -t mangle -j MARK
> --set-mark 9
> 
> 
> Traffic control does not seem to work when I mark the packets 
> as above.
> It appears that the 'tc' does not recognize the marked packets. I
> eventually marked them like this :
> 
> Tc filter add dev eth2 parent 2:1 protocol ip prio 7 u32 match ip src
> 10.100.1.1 classid 2:1
> 
> I would hope someone could point out my error in marking the packets.
> 
> Another question, there shouldn't be any problem with marking 
> different
> IPs with the same numerical mark, right?
> Eg:
> 
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
> --set-mark 9
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.2 -t mangle -j MARK
> --set-mark 9
> 
> Any help is appreciated!
> 
> 
> Regards
> edmund
> 
> 
> 


