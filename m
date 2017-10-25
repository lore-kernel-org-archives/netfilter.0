From: paulo bruck <paulobruck1@gmail.com>
Subject: Re: CONNMARK not working ?
Date: Wed, 25 Oct 2017 21:11:50 -0200
Message-ID: <CANSGRxRWxq+0rUEkiQi4m97W5-0v_oD8xEjAQTup3pK4S4OPGQ@mail.gmail.com>
References: <CANSGRxTdrVG_-1uMA40bKXO0QxjDsKfWEJ27nLVOR6eXXUE5tQ@mail.gmail.com>
 <92a21baa-33b5-3a8b-9bbd-efb057230380@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4vWPAwelZ+PKlhroDkIY2sluEyVUke5YNqUFh5irM8k=;
        b=YT6uhphV56Tp7/NFDNomnLkc4FqtgeBnUbSS9eMBW4z/6i2nq4/yAOc0t9SMQlFSRM
         hGNHL0n8swfgjXLPjMIT6LfmeF/lvWr9sjpUi/8iY6YTY9Al6AfuI9JXx9jTCjFyJAsH
         hReVIA2Dpj9sWGrdT6/JNI9xjsOFbnYc+xLz1GcrAfp8SQNYXLfuBsD69CfBMoXWtgNc
         B8yIZPN3x91k7YWd5huAHsASa+e6mvGpm7oYsbyKnuTnm3jcSXE1v2eFoQiYABklg7C9
         p2qYmGBhinqSvtK5K3nNNHHnZLQdBQ4mz9OPJQMiiU1vaBcfBQcwTScTFmr32ZS8r+Xw
         y+7Q==
In-Reply-To: <92a21baa-33b5-3a8b-9bbd-efb057230380@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Pascal

Thans for quick answer

All interfaces are configured as bridges for themselves.

After reading more than twice doc about CONNMARK and MARK I'm tring to
divide problem for a simple solution.

First  I want to think about packages in/out from local softwares at firewa=
ll.

I made this:

iptables -A INPUT  -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT
iptables -A OUTPUT  -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT
iptables -A FORWARD  -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT

----cut----

# mark only NEW packages that enter firewall at wan1 with mark =3D0x1
iptables -t mangle -A  PREROUTING -i wan1 -m conntrack --ctstate NEW
-j MARK --mark 0x1

# save NEW packages  and use the same mark above to mark this connection
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark

# connectons that are ESTABLISHED or RELATED return the mark from  conntrac=
k
iptables -t mangle -A PREROUTING -i wan1 -m conntrack  --ctstate
ESTABLISHED,RELATED -j CONNMARK --restore mark


# mark only NEW packages that enter firewall at wan2 with mark =3D0x2
iptables -t mangle -A  PREROUTING -i wan2 -m conntrack --ctstate NEW
-j MARK --mark 0x2

# save NEW packages  and use the same mark above to mark this connection
iptables -t mangle -A PREROUTING -i wan2 -j CONNMARK --save-mark

# connectons that are ESTABLISHED or RELATED return the mark from  conntrac=
k
iptables -t mangle -A PREROUTING -i wan2 -m conntrack  --ctstate
ESTABLISHED,RELATED -j CONNMARK --restore mark


ok with rules above I 'll mark packages and connections that could be
direct to firewall or direct to lan. Am I right?



Second mark pakages generated for local applications at firewall.

# mark only NEW packages that goes out from  firewall at wan1 with mark =3D=
0x1
iptables -t mangle -A  OUTPUT -i wan1 -m conntrack --ctstate NEW -j
MARK --mark 0x1

# save NEW packages  and use the same mark above to mark this connection
iptables -t mangle -A OUTPUT -i wan1 -j CONNMARK --save-mark

# connectons that are ESTABLISHED or RELATED return the mark from  conntrac=
k
iptables -t mangle -A OUTPUT -i wan1 -m conntrack  --ctstate
ESTABLISHED,RELATED -j CONNMARK --restore mark


# mark only NEW packages that goes out from firewall at wan2 with mark =3D0=
x2
iptables -t mangle -A  OUTPUT -i wan2 -m conntrack --ctstate NEW -j
MARK --mark 0x2

# save NEW packages  and use the same mark above to mark this connection
iptables -t mangle -A OUTPUT -i wan2 -j CONNMARK --save-mark

# connectons that are ESTABLISHED or RELATED return the mark from  conntrac=
k
iptables -t mangle -A OUTPUT -i wan2 -m conntrack  --ctstate
ESTABLISHED,RELATED -j CONNMARK --restore mark

With rule above I mark all packaes tha are gererated fom applications
at firewall, correct?

But looking at conntrack I can observer that some packages from
firewall are not marked and some packages that enter flocal
applications  are not  market too.

Where is my mistake?


 conntrack -L --src=3D192.168.1.2 --mark=3D0
