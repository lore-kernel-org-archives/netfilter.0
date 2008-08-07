From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 07 Aug 2008 14:35:18 -0500
Message-ID: <489B4E76.2040702@riverviewtech.net>
References: <g7da9g$21r$1@ger.gmane.org> <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de> <g7f2ch$tbm$1@ger.gmane.org> <489B11EA.6020700@riverviewtech.net> <alpine.LNX.1.10.0808071202200.8323@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808071202200.8323@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/07/08 11:03, Jan Engelhardt wrote:
> That of course won't work because Xtables does chain inspection and 
> spots the illegal use of SNAT in a chain which is referenced from 
> PREROUTING.

Sorry. I was thinking DNATing in both the PREROUTING and OUTPUT chains.



Grant. . . .
