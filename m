From: "Roderick Groesbeek" <r.groesbeek@triple-it.nl>
Subject: RE: conntrack generates UDP 'ghost traffic'
Date: Fri, 16 Oct 2009 12:57:43 +0200
Message-ID: <3F6AD08836AD044C935E9FAC3A76474201366842@pandora.triple.lan>
References: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan> <1255686963.25297.22.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <1255686963.25297.22.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Hi Thomas,

Thnx for your reply.

>From: Thomas Jacob [mailto:jacob@internet24.de]
>Sent: Fri 10/16/2009 11:56
>To: Roderick Groesbeek
>Cc: netfilter@vger.kernel.org
>Subject: Re: conntrack generates UDP 'ghost traffic'
>

>Not that I fully understand your setup from your description, but
unless
>you are doing something with broadcasts/multicasts (which I don't see
>from your post):
>
>Assuming that pollux is the NAT router, Tiss has IP 192.168.14.57, the
>public IP of your NAT router is 213.132.176.3  and the Anroid device
has
>IP 93.187.9.29,

Almost right. :)
The situation is:
Android(192.168.14.57) <-> Pollux(213.132.176.3) <-> Tiss (93.187.9.29)


> the most likely cause of the flood is that the standard
>algorithm of Ethernet switches is sending your packets out to all ports
>because the switch has not learned a source port for the MAC you are
>sending your packets to (i.e. the MAC of pollux), which
>usually only happens when the switch does not receive any packets from
>that MAC (i.e. your NAT router). This should be visible in the station
>table of your switch.

The switches are indeed degragaded for this kind of traffic to HUB. 
Because this MAC can not be found in the FDB. (The android mobile has
suddenly been switched off)

>
>And since you cannot even do ARP resolution for Tiss from pollux, there
>is definitely something blocking communications. You should investigate
>what that something is...

Well ARP resolution for the Android from pollux would solve the problem 
indeed.
Because then the traffic would not flood on the switch infrastructure 
(HUB traffic).

But the Android Mobile is down!
Attaching that IP to some other device (or faking arp) will indeed fix 
the FLOODING issue, but I'm
more interested into solving this issue, so that it cannot occur.

Something I can come up with is: automatic lower TCP KEEPALIVE 
established time for NF_CONNTRACK_RTSP connections.
Currently it is 43200 seconds.

But I would think that the tcp_keepalive_intvl 
(http://www.frozentux.net/ipsysctl-tutorial/ipsysctl-tutorial.html#AEN37
5)
would have kicked in at every 75 seconds. But it looks like that is not
for NAT'ed TCP connections.


So my NAT router (pollux) happily keeps the TCP connection open to TISS
for a "dead android mobile", so our
TISS software keeps on streaming UDP packets, and my NAT router keeps
flooding the UDP packets to our switch infrastructure.


Probably the Linux NAT router should check more regularly the 'internal'
TCP connections (keep-alive), but it seems like
it is not doing it.
If the TCP connections breaks, TISS will stop sending UDP packets.
(It is not in the RTP/RTSP standard though, but quite common for RTSP
streaming servers, and we have implemented it so.)


But the NAT router is "keeping the TCP connection alive".
Result: 5 days (432100 seconds) of UDP floods inside our network :)


GR,
RG
