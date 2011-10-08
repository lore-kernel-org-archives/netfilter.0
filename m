From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: user-space ipsec implementation using netfilter_firewall
Date: Sat, 8 Oct 2011 11:39:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110081127180.2367@frira.zrqbmnf.qr>
References: <CAG+XuE5sguwOVK1oasmD2ou8BMZEN=F333h9P0X12uHE1oLawg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE5sguwOVK1oasmD2ou8BMZEN=F333h9P0X12uHE1oLawg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prashant Batra <prashant0100@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2011-10-08 08:50, Prashant Batra wrote:

>Hello,
>
>I am thinking to implement user-space IPSec using NETLINK_FIREWALL
>protocol. This is how, I am thinking to proceed-
>
>-Get the plain packet sent out using OUTPUT rule with QUEUE target in
>the user space. Encapsulate the packet and send out ESP packet.
>-Similarly get the ESP packet sent from the peer gateway, get it into
>user space with INPUT ESP based rule, decrypt the packet
>and send it to the application using raw sockets.
>
>But I have some doubts whether this will work just fine or not.

_Outputting_ data to a raw socket fd is not going to make it appear in 
the _input path_.

Don't make it more complicated than it needs to be.

The kernel ESP encoder/decoder works just fine.
