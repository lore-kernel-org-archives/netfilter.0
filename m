From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Selective proxy ARP
Date: Wed, 13 Jul 2016 11:47:41 +0100
Message-ID: <630AB55B-9C77-4636-A017-E226F99497DF@alex.org.uk>
References: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk> <CADGd2DpDLuqSoZX1Hta1oVhGrOMUbrGaoT+WP0zrpMn=YBV1eQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1468406861; bh=nmOdt0FpLQJ4ywXtsy+udNoJvSPqqT3A3us+XquutLA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=QKAOnru+K1+wcT6awu4SoM2+qe9lgPiUOub9BGOPMmue8dK6OITVFrWrfjViNlrM8
	 N6qNkhVxUXDbgB4Ldd7p2ENU50BWUq3Nn98LGFoAc4F62a9c2nTUDbHbSMA6nYqKKQ
	 PppBdP/XslwWFGkoycbsXreEEQgosd9O3LCQXHrY=
In-Reply-To: <CADGd2DpDLuqSoZX1Hta1oVhGrOMUbrGaoT+WP0zrpMn=YBV1eQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Lauro <johnalauro@gmail.com>, Michal Kubecek <mkubecek@suse.cz>
Cc: Alex Bligh <alex@alex.org.uk>, Mail List - Netfilter <netfilter@vger.kernel.org>

Interesting this does not work:

> On 13 Jul 2016, at 01:31, John Lauro <johnalauro@gmail.com> wrote:
> 
> for h in `seq 1 254` ; do arp -i eth0 -Ds 192.0.200.$h eth0 pub ; done

(with bond0 and the IP address substituted)

and neither does this:

On 13 Jul 2016, at 06:26, Michal Kubecek <mkubecek@suse.cz> wrote:
>  ip neigh add proxy 192.0.200.101 dev bond0

in that a device on the same network cannot successfully arp
for the address.

Any ideas?

-- 
Alex Bligh




