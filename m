From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirecting Outbound Port to Internal Server
Date: Wed, 9 Jun 2010 23:06:34 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006092305420.16916@obet.zrqbmnf.qr>
References: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilaGR9jPpybgfPataLK5v6OZTCDhJM7mbqPEuNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-06-09 22:48, Aaron Clausen wrote:

>I'm trying to sort out a way to redirect all outgoing traffic destined
>for port 8080 to an internal server.  I must be having some nasty
>brain fart because I just can't get it working.

Just directly connect to the target address.
