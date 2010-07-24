From: Elison Niven <elison.niven@gmail.com>
Subject: Re: Limiting bandwidth on router
Date: Sat, 24 Jul 2010 21:19:54 +0530
Message-ID: <AANLkTi=CW5-iB556Ei4x0rgnu5cpSdaGj5aHtNoQ41vS@mail.gmail.com>
References: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
	<4C4997CC.4010502@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ddvXBBcQPPHji9Pze5RIZQoGbBi9QRatUIPO98ZAVHU=;
        b=WeVgLTU2VMpEyCtiXJkFDie6hpWsht6EBR0y9yuSabcQr+DHYxagbAL4betft/3XdC
         J5UcymY464K/y1U75vqtVJ2vd4Y+ZlNpW12I/3IbqtkM0K0Qjtfta6Bpz9oc3Z0byFIx
         O50ppuBR/f7+lLawzQcjIkLcfAJm47CFg7xMU=
In-Reply-To: <4C4997CC.4010502@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

On Fri, Jul 23, 2010 at 6:53 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Elison Niven a =E9crit :
>>
>> I have an ARM based board with 2 ethernet interfaces eth0 and eth1.
>> eth0 - LAN interface. 192.168.2.149
>> eth1 - WAN interface. 192.168.1.149
>> I have setup a simple router using iptables that allows PCs on the L=
AN
>> to browse the internet via the WAN.
>> I want to limit incoming bandwidth on the LAN interface to about
>> 8mbit/s as when there are massive data transfers initiating from the
>> PCs on the LAN, the system is under heavy load and is not able to
>> execute any applications.
>>
>> I tried to limit the bandwidth using tc's tbf and ingress but it isn=
't
>> really working well.
>> For example from a PC on the LAN (ip 192.168.2.13, default gw
>> 192.168.2.149)
>> # ping -f -s 1000 192.168.1.3
>> This is correctly limited and ping results show the loss.
>>
>> # ping -f -s 1 192.168.1.3
>> Here the system is under heavy load and is not able to execute any
>> applications. No loss in ping.
>
> This result may indicate that the router's load depends more on the p=
acket
> rate than the bandwidth, which makes sense. So it may be more efficie=
nt to
> limit the packet rate instead of the bandwidth.
>
>> Also when I create a udp socket from this PC to an address on the WA=
N,
>> the rate is not limited.
>> #./udpclient 20000 192.168.1.3 20000 1000
>> This utility sends 20000 packets of 1000 bytes each to 192.168.1.3.
>> Here also the rate is not limited.
>
> I did not understand well whether you want to limit incoming (WAN to =
LAN) or
> outgoing (LAN to WAN) traffic. The ping test above does not tell whet=
her
> incoming (echo reply) or outgoing (echo request) traffic is limited.
>
> Also, remember that by definition received traffic rate cannot be dir=
ectly
> controlled. All you can do is drop incoming packets. Due to TCP
> acknowledgement and congestion control mechanism, the sender will int=
erpret
> the packet loss as congestion and reduce the sending rate. But UDP ha=
s no
> such mechanism. Anyway, does this really matter ? If the heavy data
> transfers use TCP, it should work. Did you test it ?
>
>
>

Thanks for the reply, I will test with tcp and send the relevant
iptables and tc rules that i have used.

Regards,
Elison
