From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 00:23:21 +0100
Message-ID: <4C6C6B69.7080809@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C6AED.3090008@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

> use iptables rules in the FORWARD chain (beware undesirable 
> interactions with bridged IP traffic through bridge-nf if enabled vith 
> sysctl net.bridge.bridge-nf-call-iptables=1).
I think I'm doing that anyway. For every VM that is started, a strict 
set of iptables rules are set up which only allow traffic in/out of 
specific interfaces (using physdev). The rules also prevent ip spoofing.
