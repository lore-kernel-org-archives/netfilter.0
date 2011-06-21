From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: IPTables Filtering traffic before Natting HOW TO?
Date: Tue, 21 Jun 2011 08:58:52 +0200
Message-ID: <BANLkTimL5KLG=4dgt-_kXY5Y4QsZOkuH-Q@mail.gmail.com>
References: <BANLkTim1uqdSWuQwsiJvEuw=cD0Pfi0=Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=THgyoLf5+/RVZLs7QyRT4c65ZJN0gPOJEFfdY993HsU=;
        b=w/1Kmc8xqr18y4vRmH0WI0T72DJd7Kt3Aex/wOpvbRKZzSenLKrCD0cZLXiLz04OQF
         MXjMD7TyRS9WonNAxaSl5wUsbBtFVOXfT9azjACwibd2CFxeWHCTTopGgp2wPmEDX6NE
         HG3BeaFjIkVRpx18FziVETn0ot6OMjsyPTglo=
In-Reply-To: <BANLkTim1uqdSWuQwsiJvEuw=cD0Pfi0=Zg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Auro Benas <ebay.omg@gmail.com>
Cc: netfilter@vger.kernel.org

Are you saying that xx1, xx2, etc. resolve to different IP that are
all present on interfaces of the FW itself?
Or are you saying that incoming connections that originate from the IP
corresponding to xx1 should reach one server, originating from xx2
another server, etc.?

If your FW public IP is 1.2.3.4, directing traffic to an internal
server is simply:
-t nat -A PREROUTING -j DNAT --to 10.10.0.1

This handles connection, i.e. traffic in both directions. You do not
need a separate SNAT rule to handle response traffic for such
connections. For incoming traffic, the FILTER part and the web server
will see the original source IP. As long as the servers default
gateway point to your FW, return traffic will be handled properly
without hiding/translating the true source address.

SNAT rules will be needed to make connections initiated from your
servers, (such as apt-get update), work.


PREROUTING does not make traffic skip the FILTER chains. Note that you
also have the raw table to filter before connection tracking and nat
occurs.

/Oskar


2011/6/21 Auro Benas <ebay.omg@gmail.com>:
> Dear Readers,
> I'm sorry to waste your time but I'm in death point of developing and
> today is 12Th day that I passed more than 13 hours a day on reading
> about IPTables and trying to make it work, i
>
> started dream about PREROUTING and POSTROUTING and I'm almost fused.
>
> I'm not an expert but I'm writing this message with hope that some on=
e
> will be so kind to reply and help me or at least indicate me the way.
>
> - What am I trying to get?
> I'm developing a DMZ with IPTable (from now on I'll refer as
> IPGServer) that behind the IPGServer will be between 10 to 30 apache
> servers witch will be connected to the Internet.
>
> 1 - I need AS FIRST OF ALL that the IPGServer do the job as IP BLACK
> LIST filter.
> 2 - I need AS SECOND that IPGServer route ONLY the filtered and
> allowed connections to the servers inside the DMZ.
> 3 - I need that the routing of the connections/request that was made
> by visitors with 10 to 30 third level domains (example:
> xx1.domain.com, xx2.domain.com, --- x30.domain.com)
> are recognize, converted to the apropriate private IP (I don't use DN=
S
> server as suggested to do that I found file HOSTS more clean and fast
> as solution) and forwarded to the apache
>
> destination server so xx1.domain.com --> 10.10.0.1 and so on.
>
> - My Data Flow Logic (I omitted some fases as input, output, forward
> in what follows):
> Client - Internet (Request xx1.domain.com) -->
> IPGServer-eth0 (Ex:62.10.30.30) -->
> Filter Source IP (IF match black list DROP =A0ELSE log connections an=
d
> forward to destination server) -->
> IPGServer-eth1 (10.0.0.1)-->
> PREROUTING -s xx1.domain.com DNAT --to 10.10.0.1 -->
> Internal Netowrk/switch -->
> Apache Web Server accept, process and send reply back to
> IPGServer-eth1 (10.0.0.1) -->
> POSTROUTING -s 10.10.0.1 --> SNAT xx1.domain.com -->
> eth0 (Ex:62.10.30.30) -->
> Internet (Request xx1.domain.com) -->
> Final Client --|
>
>
> - What have I accive till now?
> Well I accived to make the DMZ working as it must do with all the
> MASQUERADE stuff, PREROUTING, POSTORUTING, etc.
> I found the HOSTS file to configure to avoid DNS server configuration
> and network overuse.
> My APACHE WEB Servers are contacted from the Internet and thay can
> connect outside (Ex: sudo apt-get update - and so on).
> DMZ is really nice stuff and it works GREAT!
>
>
> - What is my problem than?
> Well in the DATA FLOW of the IPTAbles:
> http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch14_=
:_Linux_Firewalls_Using_iptables
>
> I see that the first table that is "touched" by the incoming packet i=
s
> the PREROUTING and I you can believe me it works precisely in this
> way, I tested and retested this tenths of
>
> times
> So I conclude that PREROUTING is my MAIN problem!!!!!
>
> Why??
> Well How do I filter witch IPs are allowed and witch no to pass insid=
e
> the private network if PREROUTING exlude my FILTER table?
>
> Why I need PREROUTING?
> I'll not teaching you nothing new but I need it to NAT the third leve=
l
> domains and redirect tham to the defined APACHE WEB server that stay
> in the private network.
>
> I'm unable to do this.
> I readed and re readed the HOWTO guides that I found on netfilter.org=
 as:
> http://netfilter.org/documentation/HOWTO//NAT-HOWTO.txt
>
> Mylast hope before contacting you guys was the point 9 ( 9. Mixing NA=
T
> and Packet Filtering) in this guide:
> http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO.txt
>
> but I'm sorry I surrender I really don't understand how that works.
>
> I hope to get a reply to solve my problem because I'm really don't
> know what I'm doing wrong or what I'm not doing.
>
> Thank you in advance for any suggestion or solution related to my pro=
blem.
>
> Best regards,
> Auro B.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
