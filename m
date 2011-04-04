From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Allow/deny with iptables or application?
Date: Mon, 4 Apr 2011 16:42:11 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104041641530.4526@obet.zrqbmnf.qr>
References: <7a7jp6dtkhk47rls5q1u0kgg6tp4mgh0v6@4ax.com> <4D99A326.8090906@4c.ucc.ie> <q3ijp69ejtunvqsrvufiijbmeldhsq6t68@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <q3ijp69ejtunvqsrvufiijbmeldhsq6t68@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilles <gilles.ganault@free.fr>
Cc: netfilter@vger.kernel.org

On Monday 2011-04-04 15:35, Gilles wrote:

>On Mon, 04 Apr 2011 11:53:26 +0100, William Fitzgerald
><wfitzgerald@4c.ucc.ie> wrote:
>>A defense in depth strategy is best.
>
>Thanks for the infos. I started reading this book from 2007:
>
>"Linux Firewalls - Attack Detection and Response with iptables, psad,
>and fwsnort"
>www.amazon.fr/Linux-Firewalls-Detection-Response-iptables/dp/1593271417
>
>And I'll try compiling sshguard so it can reconfigure iptables on the
>fly in case someone's trying a brute-force attack on Asterisk.

fail2ban is more flexible, it doesn't just lookf or ssh.

