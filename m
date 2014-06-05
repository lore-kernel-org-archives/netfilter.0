From: Martin Kraus <lists_mk@wujiman.net>
Subject: Re: conntrackd  crash after few seconds
Date: Thu, 5 Jun 2014 17:49:44 +0200
Message-ID: <20140605154944.GA29302@finrod>
References: <53908A7E.4020802@yahoo.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53908A7E.4020802@yahoo.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Cc: netfilter@vger.kernel.org

On Thu, Jun 05, 2014 at 05:19:26PM +0200, Nicolas RENAULT wrote:
> informations :
> 
> debian wheezy     3.2.0-4-amd64 #1 SMP Debian 3.2.57-3+deb7u2 x86_64

Hi. 

We had crashes on debian wheezy which were solved by upgrade to

linux-image-3.13-0.bpo.1-amd64

from wheezy backports.

mk
