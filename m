From: Daniel <tech@tootai.net>
Subject: Re: Fwd: nftables and connection tracking
Date: Fri, 24 Sep 2021 09:19:02 +0200
Message-ID: <e8e2ec09-5ec8-9de2-d80f-28102e3a72e4@tootai.net>
References: <20200621080614.GK26990@breakpoint.cc>
 <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc>
 <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc>
 <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
 <20200701224820.GA29407@breakpoint.cc>
 <CAChjPdRFPLkKcj3eDiFrpaL2VEoueJxWrx=kwixprHkNUqf-+Q@mail.gmail.com>
 <20200702194710.GA14610@salvia>
 <CAChjPdQb5wUP7Qbz=D-0jg-YFC0cWgV4oPJQD9-G7evi3SupAw@mail.gmail.com>
 <YUk8dCSHCUcKn+Xy@salvia>
 <CAChjPdREO=jtTNGc32H3mv+Zv8AHKbujb_a8=tkwC0+b2sbVCQ@mail.gmail.com>
 <CAChjPdQ8yUEyFuAiHiw+FZgnvNWjc1wM2LTcffyr_f49x4X7Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632467944; bh=5QEWvfQIcG5Omg+lO5Kh4M+Cv2UXa5o758AqIlhPiuc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=IaMsZKjMtu2UOrHdxulICUojQ685GsQRk/Pv4EYWqPGbFXPH7CtC8TJw3s0HizPte
         E1WzTAznBiL+zyrVEJFLVhopaxsWK+S9bRTYwQzjfMGbg20MUBwSvxQJxmUoYWFxfC
         zSI0EE/x21tsiMMSrsqDHrwvghH13547aEVXBgLw=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1632467944; bh=5QEWvfQIcG5Omg+lO5Kh4M+Cv2UXa5o758AqIlhPiuc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=IaMsZKjMtu2UOrHdxulICUojQ685GsQRk/Pv4EYWqPGbFXPH7CtC8TJw3s0HizPte
         E1WzTAznBiL+zyrVEJFLVhopaxsWK+S9bRTYwQzjfMGbg20MUBwSvxQJxmUoYWFxfC
         zSI0EE/x21tsiMMSrsqDHrwvghH13547aEVXBgLw=
In-Reply-To: <CAChjPdQ8yUEyFuAiHiw+FZgnvNWjc1wM2LTcffyr_f49x4X7Aw@mail.gmail.com>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

For the list information, on Asterisk list we asked Marek to open UDP 
RTP range ports but he don't want (security reason are his words). We 
run few Asterik servers with nftables, various versions, and never run 
any problem. And we are from far not alone with such setup.

Le 24/09/2021 à 07:21, Marek Greško a écrit :
> Sorry, repost to the mailing list.
>
> Marek
>
> ---------- Forwarded message ----------
> From: Marek Greško <mgresko8@gmail.com>
> Date: Thu, 23 Sep 2021 20:05:33 +0200
> Subject: Re: nftables and connection tracking
> To: Pablo Neira Ayuso <pablo@netfilter.org>
>
> Hello,
>
> no rule is blocking traffic. There is no match for rule so the udp
> drops. If I add accept rule as a last rule of the INPUT chain, it
> works.
>
> I tried conntrack -F without any progress.
> The conntrack -L expect shows some local sip phone 5060 connections
> and sip provider connection. No nat phones here. Even after reboot
> when it is working after reboot there is nothing about natted phones,
>
> Yes debugging would be probably the best, could you tell me how to
> debug it? I had never such firewall problems for 25 years history. I
> did not try to revert to iptables yet.
>
> To be honest, I do not expect it to be a configuration problem, but
> one never knows.
>
> Thanks
>
> Marek
>
>
> 2021-09-21 3:59 GMT+02:00, Pablo Neira Ayuso <pablo@netfilter.org>:
>> On Thu, Sep 16, 2021 at 10:32:01PM +0200, Marek Greško wrote:
>>> Hello,
>>>
>>> I would like to make the revival of this thread. My current
>>> configuration looks like this:
>>>
>>> table ip filter {
>>>    ct helper sip {
>>>      type "sip" protocol udp
>>>      l3proto ip
>>>    }
>>>
>>>    chain PREROUTING {
>>>      type filter hook prerouting priority filter; policy accept;
>>>      udp port 5060 ct helper set "sip"
>>>    }
>>>
>>>    chain INPUT {
>>>      ...
>>>      ct state invalid drop
>>>      ct state related accept
>>>      ct state established accept
>>>      ...
>>>      iifname "ppp0" jump i-inet
>>>    }
>>>
>>>    chain OUTPUT {
>>>      type filter hook output priority filter; policy accept;
>>>      udp port 5060 ct helper set "sip"
>>>      ...
>>>    }
>>>
>>>    chain i-inet {
>>>      ...
>>>      udp port 5060 jump r-sip
>>>      ...
>>>    }
>>>
>>>    chain r-sip {
>>>      ip saddr 192.0.2.0/24 accept
>>>    }
>>> }
>>>
>>> table ip mangle {
>>>    chain PREROUTING {
>>>      type filter hook prerouting priority mangle; policy accept;
>>>      ...
>>>      udp sport 5060 ip dscp set 0x04
>>>    }
>>>
>>>    chain OUTPUT {
>>>      type route hook output priority mangle; policy accept;
>>>      ...
>>>      udp dport 5060 ip dscp set 0x04
>>>      ...
>>>    }
>>> }
>>>
>>> table ip6 filter {
>>>    ct helper sip {
>>>      type "sip" protocol udp
>>>      l3proto ip6
>>>    }
>>>
>>>    ... pretty the same, but I have no ipv6 internet connectivity, so
>>> this should not match ...
>>>
>>> }
>>>
>>> I run the nftables locally on the asterisk server. The phones located
>>> on the local lan are working ok. But the remote phones behind nat are
>>> experiencing intermittent problems. After several days of working
>>> there is suddenly no audio. We with some guys on the asterisk list
>>> have found out it is a nftables problem. But I am not sure whether it
>>> is configuration problem or a bug.
>>>
>>> The problem is that when the rtp stream is built the stream incoming
>>> to asterisk is blocked by nftables
>> What rule is blocking the traffic?
>>
>>> and thus asterisk never learns the
>>> public ip of the remote phone and is sending rtp stream to it's
>>> internal address. So there is no audio in either direction. When I
>>> enable rtp udp port range to pass to the asterisk it works. After
>>> blocking again it stops working. To resolve the problem for several
>>> days I found out that rebooting of the remote router resolves the
>>> issue.
>> Did you try 'conntrack -F' instead of rebooting to flush the conntrack
>> table? What does 'conntrack -L expect' shows?
>>
>>> I have one successful resolving by rebooting the asterisk
>>> server the problematic nftables is running on. The proble arises again
>>> in several days. The problem is too frequent to be accepted, but too
>>> rare to be debugged. I have not tried the trick with sysctl above,
>>> yet.
>>>
>>> Do you think this could be a configuration problem?
>> Even if it's a configuration problem, debugging the ruleset would be
>> needed.
>>
-- 
Daniel
