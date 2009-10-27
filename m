From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: IPtables and SNAT
Date: Tue, 27 Oct 2009 09:03:08 +0000
Message-ID: <56378e320910270203i5ab08ec3gd48d1283b4f37bac@mail.gmail.com>
References: <95ac437a-3f19-490a-80d0-3ce0a20850ed@y10g2000prg.googlegroups.com>
	 <46ee7b1c0910212155pd99519cw9831d4bb7d7f3064@mail.gmail.com>
	 <b8dec168-132d-4fba-9d09-fbb5554c339d@m7g2000prd.googlegroups.com>
	 <ee114c7a-303d-4776-8562-314387348ec8@g1g2000pra.googlegroups.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=NM1HbGqeZDUGnA5ZOxr9B4DDC9NwCWmpMIL30CWgzQY=;
        b=iSluMiHL6X/umzTayYMBhV3B0zfcCfTury4nyuWMxqYTiZHw1lbbaOZG4HgU8YT9Ff
         u5rwUY7+d63cLlSNpkVEE4GEyMufIKZ54Rke4ZRSiPfzaV9mvAlrX7VlFM/r1EF//6YO
         L3R8rdsG2ASx0c5LoWucHezMV1Z94/1LPNCLg=
In-Reply-To: <ee114c7a-303d-4776-8562-314387348ec8@g1g2000pra.googlegroups.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: codingfreak <adapa.ajith@gmail.com>
Cc: netfilter@vger.kernel.org

> =A0 =A0$IPTABLES -t mangle -A PREROUTING -p tcp --dport 21 -s 192.x.y=
=2Ea -
> j ACCEPT
> =A0 =A0$IPTABLES -t mangle -A FORWARD -p tcp --dport 21 -s 192.x.y.a =
-m
> conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
> =A0 =A0$IPTABLES -t nat -A POSTROUTING -s 192.x.y.a -p tcp --dport 21=
 -j
> SNAT --to-source 194.160.1.1
>


=46irst thing to bear in mind: The mangle table is purely for packet
manipulation actions and should not be used for filtering. Move the
two accept rules into the filter table (just omit the -t mangle
parameter).

Port 21 is only the ftp control port - data uses port 20.

If you have the ftp helper try
$IPTABLES -t nat -A POSTROUTING -s 192.x.y.a -m helper --helper ftp -j
SNAT --to-source 194.160.1.1








--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
