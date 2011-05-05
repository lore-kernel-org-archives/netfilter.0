From: Alex Bligh <alex@alex.org.uk>
Subject: Re: How to programatically atomically write one CHAIN (not table)
Date: Thu, 05 May 2011 16:17:56 +0100
Message-ID: <D2237FDC0E85A86EE664593F@nimrod.local>
References: <0960E691FF860DE35219EA38@nimrod.local>
 <alpine.LNX.2.01.1105051603080.15936@obet.zrqbmnf.qr>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105051603080.15936@obet.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Alex Bligh <alex@alex.org.uk>



--On 5 May 2011 16:08:53 +0200 Jan Engelhardt <jengelh@medozas.de> wrote:

> do_command alone does not commit the result.
> restore is right in what it does.

Ah OK - have reread the source and now understand. So a pipe to
iptables-restore with "-n" on the command line, and "-F" inside
the chain to replace is the right way to go?

-- 
Alex Bligh
