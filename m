From: "Pranav Desai" <pranavadesai@gmail.com>
Subject: Re: Some weird issue with return traffic with redirect rule
Date: Tue, 21 Oct 2008 15:53:19 -0700
Message-ID: <cc64e8ce0810211553l6ee01defo5ea673fe4c402c99@mail.gmail.com>
References: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
	 <48F8C91E.5010608@riverviewtech.net>
	 <cc64e8ce0810171246j131d3651rea38e4efee507608@mail.gmail.com>
	 <48FCF701.20709@riverviewtech.net>
	 <cc64e8ce0810201902l3ae281eeoa49b715d45c94d9c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=FYbAJnpDbB0RFKgTRQZ6DpFPXqApVxXvFwqkpSpcqzE=;
        b=M5zpbdO5oqcd/v3BGW81/fyccwYHizhud4iR4A+ziJfkHuBWgDJ136huKxmL26/Yrc
         rQO/YANPG5vSYyftZvZO+D0VbfDenSB0EOE2Infzg1xzoEaXpsRgwpFOktlv31TVJjxA
         m0MGF5BLdR+b0TFr0Y2NJ8ENdIMiHCGu6mH7k=
In-Reply-To: <cc64e8ce0810201902l3ae281eeoa49b715d45c94d9c@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

The issue is related to the conntrack timeouts and tcp retries.
Thought of updating the thread, in case anyone else is looking.

Here is how you can reproduce it ...

* Set the conntrack last ack timeout to something low and the retries1
to high, so force this behavior

sysctl -w net.ipv4.tcp_retries1=10
sysctl -w net.ipv4.netfilter.ip_conntrack_tcp_timeout_last_ack=15

* Add a redirect rule to the server
 iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8001
* make a connection to a server on port 80 which has a redirect rule.
* send some data to make sure everything is ok.
* Add iptables drop rules on the client to block anything to and from
the server.

iptables -A OUTPUT -p tcp -d <serverIP> -o eth1 -j DROP
iptables -A INPUT -p tcp -s <serverIP> -i eth1 -j DROP

* close the server.
* You should see a bunch of FINs going out
* Also check the conntrack entry for the connection, it will be in
LAST_ACK state.
* Any remaining FINs (out of 10) that goes out after the entry has
been removed, will go out with the original port and not the redirect
port.

So, as a solution you have to make sure that the conntrack entry stays
as long as TCP is going send data.
In my case, the one originally mentioned in the thread, the network is
quite bad, so the retransmit interval is quite high, as a result of
which the conntrack entry expires and the pkts are sent out with wrong
src port.

-- Pranav

On Mon, Oct 20, 2008 at 7:02 PM, Pranav Desai <pranavadesai@gmail.com> wrote:
> On Mon, Oct 20, 2008 at 2:24 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
>> On 10/17/08 14:46, Pranav Desai wrote:
>>>
>>> Too many clients will have to change their settings. Not feasible in our
>>> case.
>>
>> *nod*
>>
>> This is where auto-configure scripts come in to play.
>>
>> If you can't, you cant.  No point in ruffling any feathers over it.  If
>> transparent proxying is working for you then go for it.
>>
>>> There is no info there, and the tables are not getting full. Here are the
>>> conntrack settings.
>>>
>>> net.ipv4.ip_conntrack_max = 1048576
>>> net.ipv4.netfilter.ip_conntrack_buckets = 1048576
>>> net.ipv4.netfilter.ip_conntrack_count = 63908
>>> net.ipv4.netfilter.ip_conntrack_max = 1048576
>>
>> If conntrack is not getting full I wonder if some packets are accidentally
>> not being associated and thus not being handled correctly.
>>
>> Dare I say it, you may be looking at setting up TCPDump (or the likes) to
>> record all packets.  That way when you do have packets that did not get
>> handled correctly you can go back and look at the rest of the packets that
>> should have been associated but were not.
>>
>
> I did. I can attach the raw trace as well, but not sure if the mailer
> accepts it. So describing it here.
>
> Just to reiterate the setup.
> Its a transparent proxy with tproxy. The redirect rule on the
> client-side redirects all port 80 traffic to port 8001 which is my
> proxy port.
> Proxy IP: 10.10.224.6
> Origin Server: 81.176.228.109
> Client IP: 10.1.21.202
>
> As you can see the client makes the connection, sends the GET request
> (pkt 3). The Proxy ACKs with the origin server IP.
> Sends the HTTP response (pkt 5). Retransmits it (pkt 6 and 7) not sure
> why the time period between the retransmits is that large. I was
> expecting a to be much smaller. Anyway, maybe someone here has an idea
> why its that way.
>
> Then the client sends a FIN and the proxy ACKs it, and then the last
> pkt is the problem pkt where the proxy sends it out using it own IP
> and port.
>
> So I am guessing that the conntrack expires by then and the pkt goes
> out without any change ? Any thoughts ?
>
> There are other cases where the FIN,ACK is retransmitted multiple time
> and the last one in them is with src port 8001.
>
> The client-proxy connection is a radio link, hence the crappy performance.
>
> -- Pranav
>
> =====> trace <====
> 13:00:40.468612 IP 10.1.21.202.42472 > 81.176.228.109.80: S
> 260637943:260637943(0) win 48960 <mss 1360,nop,nop,timestamp
> 3503521357 0,nop,wscale 0,nop,nop,sackOK>
> 13:00:40.468631 IP 81.176.228.109.80 > 10.1.21.202.42472: S
> 1982162570:1982162570(0) ack 260637944 win 5792 <mss
> 1460,sackOK,timestamp 128429945 3503521357,nop,wscale 2>
> 13:00:46.809934 IP 10.1.21.202.42472 > 81.176.228.109.80: P
> 260637944:260639005(1061) ack 1982162571 win 48960 <nop,nop,timestamp
> 3509490107 128429945>
> 13:00:46.809955 IP 81.176.228.109.80 > 10.1.21.202.42472: . ack
> 260639005 win 1979 <nop,nop,timestamp 128431530 3509490107>
> 13:00:50.202386 IP 81.176.228.109.80 > 10.1.21.202.42472: P
> 1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
> 128432378 3509490107>
> 13:01:04.897471 IP 81.176.228.109.80 > 10.1.21.202.42472: P
> 1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
> 128436052 3509490107>
> 13:01:34.292153 IP 81.176.228.109.80 > 10.1.21.202.42472: P
> 1982162571:1982163119(548) ack 260639005 win 1979 <nop,nop,timestamp
> 128443400 3509490107>
> 13:01:59.589460 IP 10.1.21.202.42472 > 81.176.228.109.80: F
> 260639005:260639005(0) ack 1982162571 win 48960 <nop,nop,timestamp
> 3582324982 128431530>
> 13:01:59.589493 IP 81.176.228.109.80 > 10.1.21.202.42472: F
> 1982163119:1982163119(0) ack 260639006 win 1979 <nop,nop,timestamp
> 128449724 3582324982>
> 13:02:33.077175 IP 10.10.224.6.8001 > 10.1.21.202.42472: P
> 1982162571:1982163119(548) ack 260639006 win 1979 <nop,nop,timestamp
> 128458096 3582324982>
> =====> trace <====
>
>>
>>
>> Grant. . . .
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
