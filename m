From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: Iptables complains about kernel after filesystem damage
Date: Wed, 3 Oct 2007 13:35:26 +0200
Message-ID: <20071003113525.GA6865@sch.bme.hu>
References: <47024D72.10706@freemail.hu> <000001c8053d$164a2140$6502a8c0@IBM26B52F62DB0>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c8053d$164a2140$6502a8c0@IBM26B52F62DB0>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vass Viktor <vass.viktor@zuriel.hu>
Cc: =?iso-8859-1?Q?'G=E1sp=E1r?= Lajos' <swifty@freemail.hu>, 'Netfilter list' <netfilter@vger.kernel.org>


Hi,

On k, okt 02, 2007 at 11:42:10 +0200, Vass Viktor wrote:
> > (Check in mc by hiting an enter on the iptables....deb) So... 
> If it is a file in this package, reinstalling the package would have fixed
> it.

Have you tried stracing the iptables binary to find out where it goes
wrong?

-- 
KOVACS Krisztian
