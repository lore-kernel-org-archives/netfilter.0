From: jon_netfilter@use.startmail.com
Subject: Demystifying sets
Date: Sun, 1 Mar 2020 17:33:14 +0100
Message-ID: <b125461d-57f9-cdc4-0eab-2332fc53b287@negentropy.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
        s=2017-11; t=1583080395;
        bh=RFahLixMqh7Nm0sEigTATDiPvlB8at+1KVa5nY+i99c=;
        h=To:From:Subject:Date:From;
        b=h9lAfVHAquSFMU+fgCa2N2CxPXqc2MBM4Q7A2Ibf5MnE+dw/ywHUCPsU0NHKPzEnW
         fplSIdX4Q64vJuRvVx+YHBhZz45+vFnOkEPZR27T6hTXlsZA17WVLx+V1dUodu7KGg
         huh5Rl1weLdQstsGv/9IBEYLpb+btatsWBshbT6sMCVjb/20Bwz/E2qPedtcd3KJlL
         +xZRedQG/NI+XlQg/u8JZsMKUV6Blo4lTSY2m5gO4M0LRkZExq6AKAKktxGTzK1K0A
         PqP6ftmCrzuXQov4VoJQSXSEx+c6YSWJX19Eht4GANUHzK3YvQkrI+jEANtuMnhZz0
         JLAlbOhfuxBDQ==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi everyone!

I have been trying to transition to nftables from iptables, and I have 
some questions regarding the syntax and usage of sets and their nature, 
to which I could find no answers in the documentation on the nftables 
wiki or the man page of my distribution (debian sid). Thanks in advance 
for those reading!

My versions:

- nftables v0.9.3 (Topsy)
- kernel 5.4.13

1) what is the most up-to-date documentation or version of the man page?

For instance, the man page at netfilter.org says it was updated on march 
21 2018, and doesn't mention things like the dynamic flag for sets. I 
see that there's been a commit adding an explanation for the "ct count" 
expression at [1], but I don't see it included in any man page I could find.

2) what does the dynamic flag for sets actually do?

In debian sid's nft man page, it says this:

 > The set statement is used to dynamically add or update elements in a 
set from the packet path. The set setname must already exist in the 
given table and **must have been created with the dynamic flag**.

Note my emphasis. However, I've tried this, and rules which modify set 
contents from "the packet path" work without having to set the dynamic 
flag for the set that is used (see [2]). After some more 
experimentation, it seems that the dynamic flag *is* required for using 
the limit and conntrack expressions. Which brings me to my next question.

3) What are the rules for the expressions provided to the set statement? 
(add, update)

On "my" man page, the statement is defined thus:

 > {add | update} @setname { expression [timeout timeout] [comment string] }

I've been experimenting with rate limiting, using the limit and ct count 
expressions (statements?). In most examples, they are put inside the 
curly braces, for instance like this [3]:

 > ct state new add @my_connlimit { ip daddr ct count over 20 } counter 
packets 0 bytes 0 drop

or

 > add rule my_filter_table my_input_chain tcp dport 22 ct state new add 
@my_ssh_meter { ip saddr . tcp dport timeout 60s limit rate 10/second } 
accept

 From the man page, I would've assumed that something like "{ ip saddr 
limit rate over 1/minute timeout 60s}" would be correct, since it only 
lists "expression [timeout timeout]". How are the expressions "ip saddr 
timeout 60s" and "limit rate over 1/minute" combined? What are the rules 
for this? Is the "timeout 60s" bit part of the "expression", or is it 
separate? Should the documentation say something like

 > {add | update} @setname { expression [timeout timeout] [expression] 
[comment string] }

?

4) Finally, what's in a set?

I can specify the type of a set, for instance ipv4_addr. I can then in 
addition set the flag to dynamic, which allows me to use rules adding a 
"limit rate" or "ct count" expression to the add/update statements 
modiying the set. Then, when I list the contents of the set, the set 
seems to not only contain the ipv4_addr, but also this "thing" which is 
the "limit rate over 1/minute" part, or "ct count over 2" or whatever. 
What is this part? Can there only be one? How should I think of this? 
The "limit rate" expression/statement seems to not remove the entry 
automatically when the condition no longer matches, but the "ct count" 
statement/expression on the other hand *does* remove the entry 
automatically when the condition no longer holds.

If you've read this far, thanks again! I have high hopes for nftables 
and hope someone has the time and energy to answer some of these 
questions. I'd be more than willing to update docs or wiki examples, for 
instance to clarify the relationship between what requires a dynamic 
flag and its relationship to whether a set is a "dynamic set".

With kind regards,
Jon

1 
https://git.netfilter.org/nftables/commit/?id=fe573574fcb2605bc9011c621f44654707180765
2 
https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path
3 https://wiki.nftables.org/wiki-nftables/index.php/Meters

