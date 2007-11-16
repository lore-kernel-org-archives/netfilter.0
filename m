From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: Matching by packet connection
Date: Fri, 16 Nov 2007 12:24:46 -0800
Message-ID: <d95317090711161224x16ea558cp1bf843352d90608c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=a2VXae6/YRMxFKy75AFZmGUZ8gTLHcixx61iZtpSjps=;
        b=suvqunfgfgVjjil17Rj9dqEyRDmVlImSkI2cG0GJhRAXun5JdWDr0sccOt2pYL6tgGYVhmU62EFGYzYqmKX5xHFprOSElLs90aB1GqM37n+uy7wexLtRJp/l7arncgAUQ/9SEHwIqs5Dm/yZL3hAT4on3cC6E2b19/mYvxWfFB0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

>Hello,
>
>Gilad Benjamini a =E9crit :
>> Is there a way to match a packet against a connection's direction ?
>>
>> e.g. apply this rule
>> iptables -A chain --destination mymachine -m state --state ESTABLISH=
ED
>> -j another_chain
>> only to packets belonging to CONNECTIONS with destination mymachine
>
>I think the 'conntrack' match is what you need.
>
>-m conntrack --ctorigdst <mymachine> --ctstate ESTABLISHED

This would work in the specific example but not in the more general cas=
e.
Suppose my rule is based on interface, port, or any other thing that
does not include the source and/or destination.
I am looking for a more generic approach
"If a packet matches <condition> and the state is ESTABLISHED and the
packet is in the same direction as the connection, then do
<something>"
