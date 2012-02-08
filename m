From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: kernel helper modules parameters
Date: Wed, 8 Feb 2012 04:55:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F31E7D3.5060203@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-02-08 04:11, Mr Dash Four wrote:

>
>> I would like to do some testing with the (t)ftp, sip, h323 and possibly
>> netbios_ns module helpers. I am most definitely not going to use the standard
>> ports these protocols operate on, so need to know, among other things, how can
>> I reconfigure the helpers and the degree of leverage I have (i.e. what I
>> can/cannot get away with). Thanks.

> -bash~# ipset n test hash:ip family inet timeout 0 hashsize 128
> -bash~# ipset a test 10.99.99.1

tl;dr: What does ipset have to do with the tftp/sip/h323 conntrack 
modules?
