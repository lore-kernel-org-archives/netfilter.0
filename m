From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: How to completely disable conntrack?
Date: Wed, 13 Jul 2011 10:07:54 +0200
Message-ID: <CAHOuc7Ooi5qiXcsnuR6FxNzwUvrZBcR27h_3q7pEmScQf+ZivA@mail.gmail.com>
References: <4D7785DC.8050904@centrum.cz> <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
 <4D7954EB.1050704@plouf.fr.eu.org> <loom.20110713T092047-270@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=/0LPQORZgSwdJB0CWu7Y2tOdzn271DvuPSSamgVjFS4=;
        b=a6gGL3viLa4chmaZJ5sG/P7pV0TVkYEn2C3AxYpiYxqXzAdT5iWBJZjYnXfk5P21sK
         tYXQr84UrYqgXX/fWVX70NAUKBxY8FF1RkyxJzxPwtV4XTtQZbCzadnc2vbCsgBS4pyb
         yokQSJ+idksx2g4ezQlqBA4Uzl8x7tD6ksHGk=
In-Reply-To: <loom.20110713T092047-270@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: nany <naveen.sadanand@gmail.com>
Cc: netfilter@vger.kernel.org

Unload the module.

/Oskar


2011/7/13 nany <naveen.sadanand@gmail.com>:
> Pascal Hambourg <pascal.mail <at> plouf.fr.eu.org> writes:
>
>>
>> Hello,
>>
>> Pandu Poluan a =E9crit :
>> > I'm sure there's a sysctl knob, but off the top of my head:
>> >
>> > -t raw -A PREROUTING -j NOTRACK
>>
>>
> -t raw -A OUTPUT -j NOTRACK
>
> hey man i applied above rules, its not working,
>
> the connections shows in /proc/net/ip_conntrack
>
> is any one can tell how to disable connection tracking completely,
>
> please help me man
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
