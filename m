From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: Change from --syn (old Style) to stat NEW
Date: Sat, 15 May 2010 13:32:30 +0200
Message-ID: <hsm0oe$d3v$1@dough.gmane.org>
References: <hsjfiu$mri$1@dough.gmane.org> <alpine.LSU.2.01.1005142036000.13800@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005142036000.13800@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt schrieb:
> 
> You could combine --syn with --ctstate NEW. That may be
> considered a bonus (though I admit I don't do so myself).
Hi Jan,

Nice idea. :-) Could this be a Problem?

As long as i do not redirect the ports, like i did with my Apache-server 
from 80 to 443, it should work to combine --syn with --ctstate NEW ?

However it should be more safety to change from --syn to --ctstate NEW 
for all rules?

regards Markus

