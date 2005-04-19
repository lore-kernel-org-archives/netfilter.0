From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Re: Remapping of starcraft UDP port 6112
Date: Tue, 19 Apr 2005 16:24:40 +0200
Message-ID: <20050419142440.GC28958@gw.home.tux-labor.de>
References: <001001c544af$d2bd15e0$3800a8c0@Dewasp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001001c544af$d2bd15e0$3800a8c0@Dewasp>
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
To: Doug C <the_wasp@game-nation.net.nz>
Cc: netfilter@lists.netfilter.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I also had the same Problem. But I don't found a solution.
There are a Starcraft How-To but this don't work.

I think the beste solution is to get officals IP Addresses and the
only forward. (Maybe you can get a few IPv6 Addresses, and then Play
with ipv6 on battle.net (But I don't know whether Battle.Net support
ipv6)

I attached a E-Mail which I get from Battle.Net


On Tue, Apr 19, 2005 at 06:58:23PM +1200, Doug C wrote:
> hi there everyone
> 
> i play starcraft which uses udp port 6112 all is fine unless i want 2 local comps in the same game. (changing the game port is no longer supported as blizzard feels that starcraft is "nat-friendly", however warcraft3 supports this feature)
> 
> i have attempted to write iptable configs to remap the ports but none have worked =(
> 
> i need a fully working normal nat/ip masq for other games like counter strike and for normal downloading/browsing/email etc as well as:
> 
> ClientA:
> outgoing traffic on udp port 6112 from clientA to be remapped to where its already going udp port 60001
> incomming traffic on udp port 60001 needs to be remapped back to clientA on upd port 6112
> 
> CLientB:
> outgoing traffic on udp port 6112 from clientB to be remapped to where its already going udp port 60002
> incomming traffic on udp port 60002needs to be remapped back to clientB on upd port 6112
> 
> so far i have:
> ******************************************************************************************************************************
> ADSL=$(/sbin/ifconfig hsb0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'|sed -n 1p)
> 
> iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport 63001 --to-destination 192.168.0.3:6112
> iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport 6112 --to-source 192.168.0.3:63001
> 
> iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport 63002 --to-destination 192.168.0.56:6112
> iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport 6112 --to-source 192.168.0.56:63002
> ******************************************************************************************************************************
> 
> starcraft sends the game packets to all other clients in the game, it does not work by sending them via a server then the server sending them to the client
> ips of other people in the game will ovbiously be different from game to game
> i hope you can help me
> 
> cheers
> Doug

-- 
Sebastian Docktor <sebi@tux-labor.de>

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="battle.net.txt"

From nicholass.support@blizzard.com Tue Apr  5 20:06:57 2005
Return-Path: <nicholass.support@blizzard.com>
Received: from outbound.blizzard.com (outbound.blizzard.com [198.74.38.108])
	by gw.home.tux-labor.de (Postfix) with ESMTP id 74D47236E3
	for <sebi@tux-labor.de>; Tue,  5 Apr 2005 20:06:56 +0200 (CEST)
Received: from smtp.blizzard.com ([10.129.244.113]) by outbound.blizzard.com with Microsoft SMTPSVC(6.0.3790.211);
	 Tue, 5 Apr 2005 09:54:30 -0700
Received: from EmailSorterXP ([216.148.1.167]) by smtp.blizzard.com with Microsoft SMTPSVC(6.0.3790.211);
	 Tue, 5 Apr 2005 09:54:30 -0700
thread-index: AcU6ABlTCRf0PTBqRZCJt1cAUqVnjw==
Thread-Topic: Re: Battle.Net Connecting Problems
From: <nicholass.support@blizzard.com>
To: <sebi@tux-labor.de>
Cc: 
Subject: Re: Re: Battle.Net Connecting Problems
Date: Tue, 5 Apr 2005 09:54:14 -0700
Message-ID: <254501c53a00$1953cae0$a70194d8@corp.blizzard.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft CDO for Windows 2000
Content-Class: urn:content-classes:message
Importance: normal
Priority: normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-OriginalArrivalTime: 05 Apr 2005 16:54:30.0039 (UTC) FILETIME=[2255DA70:01C53A00]
Status: RO
Content-Length: 6704
Lines: 147

Hello,

Unfortunately there is no way to change or forward the port for Starcraft.  I suggest you contact your router manufacturer for further assistance.  I do apologize for any inconvenience.

Regards,

Nick S.
Technical Support
Blizzard Entertainment
http://www.blizzard.com/support

If you respond to this email, please attach all previous messages and files relating to this issue.




-----Original Message-----
From: sebi@tux-labor.de sebastian docktor
To: nicholass.support
Sent: 4/5/2005 7:21:19 AM
Subject: Re: Battle.Net Connecting Problems

Hello,

We can play Starcraft online on Battle.Net but only if we don't open a game on the LAN-Network.(We have to join an game, but we cannnot create a Game) The Question is now can I redirect the port 6112 to another port for example to 60112. (I know how to redirect this ports, but I don't know wheather the Battle.Net will then also connect to this port.)


In other words: When a Client will connect to a server to play a game, it usually connect to the Server-IP with tcp/udp port 6112. Can I tell Battle.Net to use another Port, so that the Client will connect to the Port 60112 and not to 6112?.

Or how do the Clients know to which ports they should connect to the other Clients do they always use the port 6112?

I need this because each Client is talking to the other Clients an when
2 Clients are hide behind one offizial IP-Address, I've to seperate the Connections, but I can only do that, when the incoming data is send to another Port.

Here is a Diagramm what I mean:

|---------------------|
|        LAN          |                               |---------------|
|                     |                      |--------| Client-3      |
| |----------|        |                      |        |---------------|
| | Client-1 |        |                      |
| |----------|     |-----------|DNAT         |               |------------|
|              SNAT| Router    |--------... WAN  ...   ----  |Battle.Net  |
|                  |-----------|                             |------------|
| |----------|        |                    |
| | Client-2 |        |                    |       |-----------|
| |----------|        |                    |-------|Client-4   |
|                     |                            |-----------|
|---------------------|



Client-1 will open a Server on the Battle.Net Server. (listen udp/tcp6112 ) and connect to Router(->forwarded to Client-2), Client-3,Client-4
Client-2 will connect to the Router(->forwared to Client-1), Client-3,Client-4 (dest: Router:6112 udp/tcp)
Client-3 will connect to the Router(->forwared to Client-1),Router(->forwared to Client-2), Client-4 (udp/tcp 6112)
Client-4 will connect to the Router(->forwared to Client-1),Router(->forwared to Client-2), Client-3 (udp/tcp 6112)


regards

 sebastian docktor



On Mon, Apr 04, 2005 at 03:45:53PM -0700, nicholass.support@blizzard.com wrote:
> Hello,
> 
> Blizzard does not offer direct support for proxies (Internet connection sharing), firewalls, or routers. The settings provided are suggested settings only. You may need to contact your ISP or network administrator for assistance if you have opened the correct ports but still cannot connect or get others connected to you. 
> 
> Here are some common questions and answers regarding proxies, firewalls, and routers.
> 
> What do I need to know about ports? 
> Anytime your computer receives incoming data, it is sent to a "port". Your computer has many ports that can receive data, and different activities will utilize different ports. 
> 
> How are ports restricted when using a proxy, firewall, or router? 
> Most proxy servers, firewalls, and other Internet connection sharing methods can restrict port access. Your configuration may be restricting packets from "unknown sources". In this case an "unknown source" would be defined as any IP address that you have not initiated the contact with. Once you contact the IP address, your proxy and/or firewall considers it "safe", or a "known source", since you initiated the contact. When you create a game on Battle.net, other users need to be able to contact you in order to join. In other words, they need to be able to initiate the contact. This becomes the real problem if your connection is restricting them from contacting you. 
> 
> What ports need to be open for Blizzard Entertainment games? 
> In order to connect to Battle.net and allow others to connect to you the following ports need to be opened: 
> 
> Diablo: TCP and UDP Port 6112
> 
> StarCraft/Brood War: TCP and UDP Port 6112
> 
> Warcraft II: Battle.net Edition: TCP and UDP Port 6112
> 
> Diablo II/Lord of Destruction: TCP Port 6112 and Port 4000
> 
> Warcraft III: TCP Ports 6112 to 6118, unless you have changed the default in the Options/Gameplay screen for port forwarding.
> 
> Some firewall programs have preset ports available in their configurations that are often necessary to be open. One in particular is a connection to your DNS server. This usually takes place on UDP port 53. 
> 
> Please go to this link for more information on how to open the 
> appropriate ports for your proxy or firewall: 
> ("http://www.blizzard.com/support/?id=msi0423p")
> 
> What do I do if I am still having problems connecting using a firewall, router, or proxy? 
> If you need further help configuring your firewall, router, or proxy you will need to contact the manufacturer for assistance.
> 
> 
> Regards,
> 
> Nick S.
> Technical Support
> Blizzard Entertainment
> http://www.blizzard.com/support
> 
> If you respond to this email, please attach all previous messages and files relating to this issue.
> 
> 
> 
> 
> Customer satisfaction is a top priority here at Blizzard 
> Entertainment, and we would like your feedback on the level of service 
> you have received. Please feel free to provide such feedback at the 
> following web address: 
> http://www.blizzard.com/support/?id=eSurvey000&i=151&d=4/4/2005%203:24
> :05%20PM&t=sebi@tux-labor.de
> 
> -----Original Message-----
> From: sebi@tux-labor.de sebastian docktor
> To: Online Support
> Sent: 3/30/2005 12:59:33 PM
> Subject: Battle.Net Connecting Problems
> 
> Hi,
> 
> I want to configure a Netfilter Linux Firewall to play Starcraft through NAT. 
> 
> The Problem is that I don't have a Protokoll definition on how the Battle.Net Protokoll works.
> 
> Can you give me a hint or send me a Documentation how the starcraft Protokoll/Battle.Net Protocoll works.
> 
> Or are there some Battle.Net Proxies, that I can install on my 
> Firewall to connect to the Battle.Net
> 
> 
> 
> with best regards
> 
> --
> Sebastian Docktor <sebi@tux-labor.de>
> 

--
Sebastian Docktor <sebi@tux-labor.de>



--zhXaljGHf11kAtnf--

