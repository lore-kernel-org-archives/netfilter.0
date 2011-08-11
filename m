From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: UDP Scan detection with xtables-addon psd
Date: Thu, 11 Aug 2011 15:54:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108111552250.23274@frira.zrqbmnf.qr>
References: <4E43AC07.4040103@geekosphere.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E43AC07.4040103@geekosphere.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andreas <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Thursday 2011-08-11 12:16, andreas wrote:

>Hi,
>
>But i can't get psd to detect nmap UDP scans.
>15:08 < norg> xv7: it's the commit adabd647b1d0421f961b5cc3808128001facb9bd

Oh yeah, that is strikingly obvious. Fixed in commit v1.37-5-g6c17eb4 
(psd branch).

>And another question is, is the psd development stopped and do you
>suggest to use lscan or do you have any other suggestion for me?

psd and lscan do two different things. One statistically monitors ports 
contacted over time, while lscan looks at one connection and inspects 
the TCP handshake (or lack thereof) to reach its conclusion.
