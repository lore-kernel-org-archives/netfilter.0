From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 12:28:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110051227560.20695@frira.zrqbmnf.qr>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com> <alpine.LNX.2.01.1110051214190.20695@frira.zrqbmnf.qr> <A5D3AC0FAABBF34A9FD613C14AAC59B71F8B55@sonusinmail02.sonusnet.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8B55@sonusinmail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-10-05 12:16, Netravali Ganesh wrote:

>I have assigned the IP to both eth0 and eth1 interface. I am able to login using ssh from both the IP.

Use -j TRACE to find out more.
