From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Sat, 16 Oct 2010 17:50:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr>
References: <4CB5C1C1.8060809@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB5C1C1.8060809@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-10-13 16:27, Mr Dash Four wrote:

>I have configured a personal vpn with NAT-PMP (which extends from my 
>local to the remote vpn endpoints), but that connection does not appear 
>to be tracked by the nf_conntrack.

Are you using any NOTRACK rules?

>I see the connection made in netstat, but not in nf_conntrack. Is that 
>a bug or is there any other way I can track this connection?
