From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 16:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181617.52652.Antony@Soft-Solutions.co.uk>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181313.47640.Antony@Soft-Solutions.co.uk> <ef83df6b04071806565f854eb6@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ef83df6b04071806565f854eb6@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 18 July 2004 2:56 pm, John wrote:

> > Tcpdump is a good packet sniffer but it does not show the data in a
> > user-friendly format.
>
> ok I've made another tcpdump for ethereal and it's ok;

Good.   Sounds like the last time you just redirected console output from 
tcpdump; this time you've actually made it save a file.

> I've checked and I get a lot of this scheme :
>
> No.     Time        Source                Destination           Protocol
> Info 10 0.004569    24.33.232.227         mydomain         TCP
> 1488 > http [SYN] Seq=0 Ack=0 Win=64240 Len=0 MSS=1460
>      11 0.004626    mydomain         24.33.232.227         TCP
> http > 1488 [SYN, ACK] Seq=0 Ack=1 Win=5840 Len=0 MSS=1460
>     255 0.162181    24.33.232.227         mydomain         TCP
> 1488 > http [ACK] Seq=1 Ack=1 Win=64240 Len=0
>     258 0.165191    24.33.232.227         mydomain         TCP
> 1488 > http [FIN, ACK] Seq=1 Ack=1 Win=64240 Len=0
>     259 0.165313    mydomain         24.33.232.227         TCP
> http > 1488 [FIN, ACK] Seq=1 Ack=2 Win=5840 Len=0
>     385 0.311935    24.33.232.227         mydomain         TCP
> 1488 > http [ACK] Seq=2 Ack=2 Win=64240 Len=0
>
> (this is the whole tcp stream)

Good.   That to me looks like a good TCP sequence, however there is one packet 
missing - the ACK response from "mydomain" to 24.33.232.227 in response to 
the FIN-ACK sent by 24.33.232.227 in packet number 1488.   Until this missing 
response is seen by netfilter, it will regard that connection as being in the 
TIME_WAIT state, however this will expire after 2 minutes.

> for others I get the complete http exchange : get ...

I can't explain why there isn't any more interesting data in the HTTP part of 
the above communication, however that's pretty irrelevant for TCP/IP.

> is it normal ?

Is it normal to see an HTTP connection with no data being transferred?   No, I 
wouldn't have thought so, but then I'm no expert on M$ IIS-5.1, which is what 
that web server is running.

> Ethereal is brand new for me so if you have some good tips to help me
> find some interesting information ... thanks a lot

The help system is pretty good; other than that there's documentation at 
http://www.ethereal.com   You probably won't find ethereal.org or 
ethereal.net quite so useful :)

Regards,

Antony.

-- 
GIT/E d- s+:--(-) a+ C++++$(---) UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) 
o? w--(---) O !M V+++(--) !PS !PE Y+ PGP+> t- !tv@ b+++ DI++ D--- e+++(*) h++ 
5? !X- !R K--? G-

                                                     Please reply to the list;
                                                           please don't CC me.


