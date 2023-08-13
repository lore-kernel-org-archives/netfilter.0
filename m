From: Hack3rcon@mail2tor.com
Subject: Re: Iptables and DDoS attacks
Date: Sun, 13 Aug 2023 15:34:32 -0400
Message-ID: <c614ef650022a572493960711294723a.squirrel@_>
References: <37c5f1638836cb490a3369d01c5edec1.squirrel@_>
    <ec98fc0a-1f7c-bb0e-3e96-9092516a2038@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ec98fc0a-1f7c-bb0e-3e96-9092516a2038@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

>
>
> Am 10.08.23 um 09:16 schrieb Hack3rcon@mail2tor.com:
>> Hello iptables Team,
>> Is it possible to protect a server against DDoS attacks using iptables?
>
> depends on the attack - if it's bandwith *nothing* on your side can do
> anything against it
>
> for request-based attacks xt_recent for ratelimits works well
>

Hello,
Thank you so much for your reply.
How do hardware firewalls that use Linux prevent these attacks?

Can you show me some iptables rules about limitation?

