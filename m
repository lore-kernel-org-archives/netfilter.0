From: Payam Chychi <pchychi@gmail.com>
Subject: Re: Figuring out odd web traffic from clients
Date: Fri, 16 Mar 2012 15:39:08 -0400
Message-ID: <57888158-3304-429D-B058-052FB839B0F7@gmail.com>
References: <CABqG1H8VJuXgPuNWa=8it1TCeDOXYL3LtOVKix3Xv7Un-=yRaw@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:in-reply-to:mime-version:content-transfer-encoding
         :content-type:message-id:cc:x-mailer:from:subject:date:to;
        bh=ahXGO+ZMljbgTkfzxSPAt0bqFH9q+fF2GbUp5gfG6UY=;
        b=JWl4+WnGyHLtz2UFuVgYNDyjpSFatANpl9rJQbAjL7jSdXfjsHhkp5K2OexfbkALPU
         jLf4aFyhqRmFHMvFhpqM8UHQOffNZDYDwNpahk+1S72TVXtzdalmT/GV99OAmYh8al0J
         +D7UXZug35PZz9geUIUzhZvtnwK1bnnVNb4oSwkaMyjwbGR8FGycMSWO0Vtzm7r9Ss//
         hcO989XhTYvpd7jHyiuLaBBo/M+yl1U390DKQ+61N3cG5DmljjQMpT4Ee6IgwmtihJf4
         5Ex9zqg6XYsoNeXEVCuShu0QgQnoakBh57PupwTw10Lv0A6780i0KsjlakyKX4vWvsBZ
         s3sg==
In-Reply-To: <CABqG1H8VJuXgPuNWa=8it1TCeDOXYL3LtOVKix3Xv7Un-=yRaw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miles Stevenson <miles@mstevenson.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

sounds like a timeout value discrepancy issue somewhere either between ur backend and ur firewall or on an application level

hit me up offline if u nee any help, i can take a look 

cheers

Sent from my iPhone

On 2012-03-16, at 1:22 PM, Miles Stevenson <miles@mstevenson.org> wrote:

