From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: automatic helper assignment is deprecated and it will be removed soon
Date: Sun, 1 Sep 2013 17:11:14 +1000
Message-ID: <CAMD-=V+yrawW6hPSLxp=0j+4=Gt88uo5sEL4gqoRJ8n3dMWWnw@mail.gmail.com>
References: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
	<1377952582.3513.45.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Lb8FuQkSgGKTZC18HyxeugHBfPxVrX25JHBGn3z2hGU=;
        b=wXWq9bQxES5gxwL2IWx5YWdu69YUtfZXL+6BXd9Zw6ny280c1wWWEjGTbsqA3ScT/E
         v5VwImoPp+laTgEAZZ5Q2dNzHq5FKLcSNDBEXdAlK5/ejOrqCnPimwSH3TftYWgktPYj
         4DhTmh1hKJ4DXvT/YIICPxVLQSe0NXbm3ZQAwhgl74PdO2tXML9ke11qJYZv4SlxtjX6
         gOk0MDc25Z9IsgPRG7X1Eh+cTV7WxTGJkyxu2/vRdSWwRnUIB7OCLkklVoOcjMmUByqy
         UKNGNpTkixkXfkAN+84H2GS6U829Oo5iORopQfG+TGcWQ9AYxoyTuB/KOg19Mx5tubzH
         3oYg==
In-Reply-To: <1377952582.3513.45.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

Hi Eric,

Thank you for that, one thing though on PREROUTING, is that just extra
security, not critical for ftp to work,or not really needed after I
fix my forwarding rule up.

As you can tell I'm far from an expert, but since the CT line wouldnt
take with IPv6, I am assuming it is not critical to its functioning
(bless I hit a IPv6 bug)
Thanks






On 8/31/13, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> Le samedi 31 ao=FBt 2013 =E0 16:09 +1000, Nick Edwards a =E9crit :
>> Hi,
>>  This message is now appearing on some of our servers..
>> google is full of much info, and confusion.
>
> This is linked with the document that can be found here:
>  https://home.regit.org/netfilter-en/secure-use-of-helpers/
>
> Don't hesitate to command this document if you find some part needs
> explanation.
>
> The change in automatic helper assignment is motivated by an attack
> found on helper and implemented in the tool named opensvp:
>
> https://home.regit.org/2012/06/opensvp-a-new-tool-to-analyse-the-secu=
rity-of-firewalls-using-algs/
>
>> I understand it to be
>> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCE=
PT
>> becomes
>> iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>>
>> with new rules to add being
>> -A FORWARD -m conntrack --ctstate RELATED -m helper --helper ftp -p
>> tcp --dport 21 -j ACCEPT
>
> This change you have just described is a security improvement. By the
> way, it should not work. The last rule you wrote states that packets
> RELATED to a connection, going to port 21 and linked with the FTP hel=
per
> have to be accepted. This is not what you want as port 21 is the
> original connection.
>
> A correct rule will be something like
> iptables -A FORWARD -m conntrack --ctstate RELATED -m helper \\
>        --helper ftp -p tcp \\
>        --dport 1024: -j ACCEPT
>
> You accept all packets RELATED to an ftp connection on port > 1024. I=
f
> you know where the FTP connection took place, you can add more filter=
 to
> discriminate the flow.
>
>> then some sites talk about
>>  -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp
>
> Here, you say: traffic to port 21 IS FTP. This will mimic the current
> behavior of helper (automatic assignement) and this only rule (withou=
t
> the previously mentioned change) will allow you to support the future
> change to non automatic assignment (assuming you only need the ftp
> helper on your system).
>
>>
>> So, does removal of ESTABLISHED on original rules, now mean we need
>> one of, of both of, these new rules?
>>
>> I tried on our IRC server, but it balked with ip6tables  at xt_CT: N=
o
>> such helper "irc"
>> same command with iptables seemed to take..
>>
>> What is the correct way to replace this ESTABLISED since nf_conntrac=
k
>> will soon be removed
>
> No removal of nf_conntrack is planned. The only change planned is the
> removal of automatic assignement ie 21->ftp helper is used.
>
>>
>> Are they even needed anymore?  (I think irc helper is only needed fo=
r dcc
>> etc)
>>  is FTP still  needed for ftp?
>
> As mentioned before NO change on helper logic. They are still needed =
to
> handle protocol with dynamic connection opening.
>
> BR,
> --
> Eric
>
