From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re:
Date: Wed, 24 Aug 2011 09:19:10 +0100
Message-ID: <4E54B3FE.8020902@tolaris.com>
References: <4E536427.2040503@ngs.ru> <4E5385EB.9040808@tolaris.com> <4E538A10.3030508@runoguy.ru> <4E539076.1070609@tolaris.com> <alpine.LNX.2.01.1108240935020.4749@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1108240935020.4749@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ellad Yatsko <eyatsko@runoguy.ru>, netfilter@vger.kernel.org

On 2011-08-24 08:35, Jan Engelhardt wrote:
>> Don't run that on a system with a lot of traffic. You'll get one line for
>> each session. For 1000 sessions, that's manageable. For 500,000, it will
>> block the terminal for a long time.
> 
> That's why one normally uses conntrack -L | less so that that does not 
> happen.

Unfortunately, conntrack isn't installed by default on a lot of
distributions. Just "less /proc/..." will do the same.

Regards,
Tyler

-- 
"Religion is the opiate of the masses, so long as the masses are straight.
However, amass a bunch of lesbians and you're going to need actual drugs."
   -- OKCupid Blog, with apologies to Karl Marx
      http://blog.okcupid.com/index.php/gay-sex-vs-straight-sex/
