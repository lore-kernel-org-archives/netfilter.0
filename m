From: Hubert Tonneau <hubert.tonneau@fullpliant.org>
Subject: Re: failed to configure iptables with 2.6.16 kernel
Date: Tue, 28 Mar 2006 13:10:54 GMT
Message-ID: <064G9Y712@briare1.heliogroup.fr>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751249AbWC1J2t@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: Harald Welte <laforge@netfilter.org>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

Harald Welte wrote:
>
> this sounds like you're missing support for the tcp/udp match.
> This functionality is implemented in xt_tcpudp.{c,ko}, which is compiled
> as soon as x_tables is compiled.

Loading 'xt_tcpudp' module solves the problem. Thanks for the answer.

So, the problem was just that the new 'x_tables' module is loaded automatically
according to modules dependencies, but 'xt_tcpudp' is not.
As a result, an upgrade of the FullPliant user land tools is required in order
to force the 'xt_tcpudp' module to load before calling 'iptables' with
'--destination-port' option.
