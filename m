From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sun, 20 Aug 2017 09:49:14 +0200
Message-ID: <c4889cb7-8429-5363-93b9-7da9f2eb2476@plouf.fr.eu.org>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
 <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
 <8980c2d3-8a82-651f-2553-8e15fbebfec8@plouf.fr.eu.org>
 <20170820021515.GA3396@dimstar.local.net>
 <f93751b4-db84-1e4b-0a79-3a58424b787f@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f93751b4-db84-1e4b-0a79-3a58424b787f@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: khawar shehzad <shehzad.khawar@gmail.com>, netfilter@vger.kernel.org

Le 20/08/2017 à 09:31, khawar shehzad a écrit :
> So, the question is: Can we FILTER packets (in my case accepting packets 
> which have a specific source IPv6 Addresses) before doing NAT in the 
> same box/machine/server (using iptables or nftables)?

Sure. With iptables you can do it in the raw or mangle PREROUTING 
chains, even though they are not primarily intended for filtering.

However, when the host is a router, filtering in PREROUTING is not the 
same as filtering in INPUT : PREROUTING sees all packets entering the 
host, while INPUT sees only packets directed at the host itself (after 
DNAT).
