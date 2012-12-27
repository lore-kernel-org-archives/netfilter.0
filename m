From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Thu, 27 Dec 2012 18:19:08 -0500
Message-ID: <201212271819.08494.neal.p.murphy@alum.wpi.edu>
References: <50DBE9C9.8090500@airpost.net> <50DC913A.1080409@airpost.net>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50DC913A.1080409@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, December 27, 2012 01:19:38 PM you wrote:

> Another thing I noticed is, that if negation (!) is used on the --genre
> option, iptables -S or iptables-save position the negation wrong i.e:
> 
> -A PROBERS -p tcp -m osf --genre ! Windows -j SET \
   > --add-set other_probers src

Is this 'infix' notation (--genre ! Windows) invalid already? Or is it just 
deprecated?
