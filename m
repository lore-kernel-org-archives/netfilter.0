From: John Smith <ml375mail-pof@yahoo.de>
Subject: IP gets lost during redirection
Date: Fri, 15 Aug 2008 00:15:54 +0200
Message-ID: <g82aqt$kes$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I got a server (first machine) which is reachable via the internet.
Depending on kind of Request (HTTP, FTP...) it redirects internally to a
different machine. This machine (second machine) is running apache2 for
example. Everthing works fine.
Yet the apache logs on the second machine always list the redirecting
machine (first machine) as the requesting adress/ip and not the ip adress
of the requesting client from the internet.

How can I fix this? I'm sorry to be so unspecific about the configuration
of iptables on the redirecting machine, but this is all I know about it.
However I can get more information if it is needed for the solution and
you can exactly say what you need.

Greets, John

