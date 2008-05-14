From: Patrick McHardy <kaber@trash.net>
Subject: Re: Problems with mms-conntrack-nat
Date: Wed, 14 May 2008 02:25:06 +0200
Message-ID: <482A3162.8080109@trash.net>
References: <6BEC0BC0C32DBE4480920A1A1DA06D25016DAC8F@MERCURIUS.atlas.atlascollege.nl> <4829AB4B.3000104@trash.net> <6BEC0BC0C32DBE4480920A1A1DA06D2501AB9DEE@MERCURIUS.atlas.atlascollege.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6BEC0BC0C32DBE4480920A1A1DA06D2501AB9DEE@MERCURIUS.atlas.atlascollege.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Kaagman <P.Kaagman@atlascollege.nl>
Cc: netfilter@vger.kernel.org

Peter Kaagman wrote:
> I am under the impression that I need this module to allow users to
> access streaming media on the Internet. Being a school this is kinda
> important to us. And our current firewall machine is in desperate need
> for an upgrade.

I like that idea more than the usual "lock everything down" :)
>
> I sure hope my impression is wrong.... is there something else I could
> use... a certain technique I could use

I know basically nothing about MMS, but according to wikipedia its
obsoleted in favor of RTSP. In most cases (protocols like SIP or
H.323 which use seperate bands for signalling and data being the
expectation) you don't need any additional helpers for this since
the data is transported in-band.

Do you have a specific example of something that would need this
helper?

>
> An rtfm (accompanied by a link ;)) would be greatly appreciated.

On what topic? :)

