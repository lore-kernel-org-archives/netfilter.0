From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Are iptables or ipset file capabilities aware?
Date: Fri, 16 Dec 2011 15:20:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112161519320.25778@frira.zrqbmnf.qr>
References: <4EEB25A0.1090706@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EEB25A0.1090706@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mickey Nordstrom <mickey.nordstrom@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2011-12-16 12:04, Mickey Nordstrom wrote:

>I have understood that I should be able to do this with the
>CAP_NET_ADMIN capability but so far during my testing with ipset 4.5
>I have not been successful.

Just how is CAP_NET_ADMIN any better than sudo? (The application
would have full network control in either case.)
