From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Fri, 14 May 2010 14:16:35 +0200
Message-ID: <hsjev3$k7h$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org>  <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>  <hshf0k$ine$1@dough.gmane.org>  <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>  <hshhcg$rl3$1@dough.gmane.org> <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com> <hsi46a$sro$1@dough.gmane.org> <alpine.LSU.2.01.1005140840150.28602@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005140840150.28602@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt schrieb:
> On Friday 2010-05-14 02:06, Markus Feldmann wrote:
> 
> It is marked as NEW,DNAT (-m conntrack; -m state won't help you)
[SOLVED] Hi All,

thank you all that was the Problem. i changed my attacksinput chain to:
http://pastebin.com/5YwC4r2i

And it works now. :-)

regards Markus

