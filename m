From: =?windows-1252?Q?Javier_Prieto_Mart=EDnez?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Tue, 22 Apr 2008 08:15:14 +0200
Message-ID: <480D8272.1020200@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net> <480C3A6A.3090206@juntadeandalucia.es> <480D3FA2.4050000@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480D3FA2.4050000@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


> Ok, to me logging is recording information and filtering is either 
> allowing traffic to pass or not.  Based on your original post it 
> sounds like you are wanting to do some re-direction of traffic too.  
> Is this correct?

Yes. We are logging and filtering right now, but we want to redirect 
traffic too.

> The bridge can not be totally transparent and change things at the 
> same time.  If you are having the bridge change things, the network 
> will operate differently with it in verses out of service.  Please 
> clarify what you are wanting.
The point is we want the bridge to be transparent except for one 
particular redirection we want to do :-)

> Remember that IPTables operates on layer 3 and EBTables operates on 
> layer 2.  So unless you have your kernel configured to do such, 
> IPTables will not see layer 2 traffic.  So, either you need to use 
> EBTables (preferred in my opinion) or you need to configure your 
> kernel so that IPTables sees layer 2 traffic.

Thanks for the advice. I'll try with EBTables, then.

Regards.
    Javier
