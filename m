From: "Nikolaj G." <damn_you_alexis@yahoo.com>
Subject: Re 2nd question: Example scripts with DNS and DMZ solutions
Date: Thu, 26 Feb 2004 02:22:29 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226102229.46074.qmail@web20422.mail.yahoo.com>
References: <20040225224932.7391.81412.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040225224932.7391.81412.Mailman@netfilter-sponsored-by.noris.net>
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
To: netfilter@lists.netfilter.org

Hi Daniel,

Thanks for reply. See below.

> Message: 2
> Subject: RE: Example scripts with DNS and DMZ
> solutions
> Date: Wed, 25 Feb 2004 12:47:43 -0800
> From: "Daniel Chemko" <dchemko@smgtec.com>
> To: "Nikolaj G." <damn_you_alexis@yahoo.com>,
> 	<netfilter@lists.netfilter.org>
> 
> One important thing you never mentioned was if you
> were hosting your own
> internet records, or if you had a provider doing it.
> I am assuming that
> you do host your own external records.

Sorry, I was thinking that just after sending - too
eager because the network should have worked two
months ago.

Anyway Ive read the Bind & DNS from Oreilly (3rd ed.
version 8 I guess), and my problem is that I forgot
almost all about it. One of my problems has always
been to understand the different setups to have for
DNS and what actions to take against the ISP, the
domain reg. and Hostmaster.

This isnt going to be a DNS discussion, but as I
understand there're 2-3 setups: 1. simple cache 2. the
big solution: my DNS servers are registred at my ISP
(or domain registrar). With this solution I have to
pay money to Hostmaster. 3. I cant remember.

So when you say "hosting your own internet records", I
think of the "big solution" - does it mean that my ISP
(or domain reg.) have glue-records pointing to me?

What I want is the DNS-cache solution, I guess. I
simply dont want my LAN users to request the DNS
servers at the ISP (or the domain reg.) - for better
speed.

Here is what I have: only one static WAN-ip from my
ISP (my domain is reg. with a different supplier).
With that domain I forward Http and Mail to my Wan-ip
(also I can add/change A-record, CNAME and MX). What I
have at my Dom. Reg.:

@  SOA dns1.info-webs.net.
@  NS dns1.info-webs.net.
@  NS dns2.info-webs.net.
@  MX [10] mail.mydomain.dk.
@  A x.x.x.x
mail  A x.x.x.x
www  A x.x.x.x

, x.x.x.x=wan-ip

Sorry, if this got too "DNS", but its part of my
problem.

> 1. LAN - This services requests for LAN clients
> only.
> 	Resolves all machines inside the DMZ and servers
> that the DMZ
> needs inside the LAN
> 	This view then uses the DMZ DNS for forwarding
> 	This does do dynamic DNS updates

Ok, I understand. I skimmed the "view"-part once.
 
> 2. DMZ - This services requests for all clients.
> There are two views,
> one for internet traffic and one for everyone else.
>    View #1:=20
>  	Access is available to internet users
> 	This view does not return recursive results
> 	This view links to only publically available DNS
> information
> (mail,web...)
>    View #2:=20
> 	Access is available to non-internet users
> 	Resolves all machines inside the DMZ and servers
> that the DMZ
> needs inside the LAN
> 	This view then uses your ISP's DNS for forwarding
> 	This does not do dynamic DNS updates
>   =20

I understand. PS I would use static ip addresses for
my Web and Mail (192.168.2.1 and 192.168.2.2) and make
DNAT with IPTABLES.

> There should be enough examples on the net to
> describe how bind views
> work. If not, just reply and I can fill in blanks.

Ok, I would still be happy if you point me to an
example that "matches" my setup.

To follow up, I then have to make the following DNS
rules (port 53) with IPTABLES (in both directions):
1. access from LAN to DMZ for TCP and UDP
2. the reverse
3. access from DMZ to internet for TCP and UDP
4. the reverse

Right? What about ICMP, is it needed by DNS?

> Limitations:
> 	#1 The Internal DNS clients need to be on a
> separate DNS domain
> than the DMZ servers. Eg:
> 		client_workstation.mynetwork.com
> 		dmz_server.dmz.mynetwork.com
> 	This only applies to the internal network, of
> course, but it may
> fck up simple windows networks

Hmm, I dont like. Is it an error or is it obvious...
logically the DMZ and the LAN are using two different
networks. Is there a workaround so that I can use ex.
mail.mydomain.dk from both LAN and DMZ?

If not, (question) so at my Dom. Reg. I have to
pinpoint Http and Mail traffic to web.dmz.mydomain.dk
and mail.dmz.mydomain.dk - stupid question, sorry. Ah,
I dont care - it could be controlled with the DNAT
rule ie. mail.mydomain.dk->mail.dmz.mydomain.dk,
right? PS dont want to wait on DNS updates from my
Dom. Reg.

> 	#2 I am assuming your using BIND on Linux.

Yes, Im using Redhat 9.0 on all servers. All clients
(I think) uses Windows.

> If you
> are using
> windows DNS, I don't believe they understand the
> concept of views which
> means you'd need a third DNS server
> =09

I dont. I only use Windows as client.

> 	#3 No DMZ machines should have dynamic DNS. This
> isn't a
> requirement, but you should damn well follow it.
> =09

Ok, both my DNS servers will get static IP. Ill put
Bind on the Mail server (in the DMZ) and the
DHCP/Samba server (in the LAN).

> 	#4 DMZ Machines cannot reach Dynamic IP
> machines
> without
> hand-holding the static DNS list. Why would anyone
> want to do this
> anyways? (Correction, you could make the network
> less secure and have
> the LAN's DNS server pushing DNS updates to the DMZ
> DNS. I wouldn't
> though.)

I understand, no need to. Also, I have to keep as
simple as possible.

Thanks. Still, I would be happy with an example. Ill
try look. The setup is classic, I would mean.

/NikolajG


My question to begin with:

> Hi All,
> 
> Im in the beginning of IPTABLES and I need some
> examples, especially explaining some DNS solutions.
> At
> first, here is my setup:
> 
> I have 3 netcards in the firewall:
> - 1 for the router
> - 1 for DMZ
> - 1 for LAN.
> 
> DMZ:
> - Web server
> - Mail server (DNS?)
> 
> LAN:
> - DHCP server (DNS?)
> 
> 
> My question: should I have a DNS server on the DHCP
> (LAN) machine serving local requests, or only on the
> Mail server (DMZ)... or maybe both and then use
> forwarding?
> Second, I use DHCP - I guess my DNS server will get
> an
> automatic update.
> 
> Thanks in advance.
> 
> Nikolaj G.


__________________________________
Do you Yahoo!?
Get better spam protection with Yahoo! Mail.
http://antispam.yahoo.com/tools

