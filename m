From: Pete Kay <petedao@gmail.com>
Subject: Re: question about NAT rule
Date: Wed, 23 Jun 2010 09:57:32 +0800
Message-ID: <AANLkTinOd_6m6UvbqKcB3v2-FinNQzHUmhymFE9Z5RHm@mail.gmail.com>
References: <AANLkTimaYvRg2379FY2erzJTKyhXFjEtyvOtgqfYnV2d@mail.gmail.com>
	<4C20D263.2050502@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=uLA5MIhoPhph0IZ4JJCszRUUdV9zmjYHBysOjfmY95Y=;
        b=vzZWqi8TFcK5ztUTKxZkMK2UgPXvdmlQJRwrUqSaj/RwOAf+ULgdKtu2zqa7G2x9SW
         r6wUBFAWqJMursh7SL/9nYQN01twM9SqQhQXQDvU+gWqWYu/4WLkJqyfbCIocOYWsCwj
         DZIdbfLlZb5tn/kS3lskUrim72ajNNJHFeyoU=
In-Reply-To: <4C20D263.2050502@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi,

I guess I may have misunderstood the purpose of the
netfilter-conntrack module.  What I would like to do is to set up a
alot of iptables NAT rules ( > 10K at 500 rules (add/drop)/s).  Using
the system iptables command is not going to be fast enough for me.
All I want is to deliver the packets received from specific IP:port to
another IP:port.  Therefore, I am looking into using
netfilter-conntrack api to actually "set" those rules dynamically.  Is
this the right approach in doing that?

Could someone please give me some suggestions?

Thanks,
P

On Tue, Jun 22, 2010 at 11:10 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Pete Kay a =E9crit :
>>
>> I have the following NAT rule set up :
>>
>> udp =A0 =A0 =A017 12 src=3D192.168.1.102 dst=3D192.168.1.140 sport=3D=
7390
>> dport=3D8000 packets=3D6 bytes=3D3258 [UNREPLIED] src=3D192.168.1.14=
0
>> dst=3D192.168.1.102 sport=3D10000 dport=3D9000 packets=3D0 bytes=3D0=
 mark=3D0
>> secmark=3D0 use=3D2
>
> This is not a NAT rule but a conntrack entry.
>
>> What I am expecting to achieve is that when udp packets go from
>> 192.168.1.102:7390 to 192.168.1.140:8000, the conntrack module would
>> redirect the packet to 192.168.1.102:9000, but it is not happening.
>>
>> Does anyone know what is wrong?
>
> It is not happenning because of the above conntrack entry that says
> otherwise and already exists for these packets, so iptables NAT rules
> are ignored. You must first delete the conntrack entry with
> conntrack-tools or by not transmitting related packets until it expir=
es.
> Then the next packet will hit the iptables NAT rules and create a new
> conntrack entry accordingly.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
