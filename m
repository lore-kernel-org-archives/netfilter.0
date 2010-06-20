From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: newbie question on netfilter-conntrack
Date: Sun, 20 Jun 2010 14:15:37 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006201415260.26430@obet.zrqbmnf.qr>
References: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-06-20 13:41, Pete Kay wrote:

>Hi,
>
>I am new to netfilter-conntrack so please excuse me for my simple question.
>
>I am trying to set up a rule such that any UDP packet coming from a
>specific IP:port will be redirected to another IP:port.  Could someone
>please give me an example how this can be done?

Why not just directly connect to the right tuple?
