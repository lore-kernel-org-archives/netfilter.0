From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Traffic shaping with nftables maps and tc
Date: Thu, 02 Nov 2017 21:34:20 +0100
Message-ID: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509654863;
        bh=UuSIjo6VxLyvK2AzVjDUVdxVXBj1eXvyLWgjLex5pgo=;
        h=Date:From:To:Subject:From;
        b=E4tmsbu7Q7pxFR0oFq43CeMP85z2xU7j1QB+b3NZejbhAPuLQkzN43kAImlac5tug
         uXWOCsQOp1I4Vafo2UFMpfBr6hSyRChaxOi7Ea+AlewC6aPe2pm9htTjxZ6Iaj3EZ1
         7AE7g8UGODYB8CJaFUP6noqdNHs7kqJVZQkuMTog=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509654860;
        bh=UuSIjo6VxLyvK2AzVjDUVdxVXBj1eXvyLWgjLex5pgo=;
        h=Date:From:To:Subject:From;
        b=Ndofvn/aFkS2p7r4o+hocrBkw8hdNlzF4zEJuWMpAdGsnfSR9/vYfpATUKr1i9QJu
         TfD/xst+bh8oiZQtg1KRTJ3Kx+B5HO0pO/Eu/1lx+5G9MDDchi0lOXyfwGltqlsqCD
         9GJuP96a7vyLbhBQ52G1TAKXYGmpG18EZJZByPaY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
i am thinking about improving the way we do bandwidth shaping (traffic 
control) in our network.

Currently we have like 80000 rules that do something like this:

iptables -A post_10_11_171_248_29 -d 10.11.171.249/32 -o vlan1100 -j 
CLASSIFY --set-class 0001:3065

And even when there is some level of optimalization using subchains, i 
guess that nftables can optimize this simply by internal hashing in 
named map (or dictionary - i did not get how these two are different).

I need to have $IP : $CLASS map like this:

10.11.171.247/32 : 0001:4095
10.11.171.248/32 : 0001:3065
10.11.171.249/32 : 0001:2023

And then simply classify the packets using single rule like this:

-d $IP -j CLASSIFY --set-class $CLASS

So i can later shape the classified packets using tc. (BTW i've heard 
that nft has something called "ingress hook" that could replace tc, so i 
could have everything configured thru nft, is that true?)

Is there way to do this in nftables?

-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
