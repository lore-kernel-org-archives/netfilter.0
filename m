From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: servers redirection
Date: Fri, 19 Oct 2012 02:20:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210190218380.18307@nerf07.vanv.qr>
References: <032613bb98974765717d7ae8ebe48e3c@imap.cnaf.infn.it> <508070F4.300@mutluit.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508070F4.300@mutluit.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Thursday 2012-10-18 23:13, U.Mutlu wrote:

> The following link has a solution for a similar scenario
> "By using iptables and its masquerade feature, it is possible
> to forward all traffic to the old server to the new IP":
>  http://www.debuntu.org/how-to-redirecting-network-traffic-a-new-ip-using-iptables

Well, masquerade (and other NAT targets) do forward traffic per se - 
routing would do that instead -, it merely changes the address.
