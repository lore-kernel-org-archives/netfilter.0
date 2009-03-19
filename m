From: wlet@gmx.net
Subject: Re: Outgoing redirection with iptables - TCP skips NAT?
Date: Thu, 19 Mar 2009 15:43:43 +0100
Message-ID: <20090319144343.312510@gmx.net>
References: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Kristian Evensen <kristian.evensen@gmail.com>, netfilter@vger.kernel.org

Hi,

I guess this won't work because if you connection is established it will be stored in a TCP State table which is used for filtering and forwarding.
If you connection already exists it makes no sense to check it against all rules from the ruleset.

UDP doesn't have a statetable (cuz it's stateless) and that is the reason why this works.

wlet
