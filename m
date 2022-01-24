From: Steffen Weinreich <steve@weinreich.org>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Mon, 24 Jan 2022 17:49:49 +0100
Message-ID: <69389be8-79d7-2c66-4cb9-1c3ea84c62fd@weinreich.org>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia> <Yc8H9sHapPLHKWXV@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weinreich.org;
        s=dkim; t=1643042991;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:content-language:in-reply-to:references;
        bh=NJ9QrS7JlO9qXAc2O9qCjlRmiNpmKxrpMDeTfQ01xk4=;
        b=IRD5Qf62cvXnox/En/6snwpL0sO52oUrm51KvAUILRJV3CB8zgxBUBHm745a8rYHdvxf1v
        VG1zn6Z+hlVwnWENdkRv3dr5uhRFniriH69c+Wd2rfd+snhW7OUuYTf4BXgADGDtXO2SBE
        5FsesOterdvDoQGm8yobcDNCfyYyRvXr3Y+i81QN4JKe6THrfR58cKigrYfQb3/Ph0Lnjn
        kF3BUuC4FhaEpKTWnIGYF/Odn1ptv98qRpIjmDRab2pgkU4SkanwN5bqeXDu4KuG/Ix2GT
        SR/O4much2nLdTAGpGO2/WuT8B+2pT+RDWHYs7qg7dtyN3ZqhuxYCHf2KPq+Gg==
In-Reply-To: <Yc8H9sHapPLHKWXV@salvia>
Content-Language: de-AT-frami
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,


>> Could you give a try to this kernel patch?
>> Wrong patch, attaching again.
>> Thanks for reporting.

The=C2=A0 patch works in our Test Envirnoment for the last 3 Weeks without a
problem.

How do we get the patch into to the Mainline Kernel, so that we do not
need a separate kernel package for these maschines?


cheerio

Steve

