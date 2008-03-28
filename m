From: Per Jessen <per@computer.org>
Subject: Re: basic load distribution using -m statistic --mode nth
Date: Fri, 28 Mar 2008 08:23:11 +0100
Message-ID: <47EC9CDF.5080009@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Patrick McHardy wrote:

>
> DNAT is terminal, so you need:
>
> rule 1: --every 2 --packet 0
> rule 2: unconditional
>

Thanks Patrick!  Just what I needed.


/Per Jessen, Z=FCrich
