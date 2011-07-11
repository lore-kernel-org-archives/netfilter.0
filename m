From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Tracking packets generated from individual socket.
Date: Mon, 11 Jul 2011 13:03:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107111301520.10829@frira.zrqbmnf.qr>
References: <CAEkK8mF1iYCo5gGjKf7N5zUb0o_PBZE7QEBjCEvEr9SOjTXuqA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEkK8mF1iYCo5gGjKf7N5zUb0o_PBZE7QEBjCEvEr9SOjTXuqA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borgert van der Kluit <borgertvanderkluit@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-07-06 10:09, Borgert van der Kluit wrote:

>So i tried to use the mark field in the sk_buff structure. This is to
>my surprise also not set even if i mark all packets.
>
>I use the TUN/TAP driver to test this setup and added a printk in
>function tun_net_xmit

Your tun program creates new skbs, which naturally start out with 
mark=0.
