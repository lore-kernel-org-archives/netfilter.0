From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 13:56:32 +0530
Message-ID: <4AA4C3B8.7080309@infoservices.in>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in> <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4C0E6.9050101@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> J. Bakshi a =E9crit :
>  =20
>> # cat /proc/net/ipt_recent/blacklist
>>
>> src=3D183.131.207.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 42982=
14902
>> src=3D240.168.95.31 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 42982=
14902
>>    =20
> [...]
>  =20
>> And If I try to remove a line it reports
>>
>> ```````````````
>> WARNING: The file has been changed since reading it!!!
>> Do you really want to write to it (y/n)?
>> `````````````````
>>
>> A yes puts me again into the file. and it is recursive.
>>    =20
>
> You are not supposed to open this pseudo-file and remove lines with a
> text editor, you are supposed to *write* commands (e.g. with echo) in=
to
> it as indicated in the manpage. This is not a real file but an interf=
ace
> to the kernel.
>  =20

Hello,

Yes, I have found the specific section in the man page and it is
successully do the job as described. Now I can modify my script
accordingly to do the job.
Thanks a lot for he right direction.
wish you a nice time.


> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

