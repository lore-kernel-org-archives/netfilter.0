From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 20:04:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104302003270.9101@obet.zrqbmnf.qr>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com> <1303885014.18916.10.camel@andybev-desktop> <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com> <4DB80945.8040304@atc.tcs.com> <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
 <4DB817A5.3020604@atc.tcs.com> <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com> <4DB90AE6.9070909@atc.tcs.com> <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com> <1304150575.1579.15.camel@andybev> <20110430165041.GN2976@cardinal>
 <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Hendrie <mike@hendrienet.com>
Cc: netfilter@vger.kernel.org

On Saturday 2011-04-30 19:47, Mike Hendrie wrote:

>Trying to apply:
>iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
>
>I get the following error -
>Bad argument `MASQUERADE'
>Try `iptables -h' or 'iptables --help' for more information.
>
>It does not like the command you suggested.....

Well - rule of thumb: *always* quote your "$arguments" unless they 
contain separators and wish to deliberately split it...
