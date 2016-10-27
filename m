From: Rui Santos <rsantos@ruisantos.com>
Subject: NAT with unique egress port
Date: Thu, 27 Oct 2016 17:22:50 +0100
Message-ID: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ruisantos-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=t/ZBcuc4IJaI/Kn3gwEfrKPk/tHX479+MH0fwo6UmtU=;
        b=KrsthvaX46KD+XF0hslCyd7Jr2TPLFv32yWAI3tSLA2ysFzlnkJ6bRucIFc7Y/WN23
         +LAgYLHvTqWjTpyvP4xoh6ksijqrpEdNWqw/w1lG8ru8LejFrs/QUuymIJ/ivj23JSpp
         lDRrVRC0B4X2P1WksoIXC0NcsOOLbRSPgUh/0BsYop+tvdMTTvKwGNvDg5z8ndk6weec
         SffCiiPZQyg6P2ZlX82qdSKNbAXEenX6OWNXuJrnjuxjdZtg4TOjHuJwpMwo/u0Suqge
         1qxYxwjYRGUesYTZ8Y0uqcUPXp9CH5BmRAyZe6mDbSuIE3HGfug2oT63MJdXuGaRxSwq
         aOfw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I'm currently using NAT to provide Basic address translation from
private to public IP's.

However, linux kernel uses both destination IP and Port as part of
it's NAT mapping process. This way (client1 and client2 are on the
same internal network):
- if client1 connects to server1 using source port X, the NAT will be
mapped: client1IP:SourcePortX -> server1IP:SourcePortX;
- if client2 then connects to server2 using source port X, the NAT
will be mapped: client2IP:SourcePortX -> server2IP:SourcePortX.
Basically, SourcePortX is used on both mappings for client1 and client2.

But, if client2 tries to connect do server1 instead, using the same
source port X, the NAT will be mapped: client2IP:SourcePortX ->
server2IP:SourcePortY
SourcePortY will be an available (randomly generated?) ephemeral port.

My goal is to force this behavior on all outgoing connections. This
way I would get a unique egress port mapping to an internal IP:Port in
a specific point in time:
- if client1 connects to server1 using source port X, the NAT will be
mapped: client1IP:SourcePortX -> server1IP:SourcePortX;
- if client2 then connects to server2 using source port X, the NAT
will be mapped: client2IP:SourcePortX -> server2IP:SourcePortY.
SourcePortY will be an available (randomly generated?) ephemeral port.

I am aware that this will imply a concurrent NAT connections limit,
equal to the ephemeral port range, per egress IP.

Is there any way I can accomplish this kind of behaviour?

Thanks for all your help,
-- 
Rui Santos
Veni, Vidi, Linux
