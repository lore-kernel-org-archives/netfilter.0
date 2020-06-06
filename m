From: Florian Westphal <fw@strlen.de>
Subject: Re: meta day not working
Date: Sat, 6 Jun 2020 16:37:02 +0200
Message-ID: <20200606143702.GL28263@breakpoint.cc>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200601124124.GA12580@salvia>
 <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
 <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
 <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
 <20200602162536.55948b65@redhat.com>
 <20200602183819.50b4bd84@redhat.com>
 <000d2e24-1df3-c42a-3117-05d6390194e8@softtalker.com>
 <269506832.599.1591449005072.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <269506832.599.1591449005072.JavaMail.zimbra@contatogs.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pauloric@contatogs.com.br
Cc: netfilter <netfilter@vger.kernel.org>

pauloric@contatogs.com.br <pauloric@contatogs.com.br> wrote:
> only meta day
> /etc/nftables.d/gerais:17:168-176: Error: Could not parse Day of week of packet reception
> 
> meta day "(1,3,5)" counter accept comment "ttttttt"

Anonymous sets use curly braces "{}", not "()".
