From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: nft 'script' not working
Date: Tue, 20 Oct 2015 15:42:48 +0200
Message-ID: <20151020134121.GA916@salvia>
References: <20151020103959.GA2206@salvia>
 <808081249.162491.1445328120632.JavaMail.ngmail@webmail12.arcor-online.net>
 <512001352.171753.1445344666801.JavaMail.ngmail@webmail12.arcor-online.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <512001352.171753.1445344666801.JavaMail.ngmail@webmail12.arcor-online.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giorgio.nicole@arcor.de
Cc: netfilter@vger.kernel.org

On Tue, Oct 20, 2015 at 02:37:46PM +0200, giorgio.nicole@arcor.de wrote:
> Hi,
> 
> thanks for your answer,
> 
> your answer to the first question confirms what I already supposed,
> my workaround is now to add a last 'drop' rule to the input table
> instead of changing the table policy:
> 
> add rule inet filter input drop
> 
> instead of
> 
> add chain inet filter input { policy drop; }

You also can specify the policy by the time you create the basechain
in one go:

add table inet filter
add chain inet filter input { type filter hook input priority 0; policy drop; }

