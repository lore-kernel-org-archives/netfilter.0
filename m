From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: NAT64
Date: Wed, 20 May 2009 10:44:27 +0000 (UTC)
Message-ID: <slrnh17nob.fg3.petr.pisar@album.ics.muni.cz>
References: <4A13B386.7030902@redpill-linpro.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2009-05-20, Tore Anderson <tore.anderson@redpill-linpro.com> wrote:
>
> does anyone know if an working Linux-based implementation of NAT64
> exists (within the Netfilter framework or not), or if there is one being
> worked on?
>
I know about about TRT implementation---ptrtd which does not support ICMP and
does not implement any application level conntracking (FTP, SIP etc.).

There also exists wrapsix <http://wrapsix.tuxportal.cz/>. However
I don't know wheter it's TRT or NAT64. According talks to its developer
it looks like NAT64 and it does not do ALG too.

-- Petr

