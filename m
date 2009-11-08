From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: When writing rules for multiple sequenced firewalls, does the 
	source IP of client need to be modified at each firewall
Date: Sun, 8 Nov 2009 15:00:19 +0000
Message-ID: <ac5c74140911080700g5f507d18t2faf96a43e0304eb@mail.gmail.com>
References: <ac5c74140911080335t3c58400t653b8eaaf3343f4d@mail.gmail.com>
	 <33be4bb30911080629t2b6b7cfdq5959661423e70f5f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1mP0xKt8CkMxA0AWg193R3ZWuLi23TDhow56Q6a9BfE=;
        b=sFbraqwY6Ma5VTIEZE2Ompkm5sWayrO8/Qs7/e7Op4gQSPs4PdT8OCx3+Jvhqh5/a6
         HdfugJDm3bJlwFzXadF2bK4D2XctEFC3XX1L94bzcdXbZX1SVa67pf6mzLYqa0TAArbG
         nR3nH9i7rxruzSHTFor8LhDdyokds6LYIvNzo=
In-Reply-To: <33be4bb30911080629t2b6b7cfdq5959661423e70f5f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter@vger.kernel.org

Hi again Oskar,

I will need to look into NAT. I am just keen to understand how my
Linksys 54G WRT box (2 of them) uses iptables, in the sense that it
automatically blocks all incoming but allows outgoing with incoming
based on that outgoing traffic (bit of a mouth full!).

So I began thinking how would the firewalls react if I did indeed want
to permit incoming to a ssh server or some other machine.

I did not want to do this via the GUI in order to force myself to
understand what is really happing from an iptables rules perspective.

I guess the question I am really asking is, after the external client
IP address passes both firewalls is the source IP the original IP
address of the external client or  the IP address of the tier2Firewall
(eth3)?


I just downloaded zenmap and nmap.

I fired it up and hit a webpage. It appears that the external web
server IP address does seem to be handed or forwarded on through the 2
firewalls unmodified to my laptop. The source IP does not seem to have
changed to the IP address of each router as the packet moves along the
firewall path.

Its just something I wanted to confirm. There is no point in trying to
define rules based on what I think is happening and what should be
happening.

so as before the rules to allow internal access to a ssh server from
an external source should be defined as:
iptables -A FORWARD -i eth0 -s anyIP -d sshServIP --dport 22  -j ACCEPT
iptables -A FORWARD -i eth2 -s anyIP -d sshServIP --dport 22  -j ACCEPT

assuming NAT and port forwarding have also been set up correctly.

Correct?

[Perhaps I am thinking of proxies where the IP address are definitely
modified to handle the TCP connections. And this has led to my
confusion]

On Sun, Nov 8, 2009 at 2:29 PM, Oskar Berggren <oskar.berggren@gmail.co=
m> wrote:
> For NAT to happen you need to create SNAT and DNAT rules in mangle
> table, chain PREROUTING and POSTROUTING. No NAT happens other than
> what you have specified. In most cases, you should not need to
> translate the source address of traffic coming from a public
> ip-address available on the internet. For your scenario you seem to
> need DNAT rules to translate the target address of traffic destined t=
o
> your SSH-server.
>
> (You would also need SNAT rules to translate the source address of
> packets coming _from_ you own network, if you want to reach other
> stations on the Internet.)
>
> /Oskar
>
>
> 2009/11/8 paddy joesoap <paddyjoesoap@gmail.com>:
>> Dear Experts,
>>
>> Suppose I have two firewalls in the network and suppose the network
>> consisted of the following:
>>
>> Internet -- gwFirewall -- tier2firewall -- sshServer
>>
>> gwFirewall has two interfaces:
>> eth0 =3D Internet facing (IP address 1.2.3.4)
>> eth1 =3D Internal facing (IP address 192.168.1.1)
>>
>> tier2firewall has two interfaces:
>> eth2 =3D gwFirewall facing (IP address 192.168.1.4)
>> eth3 =3D deep internal facing (IP address 192.168.2.1)
>>
>> sshServer =3D IP address 192.168.2.2, Port 22
>>
>> Now suppose the two firewalls where a typical SOHO box like the
>> linksys 54G WRT runnning dd-wrt, so they handle my Netfilter firewal=
ls
>> rules and NAT etc.
>> Or the Firewalls could be any PC's converted to a netfilter firewall
>> (filter, nat and mangle enabled).
>>
>> My question is, when writing rules to permit Internet access to a
>> system deep in the network, do you keep the original source IP addre=
ss
>> of the internet client in your firewall rules for each firewall in t=
he
>> path?
>>
>> That is, if a internet client (source IP address 94.108.94.75) needs
>> to access a ssh server (destination IP address 192.168.2.2) across t=
wo
>> firewalls how should the inbound rules look?
>>
>>
>> Scenario 1)
>>
>> On the gwFirewall you permit the internet client access to
>> tier2Firewall on the IP address of eth2 and from there, tier2Firewal=
l
>> will permit that same client IP to the ssh sever.
>>
>> For example:
>>
>> iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 2=
2 =A0-j ACCEPT
>> iptables -A FORWARD -i eth2 -s 94.108.94.75 -d 192.168.2.2 --dport 2=
2 =A0-j ACCEPT
>>
>> Scenario 2)
>>
>> On the gwFirewall you permit the internet client access to
>> tier2Firewall on the IP address of eth2 and from there, tier2Firewal=
l
>> will permit the *gwFirewall* internal IP to the ssh sever. Because o=
f
>> NAT etc I wonder will the source IP addresses etc be changed.
>>
>> For example
>>
>> iptables -A FORWARD -i eth0 -s 94.108.94.75 -d 192.168.1.4 --dport 2=
2 =A0-j ACCEPT
>> iptables -A FORWARD -i eth2 -s 192.168.1.1 -d 192.168.2.2 --dport 22=
 =A0-j ACCEPT
>>
>> I presume its Scenario 1 above is correct and the original source IP
>> address of requesting Internet client is carried through the chain o=
f
>> firewalls towards the destination.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
