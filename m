From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE] Release of iptables 1.4.0rc1
Date: Wed, 17 Oct 2007 10:48:15 +0200
Message-ID: <4715CC4F.30400@trash.net>
References: <47139AD0.8060002@netfilter.org> <slrnfh7f7l.crr.petr.pisar@album.ics.muni.cz> <471479F5.4000002@trash.net> <slrnfh9ioo.31t.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <slrnfh9ioo.31t.petr.pisar@album.ics.muni.cz>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Petr Pisar wrote:
> Probably you forgot on manual pages:
> 
> --- Makefile.old	2007-10-16 16:05:07.000000000 +0200
> +++ Makefile	2007-10-16 16:07:37.000000000 +0200
> @@ -62,7 +62,7 @@
>  EXTRAS+=ip6tables ip6tables.o ip6tables.8
>  EXTRA_INSTALLS+=$(DESTDIR)$(BINDIR)/ip6tables $(DESTDIR)$(MANDIR)/man8/ip6tables.8
>  EXTRAS+=ip6tables-save ip6tables-restore
> -EXTRA_INSTALLS+=$(DESTDIR)$(BINDIR)/ip6tables-save $(DESTDIR)$(BINDIR)/ip6tables-restore # $(DESTDIR)$(MANDIR)/man8/iptables-restore.8 $(DESTDIR)$(MANDIR)/man8/iptables-save.8 $(DESTDIR)$(MANDIR)/man8/ip6tables-save.8 $(DESTDIR)$(MANDIR)/man8/ip6tables-restore.8
> +EXTRA_INSTALLS+=$(DESTDIR)$(BINDIR)/ip6tables-save $(DESTDIR)$(BINDIR)/ip6tables-restore $(DESTDIR)$(MANDIR)/man8/ip6tables-save.8 $(DESTDIR)$(MANDIR)/man8/ip6tables-restore.8
>  endif


Fixed, thanks.
