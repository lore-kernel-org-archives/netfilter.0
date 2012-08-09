From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Filtering incoming 3G smartphone traffic using iptables?
Date: Thu, 9 Aug 2012 23:59:43 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208092357300.12067@frira.zrqbmnf.qr>
References: <CAM91gdBFqPw-Z5C9khGJ1JNjmQ2ZOtZh4XrEWK6yCmAiE2T2Jw@mail.gmail.com> <20120809194914.GN3672@harrier.slackbuilds.org> <CAM91gdBWbAcAo6480ZVA4YO+cj3ipeTNhBX7t4CwOpN8ROPq7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAM91gdBWbAcAo6480ZVA4YO+cj3ipeTNhBX7t4CwOpN8ROPq7Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Bryan K. Walton" <bkw@70mpg.org>
Cc: netfilter@vger.kernel.org


On Thursday 2012-08-09 22:09, Bryan K. Walton wrote:
>
>Thanks for the reply.  I should have worded my question more
>precisely.  I'm not really looking for tips to lock down my ssh
>server.  I recognize that is off-topic.  What I'm really trying to
>figure out is if there is an IP tables module that makes use of
>something like the MEID.

You can only match on what you can obtain. If you can obtain the MEID,
good, but last time I checked, that is not transported in any way over IP
networks and the common protocols used for SSH.

Well, that's why any form of good security uses certificates of sorts.
IPsec calls again. SSH has that as well, and calls it key.

There's also a pknock extension in xtables-addons.

