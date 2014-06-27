From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 16:09:44 -0700
Message-ID: <CALPbv1_gVysmBm5jqByJMmcprzAAkT6pBA1q9mu6eYPxSXhCOQ@mail.gmail.com>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
	<53AD4B1F.1000705@plouf.fr.eu.org>
	<CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>
	<53ADAF27.5070505@plouf.fr.eu.org>
	<CALPbv18b4ZnynXOUW59tu1aq2=uMi54M4ZUMUhacijCN1VVcbg@mail.gmail.com>
	<53ADC38D.5090805@plouf.fr.eu.org>
	<CALPbv18miJQXrdn9CbwVShx4Fn8XrbVs8Hts-n0Oafy+3+xbMg@mail.gmail.com>
	<CALPbv189=OY0wTGYE7G5QCQ2JwtBA=VdqFYyDBH69fveHwaAfw@mail.gmail.com>
	<53ADE45B.9000406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=hWxSE+JodQtk9A5bnME7uUkM7IRiZnWVdqQECCkfaik=;
        b=rWPOi0UtetTxgT5d2NFyg7Of1xXelIa1OB2uNl2C0hqR2+WwBwz6LkmLopdip8QVyu
         DxnoqgF6LtJC85rOsGCLdduQQcGNDpGzkyM2xZbxd/xsrbEd8qBCckUp0W+LKd6MDtKo
         e0zIICEl0z05rrMkr64q+zosnZ6BNjuzRoGRGGhFpbvyJS7zoV78YOxnxMkC1E9AvgLF
         8x1MoW5dpHlI5CJLaZDIaVGvttdMNfI58c9t+n6UN+5yKhHS/iW41ovzQXtKG2SC0rhO
         ZpIop0UGtEGeggZ7u8oztAbhcEnIlMqYqquOdFKSrmLVIYKS+PT38L/4IJKTXdZFlSl6
         yLIQ==
In-Reply-To: <53ADE45B.9000406@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

you are right. No idea what made it work :)

one thing different from your original instruction was my sysctl
net.ipv4.ip_forward=3D1 didnt work couple of times it said 'unknown key=
'
3rd try it did not complain but after some tests I saw the forwarding
was not set and I had to set it by writing 1 into /proc... ip_foward

I will post it once I find out, but so far good.

Thx.

On Fri, Jun 27, 2014 at 2:38 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Vijay Viswanathan a =C3=A9crit :
>> adding -m state --state NEW,ESTABLISHED seems to do the trick.
>>
>> iptables -t nat -A PREROUTING -i eth1 -p tcp -d 10.4.38.182 --dport
>> 2300 -m state --state NEW,ESTABLISHED -j DNAT --to 192.168.10.2:2300
>
> Not in any way. The chains of the nat table see only packets in the N=
EW
> state so this match is completely superflous. Besides, normal TCP
> packets have the NEW or ESTABLISHED state.
