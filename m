From: Bojan Sukalo <shukalo83@gmail.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 17:46:54 +0100
Message-ID: <368e93c51002130846j1d3d6db9i6247a729ac326418@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=9txICx+8p+UCnppAF23uCZCZ+Aa/nXR/+sfclO+87Hw=;
        b=njc7lNaj3Mq8HcAM6X8z3EZYBBvFdwpU5iMs75pSEbxJjwdGi7bfixvl/WuF1YruzF
         eh9ovVUzhBCsbgN5g+MO5LoOs4Y59DRHz4NlX76fQ3jtvAw9L8iWiMfq7zFDq3d4d+jM
         aqwkJ4+98SiKS6scathCvzWdVYueD5Jh2i60Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Trentalancia <guido@trentalancia.com>
Cc: netfilter@vger.kernel.org

Thank You Guido, maybe that's the way to go.

Regarding the masquerade I tried that also. Icmp is enabled and what
bothers me most it works even from inside to internet. (I can ping
www.google.com from inside - see the first post in thread).
I 'll try to install newer version of iptables. I hope that
dependencies won't bother me.
If I install newer version of iptables do I have to upgrade kernel or
I can just try and see whether the first update (only iptables) will
give results?



On Sat, Feb 13, 2010 at 5:06 PM, Guido Trentalancia
<guido@trentalancia.com> wrote:
> On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
>> I'am trying to setup nat on RHEL4 box.
>>
>> Kernel: Linux 2.6.9-89.ELsmp x86_64x86
>> iptables: 1.2.11
>
> Bojan,
>
> why don't you try to upgrade to a more recent version of iptables and if
> possible to a more recent kernel ? You know, just in case...
>
> I have a setup similar to yours (except from POSTROUTING which is of
> type MASQUERADING rather than SNAT) and it works all right.
>
> Also, have you checked other parameters such as TTL ? What about ICMP ?
> You can enable ICMP with the following rule:
>
> -A INPUT -p icmp -j ACCEPT
>
> Guido
>
>
