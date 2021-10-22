From: Benno <b.ohnsorg@freenet.de>
Subject: Fwd: nft numeric output translates tcp flags rule so it cannot be
 loaded again
Date: Fri, 22 Oct 2021 18:16:53 +0200
Message-ID: <79f06f11-9629-18ec-78de-f87992043a3d@freenet.de>
References: <670d4a02-745b-955a-d640-6c755ebe3340@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:To:References:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=E1SoStuvoQcga8RnZdSCGY4jfjx6ivdShmJcUzCW3N8=; b=BPuu3WjbZTmZYI7ShhspYpwvZB
        /kxa8Zr5bOnKupxXOBDstEE5nIedQfAMEo+eGaYaDnQ71U1ks+DO1Dsrvm29O+qwKINJnfmH7pCYc
        1Pzxbd/LnPMOpTrBJOxm+ZtSxgDjt2EC46GaySoOGdurm1tMD4OpNeDOWhoDUg0Fbq2HKJJc2116T
        XhTt8kOfADuhnrpIu0Y3aVALC3Rc1ozuiTsW7KwfN8HUyaEuDyClKJBx9X53uK282UEXfOFEUVy3h
        ovqiuZDeTOR1Xrf2rvFWH8TWB0fTB8u2dzMCxtMSMvzA8VjyRkVkMKkyjQ+izePcxxwkdlqmVfJIn
        1Z 
In-Reply-To: <670d4a02-745b-955a-d640-6c755ebe3340@freenet.de>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org




-------- Weitergeleitete Nachricht --------
Subject: Re: nft numeric output translates tcp flags rule so it cannot
be loaded again
To: Pablo Neira Ayuso <pablo@netfilter.org>
References: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
<YXLWuHabUtY9wKXq@salvia>
From: Benno <b.ohnsorg@freenet.de>
Message-ID: <670d4a02-745b-955a-d640-6c755ebe3340@freenet.de>
Date: Fri, 22 Oct 2021 18:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXLWuHabUtY9wKXq@salvia>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Thanks for the fast reply.

Am 22.10.21 um 17:20 schrieb Pablo Neira Ayuso:
> On Fri, Oct 22, 2021 at 03:51:04PM +0200, Benno wrote:
>> Hi,
>>
>> the following ruleset was written manually:
>>
>> #!/sbin/nft -f
>> flush ruleset
>> table inet firewall {
>>
>>   chain inbound {
>>     type filter hook input priority 0; policy drop;
>>     ct state vmap { 0x1 : drop, 0x2 : accept, 0x4 : accept }
>>     tcp flags & (fin|syn|rst|ack) != syn ct state new counter drop
>>     iifname "lo" accept
>>     meta protocol vmap { 0x0800 : jump inbound_ipv4, 0x86dd : jump
>> inbound_ipv6 }
>>     tcp dport { 22, 80, 443 } accept
>>     udp dport 1900 meta pkttype 2 limit rate 4/second burst 20 packets
>> accept comment "Accept UPnP IGD port mapping reply"
>>
>>     log prefix "[nftables] Inbound Denied: " counter packets 0 bytes 0 drop
>>   }
>> }
>> […]
>>
>> The operating system stores this to a file when shutting down and uses
>> option -n for numeric output. This translates all the rules and the tcp
>> flags rule turns into this:
>>
>> tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes 0 drop
>>
>> When the rules saved like this are re-loaded TCP port rules are
>> broken.
> 
> What nftables version are you using there? Using nftables 1.0.0.

$ nft -v

nftables v0.9.9 (Prudence Pimpleton)

(official Gentoo build)

> 
> Reload works fine here:
> 
> […]
> 
Obviously right also on my side when I use nft -f directly. It does not
work through the (Gentoo provided OpenRC) scripts. The only thing I can
do is nft list ruleset after the machine booted. Then it does not accept
connections for example to sshd. Surprisingly bind9/ DNS on that machine
can be reached flawlessly (UDP).

It is only this particular tcp flags rule. If I remove it from the
manually written rule set, import it, save and reboot sshd is reachable.

I also thought it could be related to nftables coming up before the
ethernet devices. But I could add a netdev rule for a non-existing iname
and non-existing interface index. While the first case works through the
init scripts (being based on string comparison) the latter fails as
expected.

Also using the init script's restart feature without any changes does
not fix the issue. Only re-writing that particular line to non-numeric
syntax gives successful connections.

Other means of tracking this down?
