From: senthilkumaar2021 <senthilkumaar2021@gmail.com>
Subject: kernel panic
Date: Mon, 17 May 2010 15:12:09 +0530
Message-ID: <4BF10F71.2050409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=MsK58q+eQszYoln468mLFCets5bUa7KuM8y+zK9azKA=;
        b=TZkvfomgb1DlcGk21kLXFerRXvmViVJxUpo6YwKdbPASS0aaDwdUDHw1cMncq7zfjh
         r2X1dFM0gM8tCCmLvYT6hG09MNX95+MyjqijVgtLaFPQneU5IWPgaUGiCMurHeNwuW4c
         8I+O5sAD9jmKASf473jmsqCKSEQ3Xthv6I1ts=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: marek@piasta.pl
Cc: netfilter@vger.kernel.org

Hi

Thanks for the reply

I was using kernel 2.6.28.5 and 2.6.30.5 but i got kernel panic in both 
versions

my iptable and ebtable are as follows

iptables -t mangle -N DIVERT
iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY --tproxy-mark 0x1/0x1 --on-port 3129

 ebtables -t broute -A BROUTING -i $CLIENT_IFACE -p ipv4 --ip-proto tcp --ip-dport 80 -j redirect --redirect-target DROP

 ebtables -t broute -A BROUTING -i $INET_IFACE -p ipv4 --ip-proto tcp --ip-sport 80 -j redirect --redirect-target DROP

Regards
senthil

> Hi,
>
> >I am using iptables version 1.43 and getting the following error in
> >machine while using squid in tproxy.we are using Linux machine as
> >bridge too
> >i was able to capture part of the error only please help me in solving
> >the issue
>
> What kernel version are you using? I don't know if it's the same
> problem but I was experiencing kernel panic with tproxy in recent
> kernels if there were any traffic to port 80 to the box itself. I was
> able to workaround the problem using RETURN target on the local traffic
> before "-m socket" match and DIVERT target.
>
> XX.XX.XX.XX in the example is the local box address.
>
> My mangle starts this way:
>
>        IPTM="${IPT} -t mangle"
>        echo $" * Launching mangle RULEZ..."
>
>
>        # Setup a chain DIVERT to mark packets
>        $IPTM -N DIVERT
>        $IPTM -A DIVERT -j MARK --set-mark 1
>        $IPTM -A DIVERT -j ACCEPT
>
>        # Bez przekierowywania na proxy w przypadku polaczen do 
> lokalnego serwera www (videocache)
>        $IPTM -A PREROUTING -p tcp -d XX.XX.XX.XX --dport 80 -j ACCEPT
>
>        # Use DIVERT to prevent existing connections going through 
> TPROXY twice
>        $IPTM -A PREROUTING -p tcp -m socket -j DIVERT --dport 80       
> # regula dla ruchu klienci->swiat
>        $IPTM -A PREROUTING -p tcp -m socket -j DIVERT --sport 80
>
>
> Hope this helps.
>
> Best regards,
> Marek
