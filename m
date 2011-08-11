From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: UDP Scan detection with xtables-addon psd
Date: Thu, 11 Aug 2011 18:10:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108111808580.28452@frira.zrqbmnf.qr>
References: <4E43AC07.4040103@geekosphere.org> <alpine.LNX.2.01.1108111552250.23274@frira.zrqbmnf.qr> <4E43E818.6000200@geekosphere.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E43E818.6000200@geekosphere.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andreas <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Thursday 2011-08-11 16:32, andreas wrote:

>On 08/11/2011 03:54 PM, Jan Engelhardt wrote:
>>> On Thursday 2011-08-11 12:16, andreas wrote:
>>> 
>>>>> Hi,
>>>>> 
>>>>> But i can't get psd to detect nmap UDP scans. 15:08 < norg>
>>>>> xv7: it's the commit adabd647b1d0421f961b5cc3808128001facb9bd
>>> 
>>> Oh yeah, that is strikingly obvious. Fixed in commit
>>> v1.37-5-g6c17eb4 (psd branch).
>>> 
>
>Is working now with nmap -sU scans. Thanks.
>Also Thanks for the further informations.
>
>So still one question open. What is the reason, that ACK Scans aren't
>detected (with nmap -sA $IP)?

They should be classified as -m conntrack --ctstate INVALID, since they 
won't match anything preexisting.

Assuming this is not the case (e.g. due to liberal pickup of 
connections, see a similarly named sysctl), how else would you determine 
that they are not real?
