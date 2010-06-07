From: Tytus Rogalewski <tytanick@gmail.com>
Subject: Re: iptables slows tproxy SQUID with DNAT or REDIRECT
Date: Mon, 7 Jun 2010 17:57:16 +0200
Message-ID: <AANLkTimJTOAmTCa4Psi8XIOoQESj1VzHr0OifHrYCbsF@mail.gmail.com>
References: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com> 
	<AANLkTiluaE-A4cstREWV7r57RyCGPjHEmkCe0EhhQOXa@mail.gmail.com> 
	<20100605221948.7f4b4cd5@catlap> <AANLkTim0LmMz2JRAiFSjKNxrBPU692JZah0-yp9O3pWQ@mail.gmail.com> 
	<AANLkTil8Di3lyORxTIhTTRIqs0nNSeWOg2H_BXht6kCE@mail.gmail.com> 
	<20100606200349.22dfa01e@catlap> <AANLkTik2PmBuTTQ2ha3JLT71pb1FXJZRNDq-HEKkqf5W@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=G7kGSO+Im4wA3rMH6F3mZrtMJk8PGBljILM72XvrizY=;
        b=hyUv3ihTwlsnrZaVv0vGBwEbBnY3pBP4DvVyiC9HVnVH0JJmszlmPHN7lhB67LqaCI
         Qgzog98hnBjTo+5TBVWn/Iterg1DzpP7WyvVCpnQ2vEUGzbS3KwE69ah9q7SWp7yqAf0
         OUAjmiR8io10yx03xDk3Hv7tBvK2XaEmNdu5A=
In-Reply-To: <AANLkTik2PmBuTTQ2ha3JLT71pb1FXJZRNDq-HEKkqf5W@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

hello, thx you Alexander Clouter
The bug was in my QOS system, but still i dont know why it hapened
only in transparent mode :)
Anyway, i had queue SFQ limit 7
i just removed limit 7 and squid works fine !
so my case is SOLVED, thx


W dniu 6 czerwca 2010 20:29 u=BFytkownik Tytus Rogalewski
<tytanick@gmail.com> napisa=B3:
> hmm, no dobra, cos wykombinuje, dzi=EAki
>
> W dniu 6 czerwca 2010 20:03 u=BFytkownik Marek Kierdelewicz
> <marek@piasta.pl> napisa=B3:
>> Cze=B6=E6,
>>
>> Czy pr=F3bowa=B3e=B6 jednocze=B6nie obserwowa=E6 access log squida, =
sniffowa=E6
>> ruch na wej=B6ciu (klient<->squid) i wyj=B6ciu (squid<->inet), a tak=
=BFe
>> otwiera=E6 stron=EA? Robi=B1c to mo=BFesz wpa=B6=E6 na trop tego, co
>> w=B3a=B6ciwie nawala.
>>
>> Nie ignoruj tego co radzili ludzie na grupie, tzn. =BFeby robi=E6 te=
sty na
>> pustym rulesecie iptables. Mo=BFesz mie=E6 konflikt z konfiguracj=B1
>> netfiltra, a nawet z shapingiem (np. ruch nieodpowiednio klasyfikowa=
ny
>> ze wzgl=EAdu na redirecta w tablicy nat netfiltra jest g=B3odzony w
>> ciasnej klasie).
>>
>> Radz=EA potestowa=E6 wszystko na oddzielnej maszynie tylko ze squide=
m.
>> Nawet nie musi by=E6 fizyczna. Je=BFeli masz procka ze wsparciem do
>> wirtualizacji mo=BFesz uruchomi=E6 KVM i pod tym linuxa. Testowa=B3e=
m tak do
>> pracy konfiguracje z=B3o=BFone z 7 ruter=F3w, bgp i ospfa.
>>
>> pozdr=F3wka
>> Marek
>>
>
>
>
> --
> Z pozdrowieniami
> Tytus Rogalewski
> mail: tytanick{monkey}gmail.com
> www.sky-link.net
> gg: 210533
> skype: tytanick
>



--=20
Z pozdrowieniami
Tytus Rogalewski
mail: tytanick{monkey}gmail.com
www.sky-link.net
gg: 210533
skype: tytanick
