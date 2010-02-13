From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 11:08:03 +0100
Message-ID: <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com> 
	<1266016722.2980.159.camel@tesla.lan> <1266027202.3899.1.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=iRK4ZRWwLMipaHOl3Ji0DYtkLNSMTHYXpBSYs5XeCdg=;
        b=Itky93DMC23KPboYYwRXLA7Eli6lMitj1WeEcHE8KNgWoiTuSxE09ilkBCs2yZZAvy
         WXl5ZOTrf4dn9X5PryeVgaqZOBkNf8bxB2mJwIElKlHNlg8CkqPeQ9n3reoMkTXuT+zA
         pllru9uiDjKSDrTuw0CY8q5QV65blxsCxvkK0=
In-Reply-To: <1266027202.3899.1.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: Guido Trentalancia <guido@trentalancia.com>, Bojan Sukalo <shukalo83@gmail.com>, netfilter@vger.kernel.org

2010/2/13 =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@=
meteor.dp.ua>:
> =F7 =F3=D5=C2, 13/02/2010 =D7 00:18 +0100, Guido Trentalancia =D0=C9=DB=
=C5=D4:
>> On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
>> > Telnet from inside machine to www.google.com 80 works but I can't =
get
>> > any messages after I get connected (Just successfull telnet
>> > connection)
>>
>> You can't telnet www.google.com on port 80, as google is not a telne=
t
>> server and therefore it can't deal with the telnet protocol. Google
>> deals with the http protocol.
>
> Why one can't use telnet program to test http server?
>


Sure you can. Of course you need to type in a valid HTTP request to
get a response. This worked for me just now:

~$ telnet www.google.com 80
Trying 74.125.79.104...
Connected to www.l.google.com.
Escape character is '^]'.

Then I typed this, followed by enter twice:
GET http://www.google.se/ HTTP/1.1

And I got this reply from the server:
HTTP/1.1 200 OK
Date: Sat, 13 Feb 2010 09:51:26 GMT
Expires: -1
Cache-Control: private, max-age=3D0
Content-Type: text/h_t_m_l; charset=3DISO-8859-1
[... plus lots more, shortened...]


By the way, I had to mangle the content type above to fool the vger
spam filter, which seems to think that my message contains HTML
because of the line, even though any reasonable MIME parser should
realize that line is part of a text/plain content, and not a header
for a new section.

/Oskar
