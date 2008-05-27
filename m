From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not
 understood
Date: Tue, 27 May 2008 09:46:02 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805270944380.12937@fbirervta.pbzchgretzou.qr>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com> <483B2069.7010504@trash.net> <483B606E.9050305@gmail.com> <483BBAB3.6040805@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483BBAB3.6040805@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: filippozeus@gmail.com, netfilter@vger.kernel.org


On Tuesday 2008-05-27 09:39, Patrick McHardy wrote:
> Filippo Zeus wrote:
>> Considering ftp-control port is text based i've dumped with -A switch. I hope
>> it's ok
>> 
>> 03:05:59.149005 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 1:71(70) ack 1
>> win 46
>> 2.P.?......L.1...P....`..220 FTP Server ready. Please use FTP-TLS or login wi
>> 03:05:59.149078 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 71 win 1024
>> 2....1.....M.P.......+
>> 03:05:59.149759 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 1:11(10) ack 71
>> win 1024
>> 2....1.....M.P.......AUTH TLS
>> 
>> 03:05:59.700919 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: . ack 11 win 46
>> 2.P.?......M.1...P.......
>> 03:05:59.700939 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 71:96(25) ack 11
>> win 46
>> 2.P.?......M.1...P...O...234 AUTH TLS successful
>> 
>> 03:05:59.701036 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: . ack 96 win 1024
>> 2....1.....M4P.......+
>> 03:05:59.706276 IP 151.80.2.63.55194 > ***HIDDEN_IP***.21: P 11:95(84) ack 96
>> win 1024
>> 2....1.....M4P...L.......O...K..H;^w.i} ..\*.+....'b..]...5`.O....$.3.E.9
>> 03:06:00.416441 IP ***HIDDEN_IP***.21 > 151.80.2.63.55194: P 1516:1666(150)
>> ack 95 win 46
>> 2.P.?......R.1...P....[...)E..5O......tsp.+).)..W[H..u.)IP..&....XZr...~.<... 
>
>
> Its a bit hard to read, but this looks like your client also
> encrypts the control connection, which explains why FTP
> conntrack doesn't work.

`tcpdump -Xs0` is preferred; unless the encryption is temporarily
dropped using the CCC command to make the PASV/PORT commands in
plaintext, the stream is not analyzable.
