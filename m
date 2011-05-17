From: Denys Fedoryshchenko <denys@visp.net.lb>
Subject: Re: ipset, =?UTF-8?Q?IP=36=5FNF=5FIPTABLES?=
Date: Tue, 17 May 2011 14:14:42 +0300
Message-ID: <fbc9abc624824c8e6f973c342e81fe51@visp.net.lb>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb>
 <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu>
 <4DD256F7.7050007@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD256F7.7050007@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

 On Tue, 17 May 2011 12:07:35 +0100, Mr Dash Four wrote:
>> No, that's not possible. ipset needs the IPv6 support in the kernel.
>>   That can't be accurate - I have administratively disabled IPv6 on 
>> my system (both via sysctl as well as via the kernel command line)  - 
>> and ipset 6.5 runs just fine. I am not using any IPv6 sets though so 
>> that might be the reason why it is not complaining.

 Well, i compile ipset on host with ipv6 enabled kernel, and just copied 
 to host without ipv6. It is seems problem only during compilation i 
 guess (headers?), and it is not right IMO.
 Especially it is a problem for source based distributions, like gentoo, 
 because i cannot compile ipset at all on most of my ipv4-only machines.

