From: "Charles Romestant" <cromestant@gmail.com>
Subject: Re: Port Forwarding .
Date: Wed, 9 Jul 2008 14:50:36 +1930
Message-ID: <5078d3df0807081220q71674472m660de0de432e6bd7@mail.gmail.com>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
	 <4872943B.2060309@riverviewtech.net>
	 <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>
	 <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>
	 <5078d3df0807071610m5b47a81qc5d830a8b7bd0cff@mail.gmail.com>
	 <5078d3df0807071658p73a25291v8522a9645fa8b8f9@mail.gmail.com>
	 <4872CFA4.4030406@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=jOg1jtSYXDtJXW2O8gxSogpcTN3NHEfshg6Nw6XzU9Q=;
        b=fNwqqQog+q8sezKirHMZtjXfA7LLmlhnbAeI5fNtWBk3WGWL58ueyB8biJC42Xz5iV
         SkAl/6ITEAYu9fbvd5V7vf8AGHhJLZv+JoSzF6bQSqBNyzyZ1tmfs8YAbWz5VgXhNLCG
         SCJRm6CzHyLaVdbxRWu+zrBDtqGWfiY++kzxA=
In-Reply-To: <4872CFA4.4030406@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

ok, flushed all tables, and all chains, changed back the policy to
accept, and then reentered the rules you sent me before Grant.  And
stil no dice.
root@charz-server:/home/charz# iptables -t nat -nvL
Chain PREROUTING (policy ACCEPT 1241 packets, 167K bytes)
 pkts bytes target     prot opt in     out     source
destination
   24  1296 DNAT       tcp  --  eth0   *       0.0.0.0/0
10.0.1.192          tcp dpt:80 to:10.0.10.1

Chain POSTROUTING (policy ACCEPT 29 packets, 5063 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 SNAT       tcp  --  *      eth0    10.0.10.1
0.0.0.0/0           tcp spt:80 to:10.0.1.192

Chain OUTPUT (policy ACCEPT 35 packets, 5543 bytes)
 pkts bytes target     prot opt in     out     source
destination

still the prerouting seems to be matching but the others stay at 0.

At the moment i m still reading documentation to see if i can spot the mistake,
thanks again for the help.

Why would the prerouting accept and not continue to postrouting?

On Tue, Jul 8, 2008 at 9:53 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 7/7/2008 6:58 PM, Charles Romestant wrote:
>>
>> ok a little more info, for debugs sake...
>
> Ok!  You have not been clearing your IPTables before adding additional
> rules.  Please run the following commands and re-try what I submitted
> earlier.
>
> iptables -t filter -F
> iptables -t nat -F
>
>> again it seems only the first rulein the PREROUTING is executing as
>> consecutive looks at this while trying to browse to the page show increment
>> in pckts.
>
> *nod*
>
> Your first DNAT rule, which is incorrect, is being matched before the
> rule(s) that I provided.  You need to flush your IP tables and chains.
>
>> again, thank you for your patience.
>
> *nod*
>
> You are welcome.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Charz
