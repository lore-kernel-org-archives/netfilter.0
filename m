From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Thu, 1 May 2008 22:56:37 +0000 (UTC)
Message-ID: <slrng1kil5.i14.petr.pisar@album.ics.muni.cz>
References: <460876.13814.qm@web57307.mail.re1.yahoo.com> <481A47D3.6080201@usa.net>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2008-05-01, Josh Cepek <josh.cepek@usa.net> wrote:
>
> AFAIK there is no way to manually flush the conntrack state table or
> remove specific entries.
>
There is a way how to do it. The tool is called "conntrack", it's part
of conntrack-tools package and it's distributed by Netfilter team.

-- Petr

