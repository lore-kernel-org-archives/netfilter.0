From: "Marco Barbero" <marco.barbero@gmail.com>
Subject: Re: conntrackd [ERROR] commit: Invalid argument
Date: Wed, 11 Jun 2008 20:11:31 +0200
Message-ID: <e1aa27e00806111111n7ca3c97en89b7b1b973b5b245@mail.gmail.com>
References: <e1aa27e00806090621r3fa83ac0s7bb89d903de3be41@mail.gmail.com>
	 <484FD25F.2010800@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=+7X8tfIYV3nbAAS3nxEvEJtPB0JJzc4+KTSq7Ys5uG8=;
        b=TBKDAbmhVeeMWVBMf6FVIZBky1PdlztEh6FTyezyvK+EugcOdPiHD7UF/95n/HuKOd
         46OFIOH1H132pF3WMfhxo/8fX0Kh+4rCnOOkMRNrgArF8oJnsVMKjE8QN/lpG2lW/uLA
         QdJ6KsjsHGyhlDSC9UGY2goWezPVdsVsfdMY8=
In-Reply-To: <484FD25F.2010800@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-dev@vger.kernel.org

Thanks Pablo,
Now I'm getting:

[Wed Jun 11 20:04:07 2008] (pid=9974) [notice] Committed 1179 new entries
[Wed Jun 11 20:04:07 2008] (pid=9974) [notice] 1179 entries ignored,
already exist
[Wed Jun 11 20:04:07 2008] (pid=9974) [notice] 8 entries can't be committed
[Wed Jun 11 20:04:07 2008] (pid=3012) [notice] resync with master table


So it seems issue is now only on 8 entries

4 entries with:
[ERROR] commit-create: Invalid argument

and 4 entries with:
[ERROR] commit-create: Cannot allocate memory
