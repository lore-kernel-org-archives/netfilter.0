From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH/RFC] netfilter: nf_conntrack_sip: Handle quirky Cisco phones
Date: Mon, 15 Nov 2010 08:46:50 -0800
Message-ID: <AANLkTinELGUzDJ8TTTfA8sfiYiLJV-2ZPujwbuQWTPWd@mail.gmail.com>
References: <28d666269c390965f1a4edca42f93c12@localhost>
	<1289725175.2743.65.camel@edumazet-laptop>
	<AANLkTik4PLga8mX73c8iONPeOtpDiuDhfu3xiPmF07jC@mail.gmail.com>
	<1289764664.2743.110.camel@edumazet-laptop>
	<AANLkTi==8nwn3g5t1uw=CP1K0vegUE2hAdDxOq-fkVRW@mail.gmail.com>
	<4CE1084A.3070100@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=zZs+38wJe8aFBOoqU4FsqHcUjLzzFGuHrOAs9kaaW6k=;
        b=Ayvq8TunK9xeVp3lIs0++xGOf51cLZzn1fVemKz1xshm142rJ0NAWXSH4cimd/ZImj
         7iG/RrpCfGmNmGU4xKDXjcNvpgk3lPF2z1QE9FqEBtoHFrPoV9dgiahWZN0q5nzE58qS
         l4FcxES1mdNNMeZy30MRVNQFYF6tPZa6CSAIA=
In-Reply-To: <4CE1084A.3070100@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On Mon, Nov 15, 2010 at 2:15 AM, Patrick McHardy <kaber@trash.net> wrote:
> The problem in doing this is that further packets from port 49xxx
> wouldn't be recognized as belonging to the same connection.

OK, makes sense.

> The same problem exists with your current patch, packets from port
> 5060 to the same destination won't be recognized as belonging to the
> connection that sent the REGISTER and thus won't be able to modify the
> timeout or unregister.
>
> Basically we would need three-legged connections to handle this
> situation correctly.

Just to clarify: the actual source port on a given device will be
EITHER a high-numbered port (Cisco) or 5060 (others).  I have not come
across any devices that send from a "mix" of source ports, e.g. 49xxx
for REGISTER and then 5060 for INVITE.

From what I have seen, subsequent SIP requests from the Cisco phone
are indeed getting associated with the original connection.  My phone
is logging into two different SIP accounts, and each account seems to
use its own unique UDP source port for all control traffic (both
expecting replies on 5060).

If Netfilter adds support for three-legged connections, will the third
leg show up in the tuplehash so I don't have to track it in the "help"
structure?
