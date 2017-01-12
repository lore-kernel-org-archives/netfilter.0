From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: conntrackd: synchronization failures
Date: Thu, 12 Jan 2017 08:58:32 +0100
Message-ID: <CAOkSjBj-X8F-Ca4vwocSsaZVzQN2R1MAUN+SCvCOb0XVPEzQ8Q@mail.gmail.com>
References: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm> <alpine.LRH.2.00.1701112254250.25853@gjva.wvxbf.pm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.1701112254250.25853@gjva.wvxbf.pm>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>, info@jablonka.cz

On 11 January 2017 at 22:57, Jiri Kosina <jikos@kernel.org> wrote:
> On Wed, 11 Jan 2017, Jiri Kosina wrote:
>
>>       (pid=11083) [ERROR] inject-add2: File exists
>
> Sometimes this EEXIST is reported in inject-add1
>
>>               tcp      6 120 FIN_WAIT src=10.33.12.15 dst=116.31.116.30 sport=22 dport=44232 [ASSURED]
>>       (pid=11083) [ERROR] inject-add2: Device or resource busy
>
> This EBUSY seems to be always inject-add2 phase though.
>
> I've tried both conntrackd 1.0.1 and 1.4.3, both compiled against
> libnfnetlink-1.0.1; the behavior has been exactly the same.
>
> The hosts are running rather different kernels (3.10 from RHEL 7 (RS2) and
> 4.6.1-rt2 (RS1) respectively).

I can see them too, in NATed connections most of the time:


Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 120 TIME_WAIT
src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 10 CLOSE
src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-add2: File exists
Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 120 SYN_SENT
src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443 [UNREPLIED]
Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 60 SYN_RECV
src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 432000
ESTABLISHED src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
[ASSURED]

this is linux 4.8.11 and conntrack-tools commit
5a51b045b369e3f8aa83cd32c14149158bd86546
