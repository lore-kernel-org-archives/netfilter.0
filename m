From: John Corps <envoys@gmail.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 14:19:57 -0500
Message-ID: <CAFURDX9zCPW9e85sexJcF2T7O5J=beJ1QZabUhQ7C3jZR48QHw@mail.gmail.com>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	<1360946103.2251.2.camel@andylaptop>
	<CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com>
	<1360947911.2251.24.camel@andylaptop>
	<CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
	<F86EAF6A-D26B-4162-8E1A-C3123FB89F31@logix.net.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=x19iZHRNoi8eKTbzXYSqHjnuBv8SwSfDZy709hkpYMc=;
        b=W2ijR7YFfXTQvL2kP4804e7EHsnMXnZBVnOQ+IFXcHiCr/9Nh6XvqU9B4DHsGsZS6k
         swV7Tcgm6bbx5cJgLarTSNenM5DCkfvQWugHcDVIYrIZXBgHweSG/MasI3Hk6nplOUwc
         /4KDzZaly3JUvojaoIJiOyn9lDSpLkcX8DB+lO8UPmqSuXC0/JYblRgi9O4o0fJTv2oF
         G1qK7IgH4nLrLcPW/xxEbBZkCRGTes9V+fn9uHH9uWyEXDtwBJl3Mr1iqFA6/lCzqI/s
         frvfDEP27C2uPlRMACxTUJlOpbTf8A7kYGeWvsQ+QE87YHwRaP+PBypFTWncvxMOF+7h
         wwFA==
In-Reply-To: <F86EAF6A-D26B-4162-8E1A-C3123FB89F31@logix.net.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ludvig <mludvig@logix.net.nz>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Feb 15, 2013 at 2:15 PM, Michael Ludvig <mludvig@logix.net.nz> wrote:
> On 16/02/2013, at 6:28, John Corps <envoys@gmail.com> wrote:
>
>> Very odd...put on a simple logging of
>> iptables -A INPUT -i eth1 -j LOG --log-prefix "DNS TEST INPUT drop: "
>>
>> getting nothing in the logs...this is mind baffling. Even with TCPDUMP
>> not seeing any packets unless i set client DNS to local ip of server,
>> the 192.168.1.2 dns, set it to google for a test of 8.8.8.8 and get
>> nothing in logs or with tcpdump.
>
> Let me guess - your DHCP doesn't provide default gw, only client IP and DNS server.
>
> With no default route the requests to 8.8.8.8 don't even make it out from the client (no route to host). With 192.168.1.2 it works because that IP is on the same subnet as the client and doesn't require default route to reach it.
>
> Could that be the reason? Just a guess...
>
> Michael
>

DHCP is definitely giving out the default gateway to the clients of 192.168.1.2.
