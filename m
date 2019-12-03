From: Jan-Philipp Litza <jpl+direct@plutex.de>
Subject: Re: nftables: No prefixes in anonymous sets?
Date: Tue, 3 Dec 2019 08:44:51 +0100
Message-ID: <b63e55b0-523e-da03-30b6-ad0fa2bc6090@plutex.de>
References: <7dd662ab-9d95-dbe9-3cf8-5db33ccb4b1a@plutex.de>
 <20191202200652.GT795@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20191202200652.GT795@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Florian Westphal <fw@strlen.de>, Jan-Philipp Litza <jpl+direct@plutex.de>
Cc: netfilter@vger.kernel.org

Florian Westphal wrote:
> Which nft and libnftnl versions are this?
> 
> This code is taken for non-anon sets.
> 
> Note the ! -- this check is done for named sets.

I'm totally confused and ashamed right now.

Of course that code is only taken for named sets. And trying to
reproduce the bug again, it works flawlessly with the exact . So either
this is a Heisenbug, or I was even more confused when writing my
original mail. I cannot tell.

In case it matters anyway: This happened (and then worked) on Debian
Buster, libnl-3-200 version 3.4.0-1 and nftables version 0.9.0-2

Sorry to waste your time!

-- 
Jan-Philipp Litza
PLUTEX GmbH
Hermann-Ritter-Str. 108
28197 Bremen

Hotline: 0800 100 400 800
Telefon: 0800 100 400 821
Telefax: 0800 100 400 888
E-Mail: support@plutex.de
Internet: http://www.plutex.de

USt-IdNr.: DE 815030856
Handelsregister: Amtsgericht Bremen, HRB 25144
Geschäftsführer: Torben Belz, Hendrik Lilienthal
