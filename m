From: "Netfilter.UPU" <netfilter@upu.int>
Subject: RE: Checkpoint VPN through Iptables
Date: Thu, 26 Sep 2002 12:25:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8F31D8DF00BBD411975C00508B6D6E65F8909E@hermes.upu.int>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Thanks for your help Antony
It's working now.
It works with : 
iptables -t nat -A PREROUTING -t nat -s $UPU_FIREWALL -d $EXT_IP -p udp -m
multiport --port 500,2746 -j DNAT --to $CHECKPOINT_CLIENT
iptables -A FORWARD -s $UPU_FIREWALL -d $CHECKPOINT_CLIENT -p udp -m
multiport --port 500,2746 -j ACCEPT
iptables -A POSTROUTING -t nat -i $LAN_IFACE -o $EXT_IFACE -j MASQUERADE

But there are thing I still don't understand : why prerouting nat & forward?
If the connection is initiated by the client, it is MASQUERADEd and the
replies should be unMASQUERADEd automatically
If the connection is initiated by the server (enterprise FW) then why the
ip_conntrack can't detect that and anticipate by creating a RELATED
connection entry (similary to what ip_conntrack/ip_conntrack_ftp does with
passive ftp) 

These rules have an heavy implications : Only 1 CLIENT with a STATIC IP

PS : By the way the dialog between FW1 and a Client requires TCP/264,
UDP/500 and UDP/2746
PS : Sorry, if these newbie questions seem stupid or dummy for some gurus.

Thanks for your help and comprehension.
Bir

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Tuesday, September 24, 2002 15:57
To: 'netfilter@lists.netfilter.org'
Subject: Re: Checkpoint VPN through Iptables


On Tuesday 24 September 2002 1:37 pm, Netfilter.UPU wrote:

> Hi all,
>
> I have the following script
>
> $IPTABLES -F
> $IPTABLES -t nat -F
> $IPTABLES -t mangle -F
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -P FORWARD ACCEPT
> $IPTABLES -t nat -A POSTROUTING -s 192.168.0/24 -o eth0 -j MASQUERADE

Simple enough.....

> My little understanding of firewall, linux and iptables, makes me believe
> that :
> a) I've a quite secureless FW-HOME and my internal LAN is nated

i agree.

> b) no matter the protocol, the src/dst ports etc, everything should pass.

From inside to outside, yes.   Also reply packets provided you have 
connection tracking support.

> c) The checkpoint client should be able to access my enterprise VPN

Maybe :-)

> My problem is that the client cannot access my enterprise VPN.
> I added some loging rules and it seems that
> My client uses UDP, src port 500 dst port 500.

Okay - that is the IKE protocol as used with IPsec.

> The FW-HOME send that to FW-UPU (prot udp, src port 500 dst port 500)
> (masquerading the IP@)
> The FW-UPU replies to FW-UPU (prot udp, src port 500 dst port 500)
> The FW-HOME replies : icmp port udp 500 unreachable

The reason is because you are performing NAT on outgoing packets, but here 
you are getting a (completely separate) connection from the outside to the 
inside, for which you do not have a NAT rule.

Here is what you should add:

iptables -A PREROUTING -t nat -i eth0 -p udp --sport 500 --dport 500 -j DNAT

--to a.b.c.d
where a.b.c.d is the internal IP address of your VPN client.

You will also need to set up the same translation for protocol 50 (ESP) in 
order to allow that connection to be made after IKE has established the 
encryption keys.

There is one thing you said which makes me think this is likely to work at 
all:

> Another info:
> It worked with a Redhat 7.0 + ipchains

I presume that was also with NAT (masquerading) in operation ?

The reason I say that is because there are twoways of using IPsec: transport

mode and tunnel mode.

Transport mode does not work through NAT.
Tunnel mode does work through NAT.

Hope this helps,

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-)
o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

