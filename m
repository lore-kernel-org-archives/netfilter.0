From: prmarino1@gmail.com
Subject: Re: Forward all incoming connection to other address
Date: Sun, 08 Mar 2015 13:32:43 -0400
Message-ID: <20150308173243.5927060.22776.4225@gmail.com>
References: <20150308162558.44F3AD5428@emkei.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :subject:from:in-reply-to:references:to;
        bh=OkMMCPXOXDdvhGsz8TEBUgN4QrZgpDY91dG9rJJOjqE=;
        b=HkRyWs9CfMIbFxbDYcf1WIkXuusaFCGmES+zV/C4XE3SxgJAFeMDBxgmIMIZ6x11Hc
         wH1300PizaT/96wdnR6CCtJFk7cG3DGd75Corj0+LNbDGXHGppAOQu2rhckKgqJq1okI
         ceJeqaaU2WDMFDmDjeaLWG9+3vkD4VcEIATcQj0RAwgQG1e8AzlGlXTHYT8disFllldg
         +Syu4WGw5hWc0CmpEAwhTsPM2K5afGRuO5gHaCxuaIrnR3RdyciwwavZbwxxNenDOuME
         kcqwHP2Y1Tz8Fxh2qns9NSD19iquCK8d3bWN9jur0PIxDZQp17dSQmAINVcz00RyuasB
         UVTg==
In-Reply-To: <20150308162558.44F3AD5428@emkei.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: nima.afshari.1389@gmail.com, netfilter@vger.kernel.org

You may also need to alter the mac address as well because unless this =
box is the default gateway for the destination host the responses would=
 be coming from a different mac address so the clients will th=E2=80=8E=
ink you are trying to spoof the traffic.

Sent from my BlackBerry 10 smartphone.
=C2=A0 Original Message =C2=A0
=46rom: Nima Afshari
Sent: Sunday, March 8, 2015 12:27
To: netfilter@vger.kernel.org
Reply To: nima.afshari.1389@gmail.com
Subject: Forward all incoming connection to other address

Hello Folks.
I want to Forward all incoming connection to other address. I use Below=
 iptable rule :

iptables -t nat -A PREROUTING -p tcp -m tcp ! --dport 22 -j DNAT --to 1=
=2E2.3.4

But not worked? I added same rule with "udp" protocol too but when I sc=
anning my system With Nmap, Nmap scan my address and not 1.2.3.4

Any idea to solve it?
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
