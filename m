From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 08:28:50 -0400
Message-ID: <CAHEKYV4jyZdRVyzsbpDbzVfLBSqruAPYguU4gqiBviKPqevxbA@mail.gmail.com>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
	<CAB1A4CB.C258%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=Jzr/VOP9Qr7eFNoR+7vikTUVALEwfkPufBfxF1W2LIQ=;
        b=NGc6mCPGIuJrCmhVZMtNHOGVwOBULazt6M9DRrfIuuVILmj1UP16G/JzpGY3OtLdDm
         rkRbeRSnJDGae2R1xa7tJoRI0bCif35/SAkEeqDt919ZkvQpJvQ//45KrAJFlr7dRXEB
         TG4CELmL8kq/OWatHQ4Lzm6dKE8z6TqX74yfc=
In-Reply-To: <CAB1A4CB.C258%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

On Wed, Oct 5, 2011 at 8:08 AM, James Lay <jlay@slave-tothe-box.net> wr=
ote:
>
>
> On 10/4/11 10:24 PM, "Netravali Ganesh" <gnetravali@sonusnet.com> wro=
te:
>
>>Hi..
>>
>>I have multiple Ethernet =A0interface on the system. I need to enable=
 the
>>ssh on eth0 and block the ssh on all the other interfaces. Below is t=
he
>>iptables rules I am using. This is not working form pls lls let me kn=
ow
>>what is wrong. I am using RHEL6.1 system.
>>
>> [root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dport =
22
>>-j DROP
>> [root@localhost ~]# iptables -L -v -n
>>Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
>> pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
>>destination
>> =A0 =A00 =A0 =A0 0 DROP =A0 =A0 =A0 tcp =A0-- =A0eth1 =A0 * =A0 =A0 =
=A0 0.0.0.0/0
>>0.0.0.0/0 =A0 =A0 =A0 =A0 =A0 tcp dpt:22
>>
>>Thanks
>>Ganesh
>>
>>--
>>To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
> Why not just have sshd only listen to the interface you want? =A0From
> sshd_config:
>
> #Use these options to restrict which interfaces/protocols sshd will b=
ind to
> ListenAddress ::
> ListenAddress 0.0.0.0
>
> James
>
      While I think that is a really clever solution, I believe the OP
is also doing this as an exercise to further understand iptables.
Hence the fact he asked in this list.

That said, here is a bit of a tangent question: which one is more
efficient/uses less resources: blocking at the iptables lever or past
it, at the sshd level? And would both approaches show port 22 on eth1
as closed?

>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
