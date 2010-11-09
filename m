From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: balance traffic between virtual interfaces on the same network
Date: Tue, 9 Nov 2010 14:53:13 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011091452410.2491@obet.zrqbmnf.qr>
References: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tommaso Calosi <tcalosi@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-11-09 14:38, Tommaso Calosi wrote:

>Hi all,
>
>This is my setup:
>
>eth0:1 192.168.1.10/24
>eth0:2 192.168.1.20/24
>eth0:3 192.168.1.30/24
>
>gateway 192.168.1.1
>
>I know it's a strange question but it's crucial to do this in my setup.
>I need to balance traffic between these virtual interfaces

Those are not interfaces. Stop using ifconfig, it deludes the mind - use 
iproute2 instead.
