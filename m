From: Andrew Beverley <andy@andybev.com>
Subject: Re: Correct Chains to Apply Rules
Date: Tue, 17 May 2011 23:19:38 +0100
Message-ID: <1305670778.2741.10.camel@andybev-desktop>
References: <1305666891.6262.1453014301@webmail.messagingengine.com>
	 <4DD2E89F.30801@plouf.fr.eu.org>
	 <1305669045.20717.1453045045@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305670779; bh=r++4iaSCxCKoGx+gmqFfvMN6EhaMpoqc6jyNE
	Hf080k=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=EK/Gui/u
	10wxOoOtrR5Zx9jp7ZvFrsgTkme3Sz69RUZNx5Zq0rCgNmD+hwvWWJ4eDdVMDU0Utwc
	SvCrq8AIDnCaXD5dA5MSkMPQcYeYdURkLFf1DYOzjgoKrmJGyIcMdrwyRZeCMG400AR
	yurdo9rD7xCbt9j9Rl6IrGnLLyUl8=
In-Reply-To: <1305669045.20717.1453045045@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

On Tue, 2011-05-17 at 15:50 -0600, netfilter@buglecreek.com wrote:

Please don't top post.

> OK.  Thanks.  So to block/allow traffic from network A to/from network B
> I would apply my rules to the FORWARD chain using a source/destination. 

Yes.

> The INPUT and OUTPUT chains on eth0 and eth1 are only for traffic bound
> for the firewall/router box itself? 

Yes.

A picture paints a thousand words:

http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

Or if you want a simpler version:

http://www.docum.org/docum.org/kptd/

Andy


