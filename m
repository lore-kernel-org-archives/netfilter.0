From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Change from --syn (old Style) to stat NEW
Date: Fri, 14 May 2010 20:36:43 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005142036000.13800@obet.zrqbmnf.qr>
References: <hsjfiu$mri$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hsjfiu$mri$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org


On Friday 2010-05-14 14:27, Markus Feldmann wrote:
>
> i am thinking about changing much of my firewall rules from the old style with
> the <--syn> argument to the new style with the <-m state --state NEW> or to the
> conntrack style.
>
> For example have a look line 221 to 239 in my firewall
> http://pastebin.com/cG0Vc4EW
>
> These are my FTP rules. Therefore i am only using the <! --syn> arguments. Is
> it useful to remove this argument by inserting <-m conntrack ! --cstate NEW> to
> get more safety ?

You could combine --syn with --ctstate NEW. That may be
considered a bonus (though I admit I don't do so myself).
