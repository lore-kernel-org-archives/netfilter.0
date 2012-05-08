From: Christoph Lameter <cl@linux.com>
Subject: Re: SLUB warning in netfilter code on shutdown
Date: Tue, 8 May 2012 10:33:16 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1205081030020.27713@router.home>
References: <20120508111924.GA14174@otc-wbsnb-06> <20120508112236.GA15404@otc-wbsnb-06>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1336494992; bh=Memh71Neo7p0LBrGVmhg/ZFbhQtZDO3UipNee8OilDE=; h=X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Received:Date:From:X-X-Sender:To:cc:Subject:In-Reply-To:Message-ID:References:User-Agent:MIME-Version:Content-Type; b=5xerykEV/iiQpQB2Qi3KJev2FoNOT3OB5gBMj8rjsc6LrLvkU6fUXuEsk/sfEkySxayeKCKimWOeGzgI/HWObizwWmwHu1kzDyiV9K/vQ99c92M+aMcPK4xZKiOjqgDk3+6aQO3GbjrNpAh0DFVur4REOYWPmN3qfTfCZP9S7C0=
In-Reply-To: <20120508112236.GA15404@otc-wbsnb-06>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>

On Tue, 8 May 2012, Kirill A. Shutemov wrote:

> On Tue, May 08, 2012 at 02:19:24PM +0300, Kirill A. Shutemov wrote:
> > Hi,
> >
> > Screenshot attached.
>
> It's v3.4-rc6 on x86_64. Config attached.

Cannot see the bug report but I guess this is a message related to object
remaining on kmem_cache_destroy? We have other reports on that one as
well. The IPI reduction patch introduces a bug in has_cpu_slab().

Modify the return statement to

return c->page || c->partial;

