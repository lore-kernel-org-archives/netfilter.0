From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables 1.4.x and xt_recent: my rules have fallen and they can't
 get up!
Date: Wed, 06 May 2009 19:07:41 +0200
Message-ID: <4A01C3DD.1000900@chello.at>
References: <49FBFDB7.4070204@gmail.com> <49FC0ED6.1050102@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49FC0ED6.1050102@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> Weedy wrote:
>> So apparently this has become illegal, and neither google or me 
>> playing around has figured out how to update it. Input is most welcome.
>>
>> + iptables -t nat -A prerouting_rule -i br-lan -p tcp --dport 80 -j 
>> REDIRECT --to-port 3128
>> + iptables -t nat -A prerouting_rule -p tcp --dport 2020 -m state 
>> --state NEW -m recent --name ATTACKER_SSH --rsource --update 
>> --seconds 120 --hitcount 5 -j DROP
>> iptables v1.4.3.2:
>> The "nat" table is not intended for filtering, the use of DROP is 
>> therefore inhibited.
>>
>> Try `iptables -h' or 'iptables --help' for more information.
>>
>> This is a openwrt router running the old firewall (not supported or I 
>> would have asked on their mailing list) I will attach it encase 
>> anyone wants to give it a quick peek and finds anything terribly 
>> wrong/outdated (but it does currently work fine).
>>
>> Thank you for your time.
> Hello,
>
> since iptables 1.4.3.2 DROP is prohibited in the nat table.
> It actually was never intended to be used for 'filtering'. Filtering 
> should be done in the 'filter' table (hence the name).
> The nat table only 'sees' state NEW connections, hence the --state NEW 
> is obsolete.
> Change your rules, to DROP / ACCEPT in the filter table.
>
> greets
>
> Mart
>
> P.S. didn't take a look at the attached ruleset...

