From: John Corps <envoys@gmail.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 12:28:14 -0500
Message-ID: <CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	<1360946103.2251.2.camel@andylaptop>
	<CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
	<1360947911.2251.24.camel@andylaptop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=axEhTRF51b0hnEukaQ/cyt7PSbFfUwd0i6ajU5tKuNM=;
        b=vJ11p3gMo0bdJBsDPrs156hIVtq9zAFxvsaejyv+IHmMDZo9DvpfBfMoUT5CXFICCv
         inVpoEjqz1BgCXHG/2VfNUZ55bWzqlFoZXo/inHcpSfx0I9sLomfR8MegDfUlSdoUqLV
         qBWOpvXt3TsHc+dpXJbSU64F4yP1qjTTw6NGjF/oK27QWYXqBTOZ+zWdzM8NioUajROo
         i9q593yOYIxfrfF7aIdGhKzCt1QhkPT32Rx0fntb2h3cHoDxdkvA0hVSPjzi5ztFfwUk
         Iek9bKpdId0+9uR6jvILWrMmlkRvT7k8V4ttfYT/Xz53qK9wYt3d6yUsfbNBtWdgy3ix
         qNqg==
In-Reply-To: <1360947911.2251.24.camel@andylaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Fri, Feb 15, 2013 at 12:05 PM, Andrew Beverley <andy@andybev.com> wrote:
> On Fri, 2013-02-15 at 11:46 -0500, John Corps wrote:
>> >> What I want to do is if
>> >> they set there own DNS, redirect them anyways back to the internal
>> >> DNS. Here are the only 2 rules I have tried but they do not work at
>> >> all, maybe i am missing something? Any help would be greatly
>> >> appreciated!
>> >>
>> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dport
>> >> 53 -j REDIRECT --to-ports 53
>> >> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dport
>> >> 53 -j REDIRECT --to-ports 53
>> >
>> > If you want to redirect the requests to the local server, then you'll
>> > need to use the DNAT target instead. All you're doing in your rules is
>> > changing to port 53 a packet that is destined to port 53 (so nothing at
>> > all).
>>
>> Tried this... and same result, page not displayed. Keep in mind these
>> are the only rules I have for iptables, do I need any other ones?
>
> [ Please don't top-post ]
>
>> iptables -t nat -A PREROUTING -p tcp --dport 53 -j DNAT
>> --to-destination 192.168.1.2:53
>> iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT
>> --to-destination 192.168.1.2:53
>
> It probably won't matter, but I would add the interface or source IP
> addresses, in order to only match packets from your local network.
>
> These 2 rules alone should work. To debug, I would change the target to
> LOG and check that the packets are being matched successfully.
>
>> iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
>> --to-destination 192.168.1.2:53
>> iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
>> --to-destination 192.168.1.2:53
>
> You don't need these. They may be messing up the packets being sent from
> the external DNS server.
>
> Andy
>
>

Very odd...put on a simple logging of
iptables -A INPUT -i eth1 -j LOG --log-prefix "DNS TEST INPUT drop: "

getting nothing in the logs...this is mind baffling. Even with TCPDUMP
not seeing any packets unless i set client DNS to local ip of server,
the 192.168.1.2 dns, set it to google for a test of 8.8.8.8 and get
nothing in logs or with tcpdump.
