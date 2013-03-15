From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH] bridge: netfilter: use PTR_RET instead of IS_ERR +
 PTR_ERR
Date: Fri, 15 Mar 2013 12:48:25 +0100
Message-ID: <20130315114825.GB8344@localhost>
References: <1363111893-25146-1-git-send-email-silviupopescu1990@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363111893-25146-1-git-send-email-silviupopescu1990@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Cc: netfilter-devel@vger.kernel.org, bart.de.schuymer@pandora.be, kaber@trash.net, stephen@networkplumber.org, davem@davemloft.net, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 12, 2013 at 08:11:33PM +0200, Silviu-Mihai Popescu wrote:
> This uses PTR_RET instead of IS_ERR and PTR_ERR in order to increase
> readability.

Also applied, thanks.
