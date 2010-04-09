From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Packet manipulation in user space
Date: Fri, 9 Apr 2010 11:02:57 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004091101420.17365@obet.zrqbmnf.qr>
References: <h2hb3f13ff81004081148n221e9728mb5a14944cf4ffd06@mail.gmail.com>  <h2ub3f13ff81004081154tbf514844hdfb703cf81f857d2@mail.gmail.com>  <cf60659524ea8ac90afc3024108635b6@localhost> <q2lb3f13ff81004082300gac000528h519880c0a1ab2a75@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <q2lb3f13ff81004082300gac000528h519880c0a1ab2a75@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamid Nassiby <h.nassiby@gmail.com>
Cc: Julien Vehent <julien@linuxwall.info>, netfilter <netfilter@vger.kernel.org>


On Friday 2010-04-09 08:00, Hamid Nassiby wrote:
>On Fri, Apr 9, 2010 at 1:22 AM, Julien Vehent <julien@linuxwall.info> wrote:
>
>I could do the first three of above requirements, using
>libnetfilter_queue. But I could not find a way to do the last of them
>:
>
>>> After manipulation  in user space, inject encrypted/decrypted version
>>> of the privileged (copy of) packets to the network or upward to the
>>> application layer.
>
>Is there any solution for the above issue?

Reinjected packets should travel the normal network path (code-wise),
so you can use xfrm, if I am not mistaken.
