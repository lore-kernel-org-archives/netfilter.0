From: Gilles <gilles.ganault@free.fr>
Subject: Re: Allow/deny with iptables or application?
Date: Mon, 04 Apr 2011 17:02:03 +0200
Message-ID: <s9njp6tvqnsduvtkv63lb5ruumjh0t59hg@4ax.com>
References: <7a7jp6dtkhk47rls5q1u0kgg6tp4mgh0v6@4ax.com> <4D99A326.8090906@4c.ucc.ie> <q3ijp69ejtunvqsrvufiijbmeldhsq6t68@4ax.com> <alpine.LNX.2.01.1104041641530.4526@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 4 Apr 2011 16:42:11 +0200 (CEST), Jan Engelhardt
<jengelh@medozas.de> wrote:
>>And I'll try compiling sshguard so it can reconfigure iptables on the
>>fly in case someone's trying a brute-force attack on Asterisk.
>
>fail2ban is more flexible, it doesn't just lookf or ssh.

Yes, but it's written in Python and there isn't enough RAM on that
appliance to run it along the other apps that I need.

