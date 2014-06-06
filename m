From: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Subject: Re: conntrackd crash after few seconds
Date: Fri, 06 Jun 2014 14:37:54 +0200
Message-ID: <5391B622.8030808@yahoo.fr>
References: <53908A7E.4020802@yahoo.fr> <20140605154944.GA29302@finrod> <CAOkSjBifDQQNNQJbkdraYxNvStvK9CrWRNO7LtawpJJ5n=cTMg@mail.gmail.com> <20140605160639.GB29302@finrod>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024; t=1402058279; bh=m8whJJ4Qt1/KzkshHxfthzdVYC2MogG9WD4Y09CqdeE=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Wk+ANOeYJWK+yD5pMllNy5pcndu98J7XFo18I1T7SEL9NlG/jcGFtdaw2yPaxBxbQT+bS/P1NbTqW0fYvjUsOeOsfXaF4BOQ9TDHIZ/5OF9OEn/x0Sf074HXU+qb2tMZ6fc3s09iTl3S9J0yHCTHDTfwkDzVo+Qtpp9BB8xwl7Y=
In-Reply-To: <20140605160639.GB29302@finrod>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Le 05/06/2014 18:06, Martin Kraus a =E9crit :
> On Thu, Jun 05, 2014 at 05:59:19PM +0200, Arturo Borrero Gonzalez wro=
te:
>> On 5 June 2014 17:49, Martin Kraus <lists_mk@wujiman.net> wrote:
>>
>>> On Thu, Jun 05, 2014 at 05:19:26PM +0200, Nicolas RENAULT wrote:
>>>> informations :
>>>>
>>>> debian wheezy     3.2.0-4-amd64 #1 SMP Debian 3.2.57-3+deb7u2 x86_=
64
>>> Hi.
>>>
>>> We had crashes on debian wheezy which were solved by upgrade to
>>>
>>> linux-image-3.13-0.bpo.1-amd64
>>>
>>
>> Is this the same as the Debian bug #746464 [0]?
> probably not. we hit a kernel panic and when I redirected kernel cons=
ole to
> the serial port for another run it showed that there was a stalled cp=
u core running
> conntrackd process and everything was just dead.
>
> mk
Hi,

I find the solution , the proble come from conntrackd.conf it was made=20
from the one on a squeeze and with the example bring with the package a=
=20
made this one :

Sync {
     Mode FTFW {
         DisableExternalCache On
     }
     UDP {
         IPv4_address 10.98.145.5
         IPv4_Destination_Address 10.98.145.6
         Port 3780
         Interface eth2
         SndSocketBuffer 1249280
         RcvSocketBuffer 1249280
         Checksum on
     }
}
General {
     HashSize 8192
     HashLimit 65535
     Syslog on
     LockFile /var/lock/conntrackd.lock
     UNIX {
         Path /var/run/conntrackd.sock
         Backlog 20
     }
     SocketBufferSize 262142
     SocketBufferSizeMaxGrown 655355
     Filter {
         Protocol Accept {
             TCP
         }
         Address Ignore {
             IPv4_address 10.98.0.0/16     #dedicated link #
         }
     }
}


diff :
                 old         new
HashSize  32768   8192
HashLimit 131072 65535

- NetlinkBufferSize 2097152
- NetlinkBufferSizeMaxGrowth 8388608
- NetlinkOverrunResync On
- NetlinkEventsReliable Off
- PollSecs 15
- EventIterationLimit 100
- Filter From Userspace {

+ SocketBufferSize 262142
+ SocketBufferSizeMaxGrown 655355
+ Filter {

can someone look at my new conntrackd.conf and says if i forget=20
somethinks important ?.

regards


--=20
Nicolas