icmp     1 26 src=3D192.168.1.2 dst=3D200.160.2.3 type=3D8 code=3D0 id=3D29=
090
src=3D200.160.2.3 dst=3D192.168.1.2 type=3D0 code=3D0 id=3D29090 mark=3D0 u=
se=3D1
icmp     1 19 src=3D192.168.1.2 dst=3D187.87.149.130 type=3D8 code=3D0
id=3D29100 src=3D187.87.149.130 dst=3D192.168.1.2 type=3D0 code=3D0 id=3D29=
100
mark=3D0 use=3D1
icmp     1 0 src=3D192.168.1.2 dst=3D200.244.212.179 type=3D8 code=3D0
id=3D29028 src=3D200.244.212.179 dst=3D192.168.1.2 type=3D0 code=3D0 id=3D2=
9028
mark=3D0 use=3D1
#all icmp are unmarked and this connection below should have been
marked as it is a vpn connection from fiorewall to one of uor clients
tcp      6 431999 ESTABLISHED src=3D192.168.1.2 dst=3D201.90.201.178
sport=3D55695 dport=3D1194 src=3D201.90.xxx.xxx dst=3D192.168.1.2 sport=3D1=
194
dport=3D55695 [ASSURED] mark=3D0 use=3D1


 All this entries just below are correct ( marked as 1)
conntrack -L --src=3D192.168.1.2 --mark=3D1
udp      17 22 src=3D192.168.1.2 dst=3D205.251.197.191 sport=3D48073
dport=3D53 src=3D205.251.197.191 dst=3D192.168.1.2 sport=3D53 dport=3D48073
mark=3D1 use=3D1
udp      17 22 src=3D192.168.1.2 dst=3D69.171.255.11 sport=3D41794 dport=3D=
53
src=3D69.171.255.11 dst=3D192.168.1.2 sport=3D53 dport=3D41794 mark=3D1 use=
=3D1
udp      17 15 src=3D192.168.1.2 dst=3D69.171.255.11 sport=3D55388 dport=3D=
53
src=3D69.171.255.11 dst=3D192.168.1.2 sport=3D53 dport=3D55388 mark=3D1 use=
=3D1
conntrack v1.4.4 (conntrack-tools): 3 flow entries have been shown.





root@zeus:/usr/share/painel-loadbalance# conntrack -L --dst=3D192.168.1.2 -=
-mark=3D0
tcp      6 63 TIME_WAIT src=3D187.87.149.xxx dst=3D192.168.1.2 sport=3D3759=
0
dport=3D10051 src=3D192.168.1.2 dst=3D187.87.149.130 sport=3D10051 dport=3D=
37590
[ASSURED] mark=3D0 use=3D1
tcp      6 111 TIME_WAIT src=3D187.87.149.xxx dst=3D192.168.1.2
sport=3D37723 dport=3D10051 src=3D192.168.1.2 dst=3D187.87.149.130 sport=3D=
10051
dport=3D37723 [ASSURED] mark=3D0 use=3D1
tcp      6 78 TIME_WAIT src=3D187.87.149.xxx dst=3D192.168.1.2 sport=3D3759=
3
dport=3D10051 src=3D192.168.1.2 dst=3D187.87.149.130 sport=3D10051 dport=3D=
37593
[ASSURED] mark=3D0 use=3D1
tcp      6 4 TIME_WAIT src=3D200.229.135.xxx dst=3D192.168.1.2 sport=3D1584=
3
dport=3D10051 src=3D192.168.1.2 dst=3D200.229.135.3 sport=3D10051 dport=3D1=
5843
[ASSURED] mark=3D0 use=3D1
# all this connections should be marked to 1 because our clients make
a connection to our zabbix server that is an application located at
firewall

conntrack -L --dst=3D192.168.1.2 --mark=3D1
conntrack v1.4.4 (conntrack-tools): 0 flow entries have been shown.


Thanks in advanced






2017-10-24 19:57 GMT-02:00 Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Le 24/10/2017 =C3=A0 00:15, paulo bruck a =C3=A9crit :
>>
>>
>> lan------- firewall--------- wan1------internet
>>                         |-----------wan2 -----internet
>>
>> All interfaces as bridges
>
>
> Do you mean that lan, wan1 and wan2 are ports in the same bridge ?
> Or they are themselves bridges ?
>
>> iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW -j
>> CONNMARK --set-mark 0x1
>
>
> Sets connection mark to 1.
>
>> iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
>
>
> IIUC, copies packet mark (unset so far) to the connection mark, overwriti=
ng
> the previous value (1). Why are you doing this ?
>
>> iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
>> ESTABLISHED,RELATED  -j CONNMARK --restore-mark
>
>
> Copies the connection mark (now unset) to the packet mark.
>
>> I can reach apache  but looking at conntrack -L  I see :
>>
>> tcp      6 107 TIME_WAIT src=3D192.241.152.243 dst=3D192.168.1.2
>> sport=3D53545 dport=3D80 src=3D192.168.1.2 dst=3D192.241.152.243 sport=
=3D80
>> dport=3D53545 [ASSURED] mark=3D0 use=3D1
>> tcp      6 103 TIME_WAIT src=3D192.241.152.243 dst=3D192.168.1.2
>> sport=3D53544 dport=3D80 src=3D192.168.1.2 dst=3D192.241.152.243 sport=
=3D80
>> dport=3D53544 [ASSURED] mark=3D0 use=3D1
>>
>>
>> Should be mark=3D1 ??
>
>
> No. See above comments.
>
>> How can I force mark=3D1
>
>
> Do not --save-mark when the packet mark is unset.
>
> Why do you need connection marks and packet marks ?



--=20
Paulo Ricardo Bruck consultor
tel 011 3596-4881/4882  011 98140-9184 (TIM)
http://www.contatogs.com.br
http://www.protejasuarede.com.br
gpg AAA59989 at wwwkeys.us.pgp.net
