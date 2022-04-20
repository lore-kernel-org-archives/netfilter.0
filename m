From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: nft JSON rule output order
Date: Wed, 20 Apr 2022 10:16:33 +0200
Message-ID: <87lew06ufy.fsf@alfa.kjonca>
References: <DM8PR06MB7717442CEA8AD5A96EE9BFBCF9F29@DM8PR06MB7717.namprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1650442601; bh=+BwjEHQq7XC1oB391AOP9Xysr1aUxK4b3f99MyRFDrM=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=ZhqgcKzWtrNyB3tZaVBKaRbBR4mS4r72W+8HmXIEbI45B20Qrk4hQbD3Sl7m7jXHV
         z9F+D5w55SGbY0Ikq7Z9Zl3jhZ2UdFTmDQ0noOcuh3s+h35G8sRk/xhXmAkfCI6wJX
         SD77nGpQDT6F58UKQ/3KGjyXhd2iiTZyDYGPKJtg=
In-Reply-To: <DM8PR06MB7717442CEA8AD5A96EE9BFBCF9F29@DM8PR06MB7717.namprd06.prod.outlook.com>
        (Brian Atkins's message of "Tue, 19 Apr 2022 22:14:05 +0000")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Atkins, Brian" <Brian.Atkins@netapp.com> writes:

> Will the rules for a given chain always appear in the correct order when using JSON?
> I didn't see it explicitly stated, and the data structures used in JSON don't suggest a required ordering (as might be assumed if rules where an array within a chain).
>

If I understand correctly (please correct me if I am wrong)
Whole nftables config is dumped as json table where simple record in
table is "line" - this should prevent oredr.
KJ

-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
