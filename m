From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: strange log on gateway inside []
Date: Fri, 30 Jul 2010 11:48:20 +0100
Message-ID: <AANLkTiknW+Z+QYjUSK83mLVV_0rJ8BrcokX6u7AMc+9V@mail.gmail.com>
References: <4C513E0B.6040005@unipex.it>
	<4C52AC62.3090609@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=QQaN+FsjGoGz3aNwjM/8vY2y5vueVGIpbZLjSt21lXE=;
        b=nhh2ixHyINPx8dMIa7Wg7lghTAtFKbJBzmZIw10TrNSfmGtyv9CpS+6UY1jztogEZB
         Fsh5QEdtEgprFtI61bTYivLWiMS2dWucAzaAvnfmuk03QVqLYmtBrn6OvKxXe/50aYVl
         ZqCjiOBeOWM5YndGg7EgF3iOOoURsPcKSHIGs=
In-Reply-To: <4C52AC62.3090609@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

On 30 July 2010 11:41, Michele Petrazzo - Unipex
<michele.petrazzo@unipex.it> wrote:
>
>
> A doubt.
> Like said, INVALID is only a CT classification of my firewall. But,
> since it's not a standard, how I can receive and reply (through my
> FORWARD chain) to an INVALID packet? Who generate/classify it like
> INVALID? My sender (I don't believe since it's not a standard) or my CT?
>

Your connection tracker...


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.richardhorton.info
