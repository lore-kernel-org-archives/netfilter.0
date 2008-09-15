From: Simon Gray <iptables@tech.nologi.es>
Subject: Re: iptables not prevent access
Date: Mon, 15 Sep 2008 12:26:39 +0100
Message-ID: <48CE466F.3030008@tech.nologi.es>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>	 <9518B26607784D55A361431633134C9B@dcyb.net>	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net> <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com> <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> How to find the routing table? 13.121.8.119 is a Windows 2003 Server OS.
>   
netstat -nr

^^ Works on both windows and linux
