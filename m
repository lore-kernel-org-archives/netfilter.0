From: Die Optimisten <inform@die-optimisten.net>
Subject: Re: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 14:31:44 +0200
Message-ID: <51DFF730.2090203@die-optimisten.net>
References: <51DFEFC1.6070708@die-optimisten.net> <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi!
Thanks for your fast answer!!

How can I write -t nat
    [all except these 2:]    (! -d 127.0.0.1 -and  ! -d  192.168.0.0/16=
)  ?

Can I generally generate (kernel-hanging) loops with -nat , or is this
recognized/inhibited ?

Please also To:/Cc:inform@die-optimisten.net !
thanks
Andrew

On 2013-07-12 14:10, Arturo Borrero Gonzalez wrote:
> 2013/7/12 Die Optimisten <inform@die-optimisten.net>:
>  =20
>> Hallo!
>>
>> I want to DNAT all incoming 0/0:443, except those to localhost:443
>>         to my proxy localhost:8000
>> What is the best line to achive that?
>>
>> -d 0/0:443  -and ! -d 127.0.0.0
>> # seems -and does not exist...
>>
>> THANKS,
>> Andrew
>>
>> Please be so kind, and also answer to me per email, I#m not in the
>> mailinglist
>>
>>    =20
> I would try this:
>
> iptables -t nat -A PREROUTING ! -d 127.0.0.1 -p tcp --dport 443 -j
> DNAT --to-destination 127.0.0.1:8000
>
> Regards.
> --
> Arturo Borrero Gonz=C3=A1lez
>  =20

