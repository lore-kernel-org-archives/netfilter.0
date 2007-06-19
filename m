From: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet
	a	pptpVPN server.
Date: Tue, 19 Jun 2007 19:13:27 +0530
Message-ID: <042501c7b277$d1a1e950$1664a8c0@ssplscu22>
References: <000e01c7b01a$0c8305a0$dededede@neilhp>
	<4673FDE6.9040605@granero.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Marcos Granero Vaz - Informatica/MTZ <MarcosGranero@granero.com.br>, Neil Aggarwal <neil@JAMMConsulting.com>
Cc: netfilter@lists.netfilter.org



----- Original Message ----- 
From: "Marcos Granero Vaz - Informatica/MTZ" <MarcosGranero@granero.com.br>
To: "Neil Aggarwal" <neil@JAMMConsulting.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Saturday, June 16, 2007 8:42 PM
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a 
pptpVPN server.


>I had this kind of problem too. And i figured out that only one  GRE
> protocol VPN connection works at a time. I think this problem is in the
hi Neil
Its seem i am also facing the same problem,
I configured VPN befind the firewall, with the rules given by Pascal 
Hambourg.

But when i connect more than one client, the old client connection get 
terminated.

My rule are
#### SNATing 192.168.1.33
iptables -A FORWARD -s 192.168.1.33 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.33 -j SNAT --to-source 
203.129.224.180
#### DNATing 192.168.1.33 on port 1723 and protocol 47
iptables -A FORWARD -d 192.168.1.33 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -i eth1 -d 203.129.224.180 --dport 
1723 -j DNAT --to-destination 192.168.1.33:1723
iptables -t nat -A PREROUTING -i eth1 -d 203.129.224.180 -p 47 -j DNAT --to 
192.168.1.33
iptables -A FORWARD -i eth1 -d 192.168.1.33 -p 47 -j ACCEPT

Is any one is facing the same problem,

Or i have to go for pprpproxy?

> kernel or in iptables conntrack (maybe the way they control the flow),
> but there is a way, you have to use a PPTP proxy. I use a pptpproxy from
> http://www.mgix.com/pptpproxy/ and works fine! Now i have 6 GRE VPN
> connection simultaneously.
>
> Regards
>
> Neil Aggarwal escreveu:
>> Rajiv:
>>
>>
>>> Is it possible to put vpn server befind firewall?
>>> Is anybody did this before?
>>>
>>
>> I tried it.  I was able to get things working for the
>> most part, but had intermittent problems.
>>
>> I eventualy moved my VPN server outside the firewall.
>>
>> I hope this reference point helps.
>>
>> Neil
>>
>> --
>> Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
>> FREE! Eliminate junk email and reclaim your inbox.
>> Visit http://www.spammilter.com for details.
>>
>>
>>
> 

----------------------------------------------
Confidentiality Note: This e-mail message and any attachments to it are
intended only for the named recipients and may contain legally privileged
and/or confidential information. If you are not one of the intended
recipients, please notify the sender and do not duplicate or forward this
e-mail message and immediately delete it from your computer.
----------------------------------------------

