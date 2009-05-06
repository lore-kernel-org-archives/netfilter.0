From: Elvir Kuric <omasnjak@gmail.com>
Subject: Re: PostgreSQL x iptables
Date: Wed, 6 May 2009 20:36:37 +0200
Message-ID: <1814bfe70905061136r1df845b9h7e3f3de816993f80@mail.gmail.com>
References: <7F27BA389269BB47A79525510325A35F6F9253@se02.upce.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=GP2R+4d7JEX61IQxT+mz6wqwm+T7aewvQw82wROOObg=;
        b=qe/lidTDFxSwhiOr79hC2aUsQrgaKXvhkx2Bm4IuGrPlWF2fyX+3BIPvdvT82wLFek
         Lu8y0BpohfyLSRHaZSSHzXRXrgqkAh8bgSiCQx1i0Hr6s3SghxuFcGL4cN79jsTzGKiw
         t5QFatmYl8KKzRZISGTk622jk0dBj8L08z/6k=
In-Reply-To: <7F27BA389269BB47A79525510325A35F6F9253@se02.upce.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Slansky Lukas <Lukas.Slansky@upce.cz>
Cc: netfilter@vger.kernel.org

Hi Lukas,

you should accept NEW connection for traffic you need. Rule "1" accept
only connections which are initiated
from " original host"---host which already sent NEW.
You can to receive all trafic on particular port/from particular host
and I think it will not be problem to make what you want
Also, please take care that is necessary to reload rules ( do iptables
-X -F -Z ) after you change something.

Take a look into Cisco PIX, maybe there you have some limit

=46or iptables reference see man iptables or Oscar Anderson Iptables ma=
nual

Regards/Ahoj

Elvir Kuric

On Wed, May 6, 2009 at 11:13 AM, Slansky Lukas <Lukas.Slansky@upce.cz> =
wrote:
> Hello,
> we're using PG and Application Server (JBoss) on separate CentOS serv=
ers
> with Cisco PIX in between. On DB side is iptable with following relev=
ant
> rules:
>
> 1. -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACC=
EPT
> 2. -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp -s
> aaa.bbb.ccc.ddd --dport 5432 -j ACCEPT
> 3. -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibite=
d
>
> I was wondering when these rules are not OK for our environment. It
> seems that rules 1 and 2 sometimes (probably for complicated queries)
> pass packets and therefore these packets are rejected by rule 3. Such
> connection is then in some weird state, doesn't communicate (obviousl=
y -
> packets are dropped) and psql (or JBoss) connection is blocking for a
> long time (at least few hours).
>
> Everything seems to be OK when I have changed rule 2 to =A0"-A
> RH-Firewall-1-INPUT -m tcp -p tcp -s aaa.bbb.ccc.ddd --dport 5432 -j
> ACCEPT".
>
> I'm really confused - what other states are possible for iptables exc=
ept
> ESTABLISHED, RELATED or NEW? In iptables manpage is only INVALID, but
> why is this state emerging?
>
> Any idea?
>
> Lukas
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
