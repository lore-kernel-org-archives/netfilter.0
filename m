From: Patrick McHardy <kaber@trash.net>
Subject: Re: [PATCH] netfilter/ip_tables: fix compile with debug
Date: Thu, 16 Jun 2011 17:17:19 +0200
Message-ID: <4DFA1E7F.8000205@trash.net>
References: <1308169381-10067-1-git-send-email-sebastian@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1308169381-10067-1-git-send-email-sebastian@breakpoint.cc>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On 15.06.2011 22:23, Sebastian Andrzej Siewior wrote:
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

Applied, thanks. We should really convert this stuff to pr_debug to
make sure these problems are found even without debugging enabled.
