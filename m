From: okahei@gmail.com
Subject: Re: CONNMARK target
Date: Wed, 15 Oct 2008 09:49:01 +0200
Message-ID: <ab52e4180810150049x39258263k89cf61758ef1133e@mail.gmail.com>
References: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com>
	 <20081013151007.GE4148@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=NNN/hkEDAL7MUKhsDnyFMacshwo8xmdDglq3hMSIy3k=;
        b=vIi5TKzvsE3aQHgKUgUK9xb3BtTn+EOZ6k9h/hqR1A1tQ1G/SquXsh87R3h+KRzWex
         rw3zAP7b1taSn6d7cte0d0QCNMD5OMxhPL3Se6diTrgSBOAW0bnV1pjbkZ+jjzhkTzv+
         WxVROMu7u1KPeN68cwpGV3IsirfwqQ9Jt09Ig=
In-Reply-To: <20081013151007.GE4148@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, okahei@gmail.com, netfilter@vger.kernel.org

On Mon, Oct 13, 2008 at 5:10 PM, Eric Leblond <eric@inl.fr> wrote:
> Hi,
>
> On Sunday, 2008 October 12 at 19:12:58 +0200, okahei@gmail.com wrote:
>> Hello list.
>>
>> I've got a question with CONNMARK target.
>>
>> It's possible to mark whole connection playing with this parameter ?
>>
>> What i want is when a packet arrives to port 6900 UDP of firewall,
>> mark it with 0x99, and when the response packet arrives again from DMZ
>> interface of the firewall, are marked again with 0x99.
>
> You can get some information a connmark on the following page :
>        http://home.regit.org/?page_id=7
>
> Basically, what you want to add to your ruleset is :
> iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
> iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark
>
> First one restore mark when packet arrive (It put connection mark to the
> pt mark.. Second one save packet mark to connection mark to be able
> to restore it later (with --restore-mark).
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>

Hello List.

I'm in doubt with the /proc/net/ip_conntrack file, becouse i am
marking packets with 0x87

fir1~#  iptables -nL -v -t mangle |grep :6960

  387 55064 MARK       udp  --  eth5   *       0.0.0.0/0
0.0.0.0/0           udp dpt:6960 MARK set 0x87

  387 55064 CONNMARK   udp  --  eth5   *       0.0.0.0/0
0.0.0.0/0           udp dpt:6960 CONNMARK save

  391 56728 CONNMARK   udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           udp spt:6960 state RELATED,ESTABLISHED CONNMARK
restore

And in /proc/net/ip_conntrack i see this :

udp      17 170 src=69.198.x.x dst=213.27.x.x sport=51625 dport=6960
packets=375 bytes=53432 src=192.168.3.4 dst=69.198.x.x sport=6960
dport=1029 packets=379 bytes=55096 [ASSURED] mark=135 use=1

Mark=135 ? wheres is this mark comming from ?

Regards.
