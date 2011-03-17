From: Pandu Poluan <pandu@poluan.info>
Subject: Re: When does NAT processing actually takes place?
Date: Thu, 17 Mar 2011 08:59:47 +0700
Message-ID: <AANLkTimiZq=VZRP=kzucqXOJ+Sqj1r3f_Z+5FjT0P+kA@mail.gmail.com>
References: <AANLkTi=8aYepwRCxcCpo+syL4xjX6HkEFtPVbepZDf05@mail.gmail.com>
	<AANLkTik7yeZMEx8ujCPd-fkFa1GRN9Ad82SDJi2emk88@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik7yeZMEx8ujCPd-fkFa1GRN9Ad82SDJi2emk88@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter@vger.kernel.org

On Thu, Mar 17, 2011 at 07:25, Julien Vehent <julien@linuxwall.info> wrote:
>
>
> On Wed, Mar 16, 2011 at 8:20 PM, Pandu Poluan <pandu@poluan.info> wrote:
>>
>> Another question that's been bugging me:
>>
>> When does the actual NAT process (i.e., swapping addresses) take place
>> for DNAT and SNAT/MASQUERADE? And when does the reciprocal NAT (i.e.,
>> reverse NAT, that should happen for instance to process a reply to a
>> packet that's been SNAT-ed) take place?
>>
>>
>> My guess is just after the packet exits the nat table, before it
>> enters the mangle table.
>>
>
> NAT is performed after it exists the Mangle table, in PREROUTING and POSTROUTING.
> http://wiki.linuxwall.info/lib/exe/fetch.php/ressources:dossiers:advanced_networking:nf-packet-flow.png
>
>
> Julien

Ah yes, sorry, got the location of the tables mixed up.

So, it's performed after it exits the Mangle table, and after being
processed by the Nat table?

--
Pandu E Poluan
~ IT Optimizer ~
