From: "Pranav Desai" <pranavadesai@gmail.com>
Subject: Re: Some weird issue with return traffic with redirect rule
Date: Mon, 20 Oct 2008 19:02:13 -0700
Message-ID: <cc64e8ce0810201902l3ae281eeoa49b715d45c94d9c@mail.gmail.com>
References: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
	 <48F8C91E.5010608@riverviewtech.net>
	 <cc64e8ce0810171246j131d3651rea38e4efee507608@mail.gmail.com>
	 <48FCF701.20709@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=DGIHOiGtDVyr/n9N+gRPqt218TGXgDg1DUz2uTog+zQ=;
        b=OACbGO18LqWQU0SCgBFyaskL8SM+YbYQys+yxLwLcKwimgOxHxfETVMDu4HbM4bth0
         SRyrUlMpbjlJF6j+9uBddjopXjZ04cQDXom4H7OVZZo9/CtSi0qz5bsJi1eBbsszwh8J
         1jLSW1l1jMTLgtS5L0a58zbRFoMXNsUvMuAHA=
In-Reply-To: <48FCF701.20709@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Mon, Oct 20, 2008 at 2:24 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 10/17/08 14:46, Pranav Desai wrote:
>>
>> Too many clients will have to change their settings. Not feasible in our
>> case.
>
> *nod*
>
> This is where auto-configure scripts come in to play.
>
> If you can't, you cant.  No point in ruffling any feathers over it.  If
> transparent proxying is working for you then go for it.
>
>> There is no info there, and the tables are not getting full. Here are the
>> conntrack settings.
>>
>> net.ipv4.ip_conntrack_max = 1048576
>> net.ipv4.netfilter.ip_conntrack_buckets = 1048576
>> net.ipv4.netfilter.ip_conntrack_count = 63908
>> net.ipv4.netfilter.ip_conntrack_max = 1048576
>
> If conntrack is not getting full I wonder if some packets are accidentally
> not being associated and thus not being handled correctly.
>
> Dare I say it, you may be looking at setting up TCPDump (or the likes) to
> record all packets.  That way when you do have packets that did not get
> handled correctly you can go back and look at the rest of the packets that
> should have been associated but were not.
>

I did. I can attach the raw trace as well, but not sure if the mailer
accepts it. So describing it here.

Just to reiterate the setup.
Its a transparent proxy with tproxy. The redirect rule on the
client-side redirects all port 80 traffic to port 8001 which is my
proxy port.
Proxy IP: 10.10.224.6
Origin Server: 81.176.228.109
Client IP: 10.1.21.202

As you can see the client makes the connection, sends the GET request
(pkt 3). The Proxy ACKs with the origin server IP.
Sends the HTTP response (pkt 5). Retransmits it (pkt 6 and 7) not sure
why the time period between the retransmits is that large. I was
expecting a to be much smaller. Anyway, maybe someone here has an idea
why its that way.

Then the client sends a FIN and the proxy ACKs it, and then the last
pkt is the problem pkt where the proxy sends it out using it own IP
and port.

So I am guessing that the conntrack expires by then and the pkt goes
out without any change ? Any thoughts ?

There are other cases where the FIN,ACK is retransmitted multiple time
and the last one in them is with src port 8001.

The client-proxy connection is a radio link, hence the crappy performance.

-- Pranav

=====> trace <====
13:00:40.468612 IP 10.1.21.202.42472 > 81.176.228.109.80: S
260637943:260637943(0) win 48960 <mss 1360,nop,nop,timestamp
3503521357 0,nop,wscale 0,nop,nop,sackOK>
13:00:40.468631 IP 81.176.228.109.80 > 10.1.21.202.42472: S
1982162570:1982162570(0) ack 260637944 win 5792 <mss
1460,sackOK,timestamp 128429945 3503521357,nop,wscale 2>
13:00:46.809934 IP 10.1.21.202.42472 > 81.176.228.109.80: P
260637944:260639005(1061) ack 1982162571 win 48960 <nop,nop,timestamp
3509490107 128429945>
13:00:46.809955 IP 81.176.228.109.80 > 10.1.21.202.42472: . ack
260639005 win 1979 <nop,nop,timestamp 128431530 3509490107>
13:00:50.202386 IP 81.176.228.109.80 > 10.1.21.202.42472: P
1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
128432378 3509490107>
13:01:04.897471 IP 81.176.228.109.80 > 10.1.21.202.42472: P
1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
128436052 3509490107>
13:01:34.292153 IP 81.176.228.109.80 > 10.1.21.202.42472: P
1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
128443400 3509490107>
13:01:59.589460 IP 10.1.21.202.42472 > 81.176.228.109.80: F
260639005:260639005(0) ack 1982162571 win 48960 <nop,nop,timestamp
3582324982 128431530>
13:01:59.589493 IP 81.176.228.109.80 > 10.1.21.202.42472: F
1982163119:1982163119(0) ack 260639006 win 1979 <nop,nop,timestamp
128449724 3582324982>
13:02:33.077175 IP 10.10.224.6.8001 > 10.1.21.202.42472: P
1982162571:1982163119(548) ack 260639006 win 1979 <nop,nop,timestamp
128458096 3582324982>
=====> trace <====

>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
