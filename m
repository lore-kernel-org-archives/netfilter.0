From: Cristian Goian <cfgoian@yahoo.com>
Subject: Re: NAT working for TCP and _NOT_ working for UDP
Date: Mon, 22 Dec 2003 12:42:56 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031222204256.60033.qmail@web40708.mail.yahoo.com>
References: <200312212008.07581.Alistair Tonner <>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-615108996-1072125776=:58146"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312212008.07581.Alistair Tonner <>>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-615108996-1072125776=:58146
Content-Type: text/plain; charset=us-ascii

Apologise Alistair for not writing correct your name. Big apologise.
 
Cristian

Alistair@yahoo.com, UNEXPECTED_DATA_AFTER_ADDRESS@.SYNTAX-ERROR. wrote:

Okay ... I'm firing myself from the list till I get some vacation time in.
Ignore my previous on this subject ... I was ...... not in my left mind.

Serves me right for answering list mail after a 16hour night shift and 6 
hours of christmas shopping *ggaaaa*


On December 20, 2003 04:51 pm, Alistair Tonner wrote:
> On December 19, 2003 12:31 pm, Cristian Goian wrote:
> > Hi
> > My mistake not give in enoght data. I'll start from begining because I
> > made some modifications: So I have a gatewayPC:
> > eth0 - INTERNET
> > eth1 - LAN - 192.168.1.0/24
> > eth2 - DMZ - 192.168.0.0/24
> >
> > In DMZ I have 2 PC, one for web and one for content DNS, both deserv same
> > 3 domains. IP a.b.c.240/28 and I want DNAT for them.
> >
> > On gatewayPC I have now RedHAT with 2.4.23 and iptables 1.2.9. Also have
> > now a proxy DNS to give answers to LAN and localhost. Also, temporary, I
> > have mailserver to receive and send mail for LAN and 3 domains.
> >
> > To configure iptables I use a script modified after Oskar Andeasson'
> > Tutorial. It is a long script now.
> >
> > When I conect from LAN on web server using IP adress it is OK. When a
> > query DNS (different PC than web one) no respons. When I give traceroute
> > to DNS server all packets go to my ISP, and then lost ... They are not
> > DNAT to DMZ !!
>
> Snipped out the mjority of the script.


1) we need to change the subject.

Okay ... I had the right concept in mind. Where are your clients looking to 
get name resolution from ?

case a) clients are directly configured to use DNS(s) in the DMZ -- with 
OUTSIDE ips
only one PREROUTING - FORWARDING rule nessesary for each DNS ipaddress, 
don't filter by -i device --- 
HOWEVER -- you also need to allow these DNS servers to be forwarding 
servers and allow them to connect to OUTSIDE DNS servers to get details of 
the outside world.

case b) clients are directly configured to use DNS(s) in DMZ -- with DMZ 
addresses -- NO PREROUTING rule nessesary , Forward rule to allow LAN to DMZ 
connection.
See HOWEVER above.

case c) clients configured to use OUTSIDE DNS(s) -- you need forward rules 
to connect the clients to those servers, and you need rules to allow OUTSIDE 
servers to talk to your (presumably) authoritative servers.

Do you know that outside connections are working correctly coming into 
webservers and DNS servers?
Are you sure that all servers in the DMZ have correctly configured netmask/
default gateways?
Please tell me this is NOT a flat physical network (you do have two 
physically separate networks ... not two networks running on the same wire)



---------------------------------
Do you Yahoo!?
Yahoo! Photos - Get your photo on the big screen in Times Square
--0-615108996-1072125776=:58146
Content-Type: text/html; charset=us-ascii

<DIV>Apologise Alistair for not writing correct your name. Big apologise.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Cristian<BR><BR><B><I>Alistair@yahoo.com, UNEXPECTED_DATA_AFTER_ADDRESS@.SYNTAX-ERROR.</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid"><BR>Okay ... I'm firing myself from the list till I get some vacation time in.<BR>Ignore my previous on this subject ... I was ...... not in my left mind.<BR><BR>Serves me right for answering list mail after a 16hour night shift and 6 <BR>hours of christmas shopping *ggaaaa*<BR><BR><BR>On December 20, 2003 04:51 pm, Alistair Tonner wrote:<BR>&gt; On December 19, 2003 12:31 pm, Cristian Goian wrote:<BR>&gt; &gt; Hi<BR>&gt; &gt; My mistake not give in enoght data. I'll start from begining because I<BR>&gt; &gt; made some modifications: So I have a gatewayPC:<BR>&gt; &gt; eth0 - INTERNET<BR>&gt; &gt; eth1 - LAN - 192.168.1.0/24<BR>&gt; &gt; eth2 - DMZ - 192.168.0.0/24<BR>&gt; &gt;<BR>&gt; &gt; In DMZ I have 2 PC, one for web and one for content DNS, both deserv same<BR>&gt; &gt; 3 domains. I
 P a.b.c.240/28 and I want DNAT for them.<BR>&gt; &gt;<BR>&gt; &gt; On gatewayPC I have now RedHAT
 with 2.4.23 and iptables 1.2.9. Also have<BR>&gt; &gt; now a proxy DNS to give answers to LAN and localhost. Also, temporary, I<BR>&gt; &gt; have mailserver to receive and send mail for LAN and 3 domains.<BR>&gt; &gt;<BR>&gt; &gt; To configure iptables I use a script modified after Oskar Andeasson'<BR>&gt; &gt; Tutorial. It is a long script now.<BR>&gt; &gt;<BR>&gt; &gt; When I conect from LAN on web server using IP adress it is OK. When a<BR>&gt; &gt; query DNS (different PC than web one) no respons. When I give traceroute<BR>&gt; &gt; to DNS server all packets go to my ISP, and then lost ... They are not<BR>&gt; &gt; DNAT to DMZ !!<BR>&gt;<BR>&gt; Snipped out the mjority of the script.<BR><BR><BR>1) we need to change the subject.<BR><BR>Okay ... I had the right concept in mind. Where are your clients looking to <BR>get name resolution from ?<BR><BR>case a) clients are directly configu
 red to use DNS(s) in the DMZ -- with <BR>OUTSIDE ips<BR>only one PREROUTING - FORWARDING rule
 nessesary for each DNS ipaddress, <BR>don't filter by -i device --- <BR>HOWEVER -- you also need to allow these DNS servers to be forwarding <BR>servers and allow them to connect to OUTSIDE DNS servers to get details of <BR>the outside world.<BR><BR>case b) clients are directly configured to use DNS(s) in DMZ -- with DMZ <BR>addresses -- NO PREROUTING rule nessesary , Forward rule to allow LAN to DMZ <BR>connection.<BR>See HOWEVER above.<BR><BR>case c) clients configured to use OUTSIDE DNS(s) -- you need forward rules <BR>to connect the clients to those servers, and you need rules to allow OUTSIDE <BR>servers to talk to your (presumably) authoritative servers.<BR><BR>Do you know that outside connections are working correctly coming into <BR>webservers and DNS servers?<BR>Are you sure that all servers in the DMZ have correctly configured netmask/<BR>default gateways?<BR>Please tell me th
 is is NOT a flat physical network (you do have two <BR>physically separate networks ... not two
 networks running on the same wire)<BR><BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
Yahoo! Photos - <a href="http://us.rd.yahoo.com/evt=21486/*http://f1.pg.photos.yahoo.com/ph//spsimplenol?.file=ny_ts_splash.html">Get your photo on the big screen in Times Square</a>
--0-615108996-1072125776=:58146--

