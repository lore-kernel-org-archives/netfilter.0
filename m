From: Isabell Cowan <izzi@izzette.com>
Subject: [conntrack-tools] - Multiple Routing Tables
Date: Fri, 15 Dec 2017 09:18:18 -0600
Message-ID: <a94bcbb3-ef8b-4835-6646-3a4a412b07e9@izzette.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=izzette.com; h=
        content-language:content-transfer-encoding:content-type
        :content-type:mime-version:user-agent:date:date:message-id
        :subject:subject:from:from:to; s=dkim; t=1513351100; x=
        1514215101; bh=QoQbSFQOm9XbxYR/oV+aDrHx5bE00N6+74AMTQpNuc0=; b=o
        p0/lPthChQB8wW254PuIWuXLUA0gvNEefWfiqqUjtuoRHEKU8APg6/e8tTD/BsSm
        /jMXhpPI7DMAMmIpJIBIAP5iEHO/853piCHaHg+QLUNqqBBE+FvmCgBeITmhucdN
        wv3PVOdpGZ4OcYCM6Cj5PhlMRyU6FjMWzgh/XVyX/Q=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Can conntrackd be used between routers that share multiple routing
tables and default routes, for example as described in
http://lartc.org/howto/lartc.rpdb.multiple-links.html.=C2=A0 If so, what =
are
the requirements for such a setup / configuration, and if not are there
any plans to implement support.=C2=A0 I was unable to find any reference =
to
multiple routing tables in the user manual at
http://lartc.org/howto/lartc.rpdb.multiple-links.html.=C2=A0 Any help
appreciated, thanks in advance!

-- Isabell Cowan


