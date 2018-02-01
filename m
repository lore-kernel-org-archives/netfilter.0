From: =?utf-8?Q?H=C3=BCsn=C3=BC_Demir?= <hdemir@metu.edu.tr>
Subject: Re: nftables set - network/netmask
Date: Thu, 1 Feb 2018 21:28:20 +0300
Message-ID: <7448FEA7-1FC9-4B63-9D5A-39F9A9E61E09@metu.edu.tr>
References: <39fdc646-1ef4-a42c-c9f1-705c18b709ec@metu.edu.tr> <beb5146e-837f-fb5d-c766-e69547a6287f@metu.edu.tr> <CAOkSjBiMZUKBGYNJMaq98KzxDLWPLa_hd6+6Af06JWuAfM8G=A@mail.gmail.com> <20180201111940.fu556ybv2ob2k3l5@salvia>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20180201111940.fu556ybv2ob2k3l5@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Arturo Borrero Gonzalez <arturo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

Thanks for yorum answer but it would Kore useful for me to add multiple cdrs like 

{
10.10.0.0/24 . tcp . 22,
10.1.0.0/27 . tcp . 21,
}


Etc.

I did not perf test bey writing a rule for each block. About 10 rules and 10 different subnet block, it will be 100 rules, %90 increase. Better to stick with ipset?

I have lots of different subnets, and in ipset it is pretty easy. 

As far as I see, netmask support will suffice for that.

By the way, It would be helpfull to add these to the wiki.

Thanks again.

iPad’imden gönderildi

Pablo Neira Ayuso <pablo@netfilter.org> şunları yazdı (1 Şub 2018 14:19):

>> On Thu, Feb 01, 2018 at 11:03:35AM +0100, Arturo Borrero Gonzalez wrote:
>>> On 1 February 2018 at 08:50, hdemir <hdemir@metu.edu.tr> wrote:
>>> Hi,
>>> 
>>> I found this conversation;
>>> 
>>> https://www.spinics.net/lists/netfilter/msg56947.html
>>> 
>>> It would be useful to have NET function as ipset has.
>>> 
>>> 
>> 
>> Then, using that example:
>> 
>>> hash:net,net
>> 
>> % nft add rule tablename chainname ip saddr and 255.255.255.0 . ip
>> daddr and 255.255.255.0 vmap { 10.10.10.0 . 10.10.20.0 : accept }
>> 
>>> hash:net,port,net
>> 
>> % nft add rule tablename chainname ip saddr and 255.255.255.0 . tcp
>> dport . ip daddr and 255.255.255.0 vmap { 10.10.10.0 . 80 . 10.10.20.0
>> : accept }
>> 
>> 
>>> hash:net,iface
>>> 
>> 
>> % nft add rule tablename chainname ip saddr and 255.255.255.0 . iif
>> vmap { 10.10.10.0 . eth0 : accept }
>> 
>> Will add this to the nftables wiki [0].
> 
> Thanks Arturo!
> 
> Sorry, I overlook your reply.

