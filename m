From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Traffic accounting in iptables
Date: Wed, 14 Jul 2010 20:39:16 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007142038130.28055@obet.zrqbmnf.qr>
References: <AANLkTilT4RX2sRQc7vjtWdbP3UxSqqVFAwGc2mGZk0iC@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilT4RX2sRQc7vjtWdbP3UxSqqVFAwGc2mGZk0iC@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shirley Ong <soap6gal@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-07-14 19:00, Shirley Ong wrote:
>With wireshark, I added up all the bytes (with and without header) at all
>the different layers. The closest I can get wireshark to show the same
>data bytes as iptables is at the IP Layer (data + header). What
>puzzles me is that, wireshark shows 12 bytes (incoming traffic) more
>than iptables

Can you reproduce this using pings? (The ping program allows to specify 
payload sizes, and thus, exact packet sizes)
