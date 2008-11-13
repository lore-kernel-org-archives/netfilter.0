From: Wessel <wessel.louwris@gmail.com>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 09:42:18 +0100
Message-ID: <491BE86A.20704@gmail.com>
References: <20081113075231.50345b2c@gmail.com> <1226565204.29859.3.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=dplc2ioBuIxAKUnM6UCg3QbbYOJrphzkgYHGlqsZPs0=;
        b=GUSh4sq73QNgQOOybg/+xEMy63rby4JJg06Ovt4zSekhGX8aDPAriUfICe12LXqJDX
         N5EqHcIZOIOWC/Nb3/qJeGUjxdIAWVobnEEqeFAVdThZNQsSerHcxvPBwYIJu0RUrNTp
         lE2dyTSQQHU/CTqiYDM+PRDMKzX79YDf2tox8=
In-Reply-To: <1226565204.29859.3.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: netfilter@vger.kernel.org

=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB wrote:
> =F7 =FE=D4=D7, 13/11/2008 =D7 07:52 +0000, TheOldFellow =D0=C9=DB=C5=D4=
:
>  =20
>> My firewall works well, except that I can't get any kind of access t=
o
>> www.adobe.com.
>>
>> This is typical:
>>
>> # ping www.adobe.com
>> PING www.wip3.adobe.com (192.150.18.101): 56 data bytes
>> 64 bytes from 192.150.18.101: icmp_seq=3D0 ttl=3D243 time=3D194.939 =
ms
>> 64 bytes from 192.150.18.101: icmp_seq=3D1 ttl=3D243 time=3D193.576 =
ms
>> 64 bytes from 192.150.18.101: icmp_seq=3D2 ttl=3D243 time=3D194.612 =
ms
>> 64 bytes from 192.150.18.101: icmp_seq=3D3 ttl=3D243 time=3D194.844 =
ms
>> --- www.wip3.adobe.com ping statistics ---
>> 4 packets transmitted, 4 packets received, 0% packet loss
>> round-trip min/avg/max/stddev =3D 193.576/194.493/194.939/0.542 ms
>>
>> so far so good...
>>
>> # wget http://www.adobe.com/index.html
>> --07:45:04--  http://www.adobe.com/index.html
>>            =3D> `index.html'
>> Resolving www.adobe.com... 192.150.18.101
>> Connecting to www.adobe.com|192.150.18.101|:80...=20
>>
>> it just times out - browsers are the same.
>>
>> Looking at the log shows the following warnings:
>>
>> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:7=
4:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 P=
REC=3D0x00 TTL=3D53 ID=3D9637 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
>> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:7=
4:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 P=
REC=3D0x00 TTL=3D53 ID=3D45688 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
>> IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:7=
4:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 P=
REC=3D0x00 TTL=3D53 ID=3D37819 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
>>    =20
>
> It does seem strange for www.adobe.com to have privat IP 192.150.18.1=
01
> which is also as I can see the IP of your box. You are pinging your
> local box but there are no web server on your box as I see. Either yo=
u
> edited addresses wrong or your DNS server (or /etc/hosts) has wrong
> record for www.adobe.com.
>
> Hope that helps.
>
>  =20
192.150.18.101 is not  a private ip range=20
(http://www.whois.ws/whois-ip/192.150.18.101/) as far as I know.
But it looks like the traffic coming back from adobe is blocked?=20
(although, should the SPT and DPT not be the swapped then?)

Guess you need to include your firewall rules to get more help.

Wessel

