From: Y Makki <bugzilla@sympatico.ca>
Subject: Re: Windows file sharing over different subnets
Date: 27 Mar 2003 14:40:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048794050.1021.31.camel@psyche>
References: <1048792127.1167.23.camel@psyche> 
	<3E834E40.3070702@corp.lcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E834E40.3070702@corp.lcom.net>
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
To: "Andrew J. Meader" <ameader@corp.lcom.net>
Cc: netfilter@lists.netfilter.org

Hi,

I don't really need a wins server on the eth1 segment since there are no
windows machines here except the file server, the eth2 segment has no
servers at all.

For testing I have set the FORWARD default policy to ACCEPT, and allow
all incoming traffic from both eth1 and eth2.
I also tried earlier to DNAT any 135:139 traffic coming from eth2 to the
fileserver, which did not help. Ping works from segment to segment.

Maybe there is a client or relay agent of some sort I could install on
the linux gateway, I don't know.



On Thu, 2003-03-27 at 14:17, Andrew J. Meader wrote:
> Hi,
> 
> Netbios is not routable (without help.) Make sure iptables is allowing 
> port 139 and make sure both network segments share a common wins server. 
> This is painfully obvious, but, can you ping from one segment to the 
> other segment?
> 
> Have fun.
> 
> Andy
> 
> Y Makki wrote:
> 
> >Hello,
> >
> >I'm faced with a problem on my network, I'll start by describing the
> >structure. The router is a redhat box, with 3 network cards:
> >eth0 goes to the dsl modem, ppp0
> >eth1 goes to the 192.168.1.0 network which contains a Windows 2000 file
> >server (192.168.1.3)
> >eth2 goes to 192.168.2.0 which contains windows clients, mostly Win98
> >
> >Is it possible to allow clients to see/use the file server? what I have
> >done so far is add "option netbios-name-servers 192.168.1.3;" to
> >dhcpd.conf and issue the following on the gateway:
> >
> >ip route add 224.0.0.0/4 dev eth1
> >route add -net 255.255.255.255 netmask 255.255.255.255 eth1
> >
> >tcpdump shows some activity when trying to browse network neighborhood
> >from the fileserver:
> >
> >a client (192.168.2.2)
> >----------------------
> >02:40:58.548757 arp reply 192.168.2.2 is-at 0:40:5:72:f6:6a
> >02:40:58.549485 192.168.2.2.microsoft-ds > 192.168.1.3.1214: R [tcp sum
> >ok] 0:0(0) ack 673608238 win 0 (ttl 128, id 3584, len 40)
> >02:40:58.549552 192.168.2.2.netbios-ssn > 192.168.1.3.1215: S [tcp sum
> >ok] 197681:197681(0) ack 673643567 win 8760 <mss 1460,nop,nop,sackOK>
> >(DF) (ttl 128, id 3840, len 48)
> >
> >the fileserver (192.168.1.3)
> >----------------------------
> >02:41:01.476626 192.168.1.3.1215 > 192.168.2.2.netbios-ssn: S [tcp sum
> >ok] 673643566:673643566(0) win 16384 <mss 1460,nop,nop,sackOK> (DF) (ttl
> >128, id 13498, len 48)
> >02:41:01.476736 192.168.1.3.1214 > 192.168.2.2.microsoft-ds: S [tcp sum
> >ok] 673608237:673608237(0) win 16384 <mss 1460,nop,nop,sackOK> (DF) (ttl
> >128, id 13499, len 48)
> >02:41:02.242490 192.168.1.3.1220 > 192.168.1.1.domain:  [udp sum ok] 49+
> >A? 192.gateway.localdomain. [|domain] (ttl 128, id 13500, len 69)
> >02:41:02.243234 192.168.1.3.netbios-ns > 192.168.1.255.netbios-ns:  [udp
> >sum ok]
> >  
> >
> >>>>NBT UDP PACKET(137): QUERY; REQUEST; BROADCAST
> >>>>        
> >>>>
> >TrnID=0x823B
> >OpCode=0
> >NmFlags=0x11
> >Rcode=0
> >QueryCount=1
> >AnswerCount=0
> >AuthorityCount=0
> >AddressRecCount=0
> >QuestionRecords:
> >Name=192             NameType=0x20 (Server)
> >QuestionType=0x20
> >QuestionClass=0x1
> >
> >This goes on for a while, after which win2k says "192.168.2.2" cannot be
> >found. Browsing from the client 192.168.2.2 yields no results.
> >
> >Any ideas/hints greatly appreciated.
> >
> 
> 



