From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Iptables and DDoS attacks
Date: Thu, 10 Aug 2023 11:22:08 +0200
Message-ID: <ec98fc0a-1f7c-bb0e-3e96-9092516a2038@thelounge.net>
References: <37c5f1638836cb490a3369d01c5edec1.squirrel@_>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <37c5f1638836cb490a3369d01c5edec1.squirrel@_>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hack3rcon@mail2tor.com, netfilter@vger.kernel.org



Am 10.08.23 um 09:16 schrieb Hack3rcon@mail2tor.com:
> Hello iptables Team,
> Is it possible to protect a server against DDoS attacks using iptables?

depends on the attack - if it's bandwith *nothing* on your side can do 
anything against it

for request-based attacks xt_recent for ratelimits works well
