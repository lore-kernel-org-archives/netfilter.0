From: Marc SCHAEFER <schaefer@alphanet.ch>
Subject: IP SNAT in a bridge
Date: Thu, 3 Mar 2022 21:45:46 +0100
Message-ID: <20220303204545.GA6798@alphanet.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1646340346; bh=cVoP0y1WKEa2QUspewgQV0tboo/I3G9bUwmuTD+kxZs=;
        h=Date:From:To:Subject:From;
        b=kR4fxrNLGbQ9i/igY2vu8Z5Em0T4INfGSRWGYDseMXqHF+OhBEe09MSKls6/ECq3N
         crwZs+KPPtlEGd487NeZkZUtwK2pEg7yErxfvHJS/yNxBBJUdJtRQr+2vsCP9Q5F6r
         tGbxogHj5cyZYr3QCYlEv1XG0T0Js6rC9PnqkwE5ZbwIogF6uy5i1rAoK8U7yU5R8h
         s+Y05dhXr6dg+gWLPxXAdFgWxX1A2sE+4WkDYCGRpLHTUfGJlxsvuWqGCY90Wd75+x
         CFeWo8VGrw7yrKaCbRc6Mh2mhyU/m7KWnOlQORaAx7soeOhEbZGSOGKDDf3Agosd8f
         qAxJqkTX0lYOg==
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have two containers connected to a bridge. Let's assume the following
IP packet goes through the bridge:

192.168.101.3:80 > 192.168.101.4:12345

I would like to change the packet as follows:

1.2.3.4:80 > 192.168.101.4:12345

am I right that this has to be done as a -t nat POSTROUTING -j SNAT
iptables, but that will only work if ebtables forces the packet into
BROUTE mode first?

Something like:

   ebtables -t broute -I BROUTING -p 0x800 -i bridge \
      --ip-proto tcp --ip-sport 80 --ip-src 192.168.101.3/32 \
      -j DROP
   iptables -t nat -I POSTROUTING -s 192.168.101.3/32 -p tcp --sport 80 \
      -j SNAT --to-source 1.2.3.4:80

Or am I completely mistaken?

Thank you.
