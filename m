From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: udplite and ports
Date: Tue, 16 Mar 2010 08:28:29 +0100
Message-ID: <4B9F331D.4090509@chello.at>
References: <4B9B568F.7020609@chello.at> <cfeab66d1003132143u76cb0b6i4f88005b9d50d285@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003132143u76cb0b6i4f88005b9d50d285@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 14.03.2010 06:43, netfilter-owner@vger.kernel.org wrote:
> On Sat, Mar 13, 2010 at 2:40 PM, Mart Frauenlob
> <mart.frauenlob@chello.at> wrote:
>> Hello,
>>
>> what am I missing, why is that command not working:
>>
>> iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCEPT
>> iptables v1.4.7: unknown option `--destination-port'
>> Try `iptables -h' or 'iptables --help' for more information.
>>
>>
>> uname -a
>> Linux eris 2.6.33-eris-2010-03-06 #1 Sat Mar 6 01:36:52 CET 2010 i686
>> GNU/Linux
>>
>> -p udplite -m multiport --ports 123,124 ... works.
>>
>>
>> Thanks for your help!
>>

> 
> Could you try option --dport instead of  --destination-port  ?
> 
>  These options depends on the iptables librararied . You can do a "nm"
> command on  all the dynamic libraried to see whether it is supported .
> It could be a problem with configuration or  right library might not
> be copied .

of course I tried --dport. Wonder why that should be different in
regards of libraries.

