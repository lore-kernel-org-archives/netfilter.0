From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack is bad during DDoS?
Date: Mon, 08 Oct 2007 10:45:18 +0200
Message-ID: <4709EE1E.2060206@trash.net>
References: <4702BDCB.3060102@andrei.myip.org> <4704B0EC.2030802@trash.net> <470562BF.3090504@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470562BF.3090504@andrei.myip.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

[Please keep me CCed]

Florin Andrei wrote:
> Patrick McHardy wrote:
> 
>>
>> Please try 2.6.23 once its out (or the current -rc), it should behave
>> better.
>>
>> 2.6.24 will include stateless NAT again for 1:1 mappings.
> 
> 
> So, can you elaborate a little bit?
> I understand the thing about stateless NAT and 2.6.24 - that's very good
> news, too bad it's not in older versions. :-)
> 
> But what's different in 2.6.23-rc that will make it better in my situation?


The eviction algorithms scans up to a maximum of 8 entries before
giving up instead of stopping at the end of the hash chain (which
is a single entry with a properly sized hash). So the chances
of finding an unconfirmed entry to evict are better.
