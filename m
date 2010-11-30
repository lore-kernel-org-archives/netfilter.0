From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 30 Nov 2010 14:24:29 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011301424060.1339@obet.zrqbmnf.qr>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600> <543C3E74493F496B8E7D13CA062D1FEC@gericomfx5600>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <543C3E74493F496B8E7D13CA062D1FEC@gericomfx5600>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Secure-SIP-Server <info@secure-sip-server.net>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-11-30 14:14, Secure-SIP-Server wrote:
> It is possible, but if your kernel supports it I don't know.
>
> You can do:
> # rmmod ipt_recent
> # modprobe ipt_recent ip_pkt_list_tot=100

It's called xt_recent.