> I'm trying to figure out a strange traffic pattern that I've seen on
> our firewalls for a few years now. It doesn't affect our production
> services, but I never figured out exactly what is going on. Recently,
> I switched out our OpenBSD firewalls to Ubuntu firewalls, and I see
> the same traffic pattern, so I know that it wasn't some oddity with
> OpenBSD, carp, or pf. Maybe someone here has an idea?
> 
> My setup is a single Ubuntu server firewall acting as a gateway
> between the internet, a DMZ network which hosts web servers, and an
> internal/private network which hosts DB servers. We are a LAMP shop.
> So, web connections are coming in from the Internet to our Apache
> servers on the DMZ.
> 
> My firewall configuration is using fairly straight forward
> state-tracking rules with no rate limiting or burst control or
> anything like that. Here is a sample:
> 
> #Allow HTTP traffic to all DMZ IPs
> -A FORWARD -p tcp -o $dmz_if -s 0/0 --sport 1024: -d $dmz_net --dport
> 80 -m state --state NEW -j LOGNEW
> -A FORWARD -p tcp -o $dmz_if -s 0/0 --sport 1024: -d $dmz_net --dport
> 80 -m state --state NEW,ESTABLISHED -j ACCEPT
> -A FORWARD -p tcp -i $dmz_if -s $dmz_net --sport 80 -d 0/0 --dport
> 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> 
> So, nothing fancy here, other than the fact that I try to be as
> descriptive as possible with my rules, and I like to log the SYN
> packets for new connections simply so I have those logs for auditing
> and troubleshooting. Of course, I REJECT anything else by default.
> 
> The strange thing, is that during peak traffic hours, I see a lot of
> traffic getting rejected by the firewall that is destined to port 80
> on the web servers. These indicate to me that the packets are not part
> of an existing session in the state table. Here are some sample logs:
> 
> [REJECT] IN=eth2 OUT= SRC=<client> DST=<server> LEN=40 TOS=0x00
> PREC=0x00 TTL=118 ID=8748 PROTO=TCP SPT=63533 DPT=80 WINDOW=65535
> RES=0x00 ACK FIN URGP=0
> 
> [REJECT] IN=eth2 OUT= SRC=<client> DST=<server> LEN=40 TOS=0x00
> PREC=0x00 TTL=118 ID=11934 PROTO=TCP SPT=63532 DPT=80 WINDOW=65535
> RES=0x00 ACK FIN URGP=0
> 
> 
> [REJECT] IN=eth2 OUT= SRC=<client2> DST=<server> LEN=40 TOS=0x00
> PREC=0x00 TTL=51 ID=16661 DF PROTO=TCP SPT=59503 DPT=80 WINDOW=0
> RES=0x00 ACK RST URGP=0
> 
> [REJECT] IN=eth2 OUT= SRC=<client2> DST=<server> LEN=40 TOS=0x00
> PREC=0x00 TTL=51 ID=16662 DF PROTO=TCP SPT=59505 DPT=80 WINDOW=0
> RES=0x00 ACK RST URGP=0
> 
> 
> Notice that some clients are attempting to send FIN, while others
> attempt to send RST. I get clumps of 4-5 of these every 20 seconds or
> so, usually from different client IP's when the web servers are busy.
> Also, our datacenter is on the east coast USA, and most of our clients
> are connecting from Europe, but we have small pockets all over the
> world. Just in case you were wondering about the low TTL values.
> 
> Apache logs show valid conversations with these same client IP's, and
> the timestamps on those are about 1-2 minutes before these packets
> described above get rejected. All of our servers are NTP synchronized,
> which helps creating a timeline across servers.
> 
> To try and figure out more of what is going on, I set up the following test:
> 
> -Set up tcpdump to capture all the web traffic on the external
> interface of the firewall.
> -Set up tcpdump to capture all the web traffic on the web server interface.
> -Compared the data between the timestamps of when things get blocked
> on the firewall, web log data from the same client IP, and what I see
> in both tcpdump data files.
> 
> What I'm seeing is kind of strange. I'll paraphrase instead of posting
> lots of logs to keep things short.
> 
> 1. The client starts up a legit TCP 80 session with the web server.
> Those get through the firewall normally and I see the full
> conversation with tcpdump.
> 2. There are usually some duplicate ACK's, retransmissions, or a few
> out of order packets, since most of our clients are several hops away
> in the UK, but TCP always handles the problem.
> 3. At the end of the web session, the web server closes the session
> cleanly using FIN.
> 4. The client ACK's the FIN, with the next sequence number.
> 5. For some reason, the client sends a RST, which seems unnecessary to
> me, since the connection is already closed with FIN.
> 6. All packets related to this socket stop.
> 7. Steps 1-6 happen at the same time for a few different sockets
> simultaneously, since the client tends to open 2-4 HTTP sessions at
> once.
> 8. A few minutes later, after all those sessions have closed, the
> client for some reason sends either a FIN, or a RST for a socket that
> never existed. This gets blocked by iptables because it does not
> belong to any open session in the state table. They are using a SRC
> PORT and sequence number that has never existed in any of the
> conversations. None of my tcpdump data captured from both the firewall
> or the web server shows a SYN ever coming in with that SRC PORT.
> 
> This seems like some weird bug or problem with the client browser. But
> we get this constantly from different clients all over the world, and
> this has been going on for a few years at least for us. The user agent
> string for the connection I just looked at was:
> 
> User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SHTTP/1.1 200 OK
> 
> Which is a fairly wide-spread browser and version. Maybe this is some
> kind of odd bug in IE or something? Does anyone have an
> experience/advice with this? This really doesn't seem to cause a
> problem at all, so I'm considering completely filtering this out from
> getting logged and completely ignoring it. But I'd really like to know
> what is going on if possible.
> 
> The only other thing I can think of, is that maybe when the client
> first connects to our web server, some of the SYN requests from the
> client never make to the server but some do. The SYN's that never make
> it to us simply expire from the clients' perspective, and then they
> eventually end up sending a RST or FIN for a socket that our firewall
> never received. As far as the reason why some of the SYN's would make
> it to us and some wouldn't, I guess that could be any number of things
> from router problems to firewalls on the client side.
> 
> Thanks a bunch for any advice.
> 
> -Miles
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
