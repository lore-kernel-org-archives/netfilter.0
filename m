From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: How to block ssh on specific ethernet interface
Date: Fri, 7 Oct 2011 13:12:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110071311540.21750@frira.zrqbmnf.qr>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com> <CAB1A4CB.C258%jlay@slave-tothe-box.net> <A5D3AC0FAABBF34A9FD613C14AAC59B71F8BD0@sonusinmail02.sonusnet.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8BD0@sonusinmail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: James Lay <jlay@slave-tothe-box.net>, Netfilter <netfilter@vger.kernel.org>

On Friday 2011-10-07 05:01, Netravali Ganesh wrote:

>I don't want to make any dependency on IP. If IP get changes for any
>reason ssh will be allowed.

Hardly. If your sshd_config has "ListenAddress A", and your host's 
address changes away from A, the set of machines able to reach yours 
can, by pure mathematical logic, not grow.
