From: Julien Vehent <julien@linuxwall.info>
Subject: Re: SpamHaus DROP list in Netfilter
Date: Tue, 16 Dec 2008 17:30:01 +0100
Message-ID: <a7b1c995733e51ccfc4d9975e73376db@localhost>
References: <57c616a9d26d450a7cda0fa3d52a191d@localhost> <200812161604.37183.misch@multinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200812161604.37183.misch@multinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwartzkopff <misch@multinet.de>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, 16 Dec 2008 16:04:36 +0100, Michael Schwartzkopff
<misch@multinet.de> wrote:
> Am Dienstag, 16. Dezember 2008 15:27 schrieben Sie:
>> Hi All,
>>
>> I was wondering how I could integrate the spamhaus drop list
>> (http://www.spamhaus.org/drop/drop.lasso) into my Netfilter rules.
>>
>> The list is not too long, so I thought putting it directly into a new
>> chain
>> would be doable without degrading too much the performances. Somebody
>> also
>> told me to use a chains tree, but I wonder if this is necessary
>> considering
>> the size of the list...
>>
>> Has anybody done this before ?
>>
>> Thanks,
>> Julien
> 
> google von "iptables spamhaus" gives you the site:
>
http://robotterror.com/site/wiki/aggressive_spam_and_zombie_blocking_via_spamhaus_org_drop_and_iptables
> 
> on the first place.
> 
> Cheers,
>

Dear Doctor,

Thanks for your tremendous help for adding a rule in a chain...... :/

My question, however, concerns more the performances issue. This list will
be checked for every single TCP-SYN or UDP packet that goes through the
kernel, and if the first byte is something like 128 , it's definitely
useless to try all the 91.*

But implementing a tree of chains in netfilter is also quite a pain in the
ass. So before choosing a solution, I would like the opinion of the
community.

Best regards,

Julien



-- 
www.linuxwall.info
