From: marek <cervajs64@gmail.com>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 21:47:00 +0200
Message-ID: <37e0df9b-fb90-c085-1b09-c35fc839e901@gmail.com>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
 <198a0e49-7406-45b8-9e7b-4c074a7b31dc@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696016824; x=1696621624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNyVsU9HY1VwIh706JXcPO40pvUGCofLbG0jipKZRSg=;
        b=P2a/VN3CeNHqjWrymCm4VJY7Ci/QSAQujK4JmJx654M97OaVlzvv9NaYSrf8Hhkyre
         0PJx0PGE5M+OutDVqwpFghY6eKPxCRXkbtGmWA/PrCEAs9EqLD3zGYq0znPGDL0E21og
         vv95p3tw5lA+S7e45dmhfh9wrNXxLTiChhKZzzBLK7p42zNFW/H691gF/hSWqJCphvKl
         BVAZDgiCQbbS0mkyXRG9WOP5zE4xcLZ9J/BsxbGyhzinAIMZXMgxovKnYoyK4Cs8u7S4
         tBNRzOmwhl0VltPU6shxm0anPSkOshJPQDtRMtbr1/eWx7Ylj9R2zwbVqajfyxJ2uXjv
         FKVA==
In-Reply-To: <198a0e49-7406-45b8-9e7b-4c074a7b31dc@app.fastmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org


Dne 2023-09-29 v 16:41 Kerin Millar napsal(a):
> On Fri, 29 Sep 2023, at 2:44 PM, marek wrote:
>> hi,
>>
>> i'm using in production ipset swap with ~3000 ip addr
>>
>> i.e.
>>
>> - change coming from customer (new ips, old ips deprecated)
>>
>> - generation of new list /etc/sysconfig/ipset-new
>>
>> - swap ipset-new with ipset
>>
>> transaction is near real-time
>>
>>
>> now i'm moving from RHEL7 to RHEL9 (rocky, kernel 5.14, nftables 1.0.4)
>> and trying move from ipset to nftables sets
>>
>> nft add set ip filter blackhole { type ipv4_addr\; comment \"drop all
>> packets from these hosts\" \; }
>> fill the set
>>
>> now the new flow is
>>
>> - change coming from customer (new ips, old ips deprecated)
>>
>> - nft flush set ip filter blackhole
>>
>> - nft add element ip filter blackhole { X }   (bash for loop)
> Executing nft repeatedly will certainly be slow, if that is what you are currently doing. I'd be interested to know what you are using for to iterate over precisely because there's a fair chance that your use of for is an anti-pattern to begin with.
>
>>
>> it tooks 10sec
>>
>> can you recommend better way? (performance similar to ipset swap)
> Yes, definitely. However, I would prefer to see some of the existing code first. This will make it easier to provide clear guidance as to how to modify your script. In particular, please make it clear where the input data comes from, and the precise format of this data.


i'll try tip from previous mail

current version is very simple loop like

cat file | while read i

do

nft add element ip filter blackhole { $i }

done

"i" is  ipv4 /32 ip address

Marek



