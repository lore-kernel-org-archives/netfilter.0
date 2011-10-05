From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 17:49:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110051749100.8125@frira.zrqbmnf.qr>
References: <CAB1A4CB.C258%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAB1A4CB.C258%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Lay <jlay@slave-tothe-box.net>
Cc: Netravali Ganesh <gnetravali@sonusnet.com>, Netfilter <netfilter@vger.kernel.org>

On Wednesday 2011-10-05 14:08, James Lay wrote:

>Why not just have sshd only listen to the interface you want?  From
>sshd_config:
>
>#Use these options to restrict which interfaces/protocols sshd will bind to
>ListenAddress ::
>ListenAddress 0.0.0.0

For the nitpick, as you can see, one never listens on interfaces, but 
addresses. That is a significant difference, considering the case when 
an address is assigned to multiple interfaces.

