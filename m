From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Linux Firewall Active/Active
Date: Thu, 6 Nov 2014 00:55:38 +0100
Message-ID: <20141105235538.GA3599@salvia>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
 <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
 <CAH_OBifYvkOK-RqS76ODT2En1r0bN99oU8cCQFJdDE7CGH67_g@mail.gmail.com>
 <CAPJdpdBj2va5U_PZs_WSWe0XWX4jreSdMBEpOFO-_Fpi=EEKdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPJdpdBj2va5U_PZs_WSWe0XWX4jreSdMBEpOFO-_Fpi=EEKdA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: shawn wilson <ag4ve.us@gmail.com>, Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>, Ricardo Klein <klein.rfk@gmail.com>, netfilter <netfilter@vger.kernel.org>

On Wed, Nov 05, 2014 at 05:43:39PM -0500, Paul Robert Marino wrote:
> I've actually been doing this successfully with conntrakd, keepalived,
> and quagga
> 
> Essentially I'm using quaga for OSPF and BGP externally with equal cost paths.
> 
> For conntrackd with FTFW and "DisableExternalCache On"
>
> Do NOT use the howto's on the web or the examples that come with
> conntrakd or keepalived for configuring keepalived they are outdated
> and can cause major problems.

It would be great if you can contribute a patch to extend the
conntrack-tools manual to document this. The documentation is
available in docbook format in the git tree. People asks for this
configuration on the mailing list from time to time.

Thanks.

P.S: I think that update should also indicate that possible race
conditions may happen between the synchronization and packets in
active/active asymmetric path, so people are aware of it too.
