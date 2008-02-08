From: "casfre@gmail.com" <casfre@gmail.com>
Subject: Fwd: strange ACK SYN URGP=0 in an iptables firewall with statefull enabled.
Date: Thu, 7 Feb 2008 22:31:14 -0200
Message-ID: <aaef12150802071631s34c5ce15tf044d14f91356184@mail.gmail.com>
References: <aaef12150802071410r1e6d66ffw57a3557da6751965@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=0DmvbeFp6hXAFs+DlU6JwlRLtQkIBtiQd0w/tbi0l84=;
        b=dt6JiJQ1kDYh5/dgi8v3NbJF0s4bmDhOHFzLKFFw+B2vcqWX+ro91mC2VGE5wEEOouESCeGSIyv3/ucX13A+i7koWUyGM3V39VHtH99czAVtFyqbFwu+brQJrFDARTICBmh4AFsKa37axxKXYqZIrkSCdRutIAg5QsUXyyWmllA=
In-Reply-To: <aaef12150802071410r1e6d66ffw57a3557da6751965@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

     Additional information.

     Dropped packages are in the filter FORWARD chain.

     Packages coming from eth2(DMZ) to eth0(INTERNET) are
NEW,RELATED,ESTABLISHED ACCEPT and, packages coming from eth0 to eth2
are RELATED,ESTABLISHED.

     This way: iptables -A FORWARD -i eth2 -o eth0 -s one.of.my.ips -d
200.x.x.x --dport 80 -m state --state NEW,RELATED,ESTABLISHED -j
ACCEPT
                    iptables -A FORWARD -i eth2 -o eth0 -j
drop-log-some-chain-made-by-me ( <- here, LOG and DROP ).
                    iptables -A FORWARD -i eth0 -o eth2 -d
one.of.my.ips -s 200.x.x.x --sport 80 -m state --state
RELATED,ESTABLISHED -j ACCEPT
                    iptables -A FORWARD -i eth0 -o eth2 -j
drop-log-some-chain-made-by-me  ( <- here, LOG and DROP ).

     Dropped packages ARE NOT from any of my LAN's ips.

      Well, thank you for your attention. I hope somebody can help me
to understand.

Regards,

C=E1ssio

---------- Forwarded message ----------
=46rom: casfre@gmail.com <casfre@gmail.com>
Date: Feb 7, 2008 8:10 PM
Subject: strange ACK SYN URGP=3D0 in an iptables firewall with stateful=
l enabled.
To: netfilter@vger.kernel.org


HI,

     English is not my native language, so forgive about my mistakes.

     I think you can point me to right direction to investigate some
"weird" log lines from my iptables ( 1.3.7 )

     I use -m state to control my traffic and I am see a lot of log
lines, from a lot of src ips ( out of my range and from other
countries) and with SPT=3D80 PROTOCOL=3DTCP directed to machines, in my
lan. There are some line were SPT=3D10100 or 6667.

     The strange thing is that target IPs were never used in my LAN.
They are in our range, but, we never used them. Other detail: all
lines have ACK SYN URGP=3D0.

     I log everything I drop and, in that cases, an
RELATED,ESTABLISHED rule is blocking the packages.

    Could some one point me in a good direction to solve/investigate
the problem?

C=E1ssio
