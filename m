From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH 0/4] Generalize DEBUGP macros
Date: Fri, 9 Aug 2013 17:48:09 +0200
Message-ID: <20130809154809.GA5147@localhost>
References: <1374744229-5427-1-git-send-email-a.perevalov@samsung.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1374744229-5427-1-git-send-email-a.perevalov@samsung.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Perevalov <a.perevalov@samsung.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi Alexey,

On Thu, Jul 25, 2013 at 01:23:45PM +0400, Alexey Perevalov wrote:
> It's better to have one common header for keeping debug macro.
> There are many files currently define they own trace macros (DEBUGP).
> All of them are moved to DEBUGP from trace.h.

I commented this with Jozsef, and I think that debugging enabled
everywhere actually makes debugging harder that using selective
debugging, as you may get debug messages that you don't actually want.

Another alternative can be delete many of those DEBUGP, as I think
they are useless these days.

Regards.
