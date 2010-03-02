From: Dion Kant <msn@concero.nl>
Subject: Re: Packets ending up in wrong chain after DNAT
Date: Tue, 02 Mar 2010 19:01:38 +0100
Message-ID: <4B8D5282.5070107@concero.nl>
References: <4B8C69FF.7050400@concero.nl> <56378e321003020212t17cdec48m6e414d89da208af2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e321003020212t17cdec48m6e414d89da208af2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

Richard Horton wrote:
> On 2 March 2010 01:29, Dion Kant <msn@concero.nl> wrote:
>
>   
>> Mar  2 02:03:55 erouter kernel: [527925.765439] LOG 25 Wrong  IN=eth2
>> OUT= MAC=00:16:3e:78:4a:72:00:1d:45:8a:1b:2e:08:00 SRC=1.1.1.1
>> DST=2.2.2.2 LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=0 DF PROTO=TCP SPT=53803
>> DPT=25 WINDOW=0 RES=0x00 RST URGP=0
>>     
>
> As I understand what you are trying to do is allow access to port 25
> on your internal network from an external machine right?
>   
Yes correct.
> If so that log looks odd - the originator of the connection is sending
> a RESET flag. The Reset flag is sent by the destination (atleast from
> my knowledge they are).
>   
This does ring a bell to me. I think it is caused by a Postfix
"feature". The mail server is a Postfix MTA.  If I understand you
correctly Postfix opens a connection, "conntracked" correctly as can be
seen by the log in the FORWARD chain. Then a bit later, Postfix sends a
packet with RST set. This is an error, classified invalid and therefore
it ends up in the INPUT chain.

Thanks for explaining this.

Dion.

