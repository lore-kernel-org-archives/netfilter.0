From: =?UTF-8?Q?Abdul_Pallar=C3=A8s_Calvi?= <abdulc@tutanota.com>
Subject: Presentation of a tool for firewall testing!
Date: Sat, 2 Sep 2023 23:28:33 +0200 (CEST)
Message-ID: <NdMlvGu--3-9@tutanota.com>
References: <NdMV8Ba--3-9@tutanota.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1693690113;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=PIY2jpFPFcb/vghmPx4WuzdaOF0yKbhs9oohKxJU5bY=;
        b=YsvgVBmpsMCFjXZzwL7piL1C1UGBoX494mzzv4B8q/CvhEKo8ABvh02425rlb9Gg
        EnIpG4QUetQuTk795qsFVtTTfR4mfhSKeZKEqop3AYBKyVihqTypzpO/hNy6+jmFSlz
        nuCyMv6nXRHJQFuBZFJFi7Y37jv1faEl+6vJQykvTIJEOS+7nArxi4kDtyn5BhPI+jk
        bxNBkbA/2qIwh34bu5zm5xjJiPGtwo7/TF8o/DIOpR0RKts7ML/H4wQWgOlzm3YadW3
        w4zdQDTzevRmIf74EF36McKlhakla+flvuMQvRF36XpHmYxRCwr8Mlya3R8kvDQdAZV
        65e07oWUCQ==
In-Reply-To: <NdMV8Ba--3-9@tutanota.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter <netfilter@vger.kernel.org>

Hi list,
first of all thanks a lot for the work done on iptables-nft. I thing that i=
s a huge step on linux firewall an a very nice firewall software.


I don't know which tools do you use to test code changes and releases. Prob=
ably tools self made by the project. I would love to hear on that.


Currently I'm working in a framework to run tests on firewalls, before move=
 to production state, the project name is fwtester.=C2=A0 Some speccs:
- It's writen in Python3 fully OOP
- Runs on 3 LXC=C2=A0 containers
- Supports L3 and L7 protocols
- Allows to extend protocols support by modules. The modules system is very=
 very flexible


If you are interested in the project and wants to know more, please do any =
of these actions:
- Read the documentation on readthedocs: https://fwtester.readthedocs.io/en=
/1.2/
- For a quick overview take a look to this presentation: https://mega.nz/fi=
le/E1QBVQiD#VkxiJgI2xdQ9SyZFftYrzrxpGgTVP9Op6urU_5jQkos
- Reply to this message asking any question or giving any comment about the=
 project!


With the hope that this piece of software can be useful to others.
I'll be very glad and graceful to hear about any oppinions/comments/suggest=
ions!

thanks
Regards

Abdul Pallar=C3=A8s Calvi
