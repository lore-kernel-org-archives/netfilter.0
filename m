From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Packets not hitting the nat POSTROUTING table
Date: Thu, 9 Jan 2014 23:31:41 +0100
Message-ID: <CAKfDRXg6ikUtbe3WF6EZTPpDSm_-nPSNPGgXGC95A4GPN9YEhw@mail.gmail.com>
References: <52CF1B40.2070201@cdf123.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=SjoK8L0YKIT7MwYlFy8BBI1dR3LbCu7XetssxEXuWJo=;
        b=BTSxkspURuZmpggd/KNtfSkmAeCWw6L5N2Er6NypizIUgBXuAl+oytRCtZI75MRqGr
         9EacWHWml9/zrm4tCprkiBG/AG+2izAiGmzdXNyCEgFgPUM7Pfv/kxFw8/Z/rc/PQAIi
         iyR730FQ96/kXxMze50E8oMKM/x1oSSwYLr6ZahvqooT9pPRA8YU68cxPYv5KV1bCT31
         t+SZ7zL9WETCwsvBMk2YOO9ljcnBOCUw3/v/nLI4botOiTOmG6R3PoydioShDQtadnWd
         n6axwOwfJjQkjShqA2oPB6DflFU5WZ+DxB7O/8oWpPPFctR5ZlGaJUrlUduuCU9iD2E5
         aFvQ==
In-Reply-To: <52CF1B40.2070201@cdf123.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Frederick <cdf123@cdf123.net>
Cc: netfilter@vger.kernel.org

Hi Chris,

On Thu, Jan 9, 2014 at 10:57 PM, Chris Frederick <cdf123@cdf123.net> wrote:
> Any ideas would be helpful.

If I have understood things correctly, packets belonging to an
established connection does not hit any of the chains in the nat
table. If you want to mangle/filter/manipulate/... these packets, you
can use for example the POSTROUTING chain in the mangle table or in
rawpost. The latter requires xtables-addons as well as slight change
to compilation as rawpost was removed in a recent commit. See:
http://sourceforge.net/p/xtables-addons/xtables-addons/ci/9414a5df343bf30ba13e76dbd7181c55683b11cb/

-Kristian

-Kristian
