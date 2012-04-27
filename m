From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH RFC 1/2] netfilter: conntrack: remove RCU usage in
 conntrack notifier
Date: Fri, 27 Apr 2012 20:58:51 +0200
Message-ID: <1335553131.2775.252.camel@edumazet-glaptop>
References: <1335551333-6103-1-git-send-email-bpoirier@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=3uX8q1Wn9q2h8rwNlRVkC6vfXfo7HNFmshDWu/PgXMI=;
        b=nlUWWQz7fJMQa1ic81nIDOjicMnLCL5Sjm0MHPeiE5SOIZQxe2wqlZ4r5aCi4zGfep
         VgH7APVR7pgBtoeomLdRpZ3elvRa53oPLGlXZ24JZwsrYZlsKtEYjixLLFw6kqcl1dep
         YcEliRq8kUDYTd7xU2cJfZ5+lVs9fps05a6yRICtAionNvn0MxKNO7yB1RjWnk5yQZKB
         NScLLrqtAMoKMtD/SPMxt8ftUzyojl236fJtVjaVJEAnwvLS9UNMTvssPnxL84/pwA7y
         1MYF3DdeW5KopDRd+nDBtcAkHvlQtZu86U92EGaBglIbEg8lngz21ETIi1c74umvXxHJ
         HI8g==
In-Reply-To: <1335551333-6103-1-git-send-email-bpoirier@suse.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benjamin Poirier <bpoirier@suse.de>
Cc: netdev@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Mike Frysinger <vapier@gentoo.org>, Arun Sharma <asharma@fb.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On Fri, 2012-04-27 at 14:28 -0400, Benjamin Poirier wrote:
> I think that the rcu usage in this code is pointless. It should either be
> removed or, if it was intended to protect against something, it ought to make
> that clear.
> 
> 1) The code does not make use of the deferred deletion/wait for completion rcu
> api (ie. synchronize_rcu(), call_rcu()).
> 2) It does not benefit from the barriers implied by the rcu primitives used.
> The code deals with callback pointers. There's no need to order writes to the
> function code (!) before writes to the function pointers here.
> ---

At a first glance, this seems pretty wrong.

code can disappear under you, thats for sure.

CONFIG_NF_CT_NETLINK=m

hint : module unload contains an rcu barrier.



