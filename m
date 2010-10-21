From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 13:11:25 -0500
Message-ID: <4CC0824D.6030403@riverviewtech.net>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com> <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr> <AANLkTi=s9LAzk909QAjvhQKUVrn5bC+tgK6n2cfjyvY2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=s9LAzk909QAjvhQKUVrn5bC+tgK6n2cfjyvY2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/21/10 12:56, Mateus Caruccio wrote:
> As I said, I do not have access/permission to run anything in our 
> production servers (our admins are a "little" paranoid :) Also, since 
> port mirror is mirroring only those specific proto:port packets, I 
> dont think that would cause any performance penalty.

(I've not used SPAN / port mirroring in a long time.)  Does the SPAN 
truly mirror select protocols (UDP) to a given port (2077)?  Or does 
SPAN mirror all traffic to the switch port?

*chuckle*

I've been on both sides of the paranoia.  Usually it's warranted for 
security / stability.  (Usually)

> Anyway, this is not beautiful as it could, but works for our needs. 
> Again, thanks for support. I will keep looking for a more 
> straight/clean solution.

Honestly, I don't think this solution is that unclean, at least from a 
host point of view.  The only dirty part of this I see is the fact that 
you have an IP / MAC duplication on the network.  However, said 
duplication is isolated by a SPAN configuration in a switch.  So, it's 
not really bad, just something to be mindful of.

I don't know how temporary your dev server is, but I've had 5+ year old 
temp installs break when the prod server was replaced, thus changing the 
MAC address.  Just something else to be mindful of.

> I'm not a protocol/kernel specialist, so this is a good challenge.

Challenges can be fun and frustrating.



Grant. . . .
