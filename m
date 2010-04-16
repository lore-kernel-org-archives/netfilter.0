From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reg: Replacing sk_buff in a NetFilter hook
Date: Fri, 16 Apr 2010 12:48:27 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004161245440.11880@obet.zrqbmnf.qr>
References: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-04-16 12:37, Subhadeep Ghosh wrote:
>
>The first and the second steps are no-brainers. However, I don't know
>if I need to drop the original packet or mark it as stolen. And I
>definitely don't know how to resolve the fourth point. It would be
>great if anyone could point me in the right direction.

NF_DROP will cause netfilter to free it when the hooks are
done; with NF_STOLEN, you have ownership of the skb and
need to free it yourself.
