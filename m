From: Laura Garcia <nevola@gmail.com>
Subject: Re: libnftnl tests compilation
Date: Tue, 5 Jul 2016 15:16:49 +0200
Message-ID: <20160705131648.GB7993@sonyv>
References: <20160705112849.GA7993@sonyv>
 <20160705123006.GA27094@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z/QfEHl+k9DsdMm+G41TIDepmvfjSVlkSB+dD09y+Mc=;
        b=0/iaTHTcM06143amDVOAuZqCzY4hatj080uoNfapHOqWejtOOgjUoKXKtrk1Kj0r2v
         Hs1xVMjHlbV1zP4rknyWI/PNcaYtPtNIAJ06KyvbtU34TEfUgxzRXx5jn0/juAH0duLT
         5i/jsSrhDNnFMKssv1tNEEkBW+FuImHFMWfuknd1rUyCbi1zhAf+90zP48zZo9Z2wRJS
         VA+7aayHyg4N9NIWBUccez1rUOscJKJ1E5NopuWdmHK7isACZmwtAzGTtpcDHpRUGG7w
         Gz5BruV0KwPW3A/v/j9qpeEtHcDn/DK2uPqs2PgAjITFwOg+ZUF4EyOvNzcwZyCHq2nY
         NPYw==
Content-Disposition: inline
In-Reply-To: <20160705123006.GA27094@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Tue, Jul 05, 2016 at 02:30:06PM +0200, Pablo Neira Ayuso wrote:
> On Tue, Jul 05, 2016 at 01:28:50PM +0200, Laura Garcia wrote:
> > Hi, I'm following the compilation instructions of libnftnl from the
> > wiki but the tests/ folder are not compiled. Do you know how to
> > enable the compilation of the tests?
> 
> make check

Thanks.
