From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Xtables-addons 1.20 is out
Date: Tue, 01 Dec 2009 10:49:00 +0100
Message-ID: <4B14E68C.8000302@chello.at>
References: <alpine.LSU.2.00.0911191248270.21130@obet.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0911191248270.21130@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> Xtables-addons 1.20
> This release has just a number of minor tweaks and updates;
> in short I be reciting the changelog:
>
> - ipp2p: add more boundary checks
> - ipp2p: fix Gnutelle line ending detection
> - LOGMARK: remove unknown options from manpage
> - ACCOUNT: endianess-correctness
> - ipset: install manpage
> - ipset: fast forward to v4.1
>
> DL:
> http://downloads.sf.net/xtables-addons/xtables-addons-1.20.tar.bz2 {,.asc}
> FM:
> http://freshmeat.net/projects/xtables-addons
>   

Hello,

as the configure script always told me, that xtables.h is not present, i 
looked it up and i do think there is an error in 'configure' and 
'configure.ac':

eris:/usr/local/src/xtables-addons-1.20# grep -n '$xtables_CFLAGS' *
configure:11283:#       if [ -z "$xtables_CFLAGS" ]; then
configure.ac:47:        if [[ -z "$xtables_CFLAGS" ]]; then

should'nt that be "$libxtables_CFLAGS"?

Best regards

Mart
