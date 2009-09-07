From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 14:50:30 +0530
Message-ID: <4AA4D05E.5050909@infoservices.in>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in> <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org> <4AA4C3B8.7080309@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4C3B8.7080309@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

J. Bakshi wrote:
> Pascal Hambourg wrote:
>  =20
>> J. Bakshi a =E9crit :
>>  =20
>>    =20
>>> # cat /proc/net/ipt_recent/blacklist
>>>
>>> src=3D183.131.207.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298=
214902
>>> src=3D240.168.95.31 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298=
214902
>>>    =20
>>>      =20
>> [...]
>>  =20
>>    =20
>>> And If I try to remove a line it reports
>>>
>>> ```````````````
>>> WARNING: The file has been changed since reading it!!!
>>> Do you really want to write to it (y/n)?
>>> `````````````````
>>>
>>> A yes puts me again into the file. and it is recursive.
>>>    =20
>>>      =20
>> You are not supposed to open this pseudo-file and remove lines with =
a
>> text editor, you are supposed to *write* commands (e.g. with echo) i=
nto
>> it as indicated in the manpage. This is not a real file but an inter=
face
>> to the kernel.
>>  =20
>>    =20
>
> Hello,
>
> Yes, I have found the specific section in the man page and it is
> successully do the job as described. Now I can modify my script
> accordingly to do the job.
> Thanks a lot for he right direction.
> wish you a nice time.
>
>  =20

Hello Pascal,

I don't know if I should create a new thread or continue with this one.
But this is a new issue though a continuation of ipt_recent and blackli=
st.
My script to show the blacklisted ip is running well. During my
experiment with blacklist I have found that blacklisted ips are still
there at

/proc/net/ipt_recent/blacklist

Even after the blacklist interval the client can access the server
successfully; the server still shows the client ip as blacklisted.
Definately the ip can be removed or "clear" as described in the man pag=
e
but storing the ip permanently at  /proc/net/ipt_recent/blacklist  is=20
very confusing.  How can you then check if the ip is still blacklisted
or able to communicate with the server in real-life  ?
