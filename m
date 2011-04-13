From: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>
Subject: Problem with iptables -j TEE
Date: Wed, 13 Apr 2011 13:46:46 +0200
Message-ID: <BANLkTik_H3PYFvWde5c2MOGtEeAdYvOz9Q@mail.gmail.com>
References: <BANLkTik2sHtuWOr64ty4yQhjP5EYwD20pg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTik2sHtuWOr64ty4yQhjP5EYwD20pg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to copy the incoming traffic by tcp to another host using TEE.

My command:
iptables -t mangle -A PREROUTING -p tcp -j TEE --gateway 192.168.0.100

And the error:
iptables: No chain/target/match by that name.


any tip?
