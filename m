From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: TEE target
Date: Tue, 27 May 2008 18:46:54 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr>
References: <d95317090805270919s5a8347d5y75a3b8cbf5114727@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090805270919s5a8347d5y75a3b8cbf5114727@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-05-27 18:19, Gilad Benjamini wrote:

>When is the TEE target expected to be a standard part of iptables ?

Probably never.

>If that doesn't happen, when might it be able to compile without it's
>"attached" version of iptables ?

The attached version is just a copy of the official tree,
and is just provided for convenience because a lot of
distros are stuck with old versions.
There are also tarballs of Xtables-addons without the "attached" version;
see http://dev.medozas.de/files/xtables/ for singular files.
