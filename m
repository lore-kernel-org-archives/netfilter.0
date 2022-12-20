From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 21:01:11 +0100
Message-ID: <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 20.12.22 um 20:50 schrieb ToddAndMargo:
> On 12/20/22 11:41, Reindl Harald wrote:
>> iptables-nft -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
> 

> What do I need to alter on my ftp tables to get this
> to work?  Do I remove "-m conntrack"?

no you need to understand the rule above
it's RAW PREROUTING, all your rules below are INPUT

and frankly i have no idea why you have that much "-ctstate 
RELATED,ESTABLISHED" rules with a useless "! --syn"

you need exactly ONE "-m conntrack --ctstate RELATED,ESTABLISHED -j 
ACCEPT" rule as the first of your ruleset which handles UDP and TCP (aka 
don't specify -p)

and one which drops "ctstate INVALID" which can't be at the same time 
"RELATED,ESTABLISHED"

that rule handles 99% of all packets - everything after that are new 
connections by definition and need your specific ACCEPT RULES

at the end of the ruleset you can set a final DROP action but with 
"policy DROP" everything not accepted will be dropped anyways

Chain INPUT (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source 
destination
1    6730K 2218M ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0            ctstate RELATED,ESTABLISHED

> $tbls -A dsl-out  -o $eth1  -p tcp  -s $eth1_addr --sport $unassgn 
> --dport ftp         -m conntrack --ctstate NEW,ESTABLISHED           -j 
> ACCEPT
> 
> $tbls-nft -A dsl-in   -i $eth1  -p tcp  ! --syn --sport ftp -d 
> $eth1_addr --dport $unassgn -m conntrack --ctstate RELATED,ESTABLISHED 
>      -j ACCEPT
> 
> $tbls-nft -A dsl-for  -i $eth1  -p tcp  ! --syn --sport ftp -d 
> $internal_net  --dport $unassgn  -m conntrack --ctstate 
> RELATED,ESTABLISHED  -j ACCEPT
> 
> $tbls-nft -A dsl-out  -o $eth1  -p tcp  -s $eth1_addr       -d $ANY_IP 
>      -m helper --helper ftp -m conntrack --ctstate RELATED,ESTABLISHED 
> -j ACCEPT
> 
> $tbls-nft -A dsl-in   -i $eth1  -p tcp  ! --syn  -s $ANY_IP -d 
> $eth1_addr    -m helper --helper ftp -m conntrack --ctstate 
> RELATED,ESTABLISHED  -j ACCEPT
> 
> $tbls-nft -A dsl-for  -i $eth1  -p tcp  ! --syn  -s $ANY_IP -d 
> $internal_net -m helper --helper ftp -m conntrack --ctstate 
> RELATED,ESTABLISHED  -j ACCEPT
