From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 15:37:38 +0100
Message-ID: <1257345458.1254.250.camel@francois.tc.commsmundi.com>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
	 <4AF163EE.7060306@trash.net>
	 <1257337891.1254.220.camel@francois.tc.commsmundi.com>
	 <4AF183A7.5060005@trash.net>
	 <1257342875.1254.224.camel@francois.tc.commsmundi.com>
	 <4AF18937.5010901@trash.net>
	 <1257345155.1254.245.camel@francois.tc.commsmundi.com>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1257345155.1254.245.camel@francois.tc.commsmundi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Wed, 2009-11-04 at 15:32 +0100, Fran=C3=A7ois Delawarde wrote:
> It might be worth noting that the kernel is patched with IMQ, latest
> version from linux-imq.net, but the IMQ device is not used.

I also have dahdi (digium) and wanpipe (sangoma) drivers loaded for
telephony cards. Could this be the cause of the "taint"


