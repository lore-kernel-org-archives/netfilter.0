From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: HUP
Date: Wed, 16 Mar 2005 16:30:04 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503161627290.19696@darkstar.sysinfo.com>
References: <42383F7C.2040300@eccotours.dyndns.org>
	<42385514.70600@SCampbell.net>
Mime-Version: 1.0
In-Reply-To: <42385514.70600@SCampbell.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Steven M Campbell <Netfilter@SCampbell.net>
Cc: iptables <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



I've often found that killing the attached process can often leave the 
state of the connection in a funky way for sometime. and that it most the 
time serves better to kill the login shell.  Course, I tend to not kill as 
sweetly these busy days then I used to back a few years ago, and this 
might indeed have something to do with state left in limbo for timeout 
periods.

Thanks,

Ron DuFresne

On Wed, 16 Mar 2005, Steven M Campbell wrote:

> netstat --inet -p  will show you the attached process and you can kill that 
> process.
>
> scampbell@linux:~> netstat --inet -p -n
> Active Internet connections (w/o servers)
> Proto Recv-Q Send-Q Local Address           Foreign Address         State 
> PID/Program name
> tcp        0      0 10.8.178.10:33819       22.33.44.123:22 
> ESTABLISHED 8083/ssh
> tcp        0      0 10.8.178.10:32795       64.12.165.101:5190 
> ESTABLISHED 6984/gaim
> tcp        0      0 10.8.178.10:33083       207.46.107.52:1863 
> ESTABLISHED 6984/gaim
>
> If I want to terminate that ssh connection I just  kill 8083
>
> Brent Clark wrote:
>
>> Hi
>> 
>> I performed a netstat-nat on my fw.
>> 
>> And there is a entry that I dont like.
>> 
>> This is my employer working from home, probally left the remote desktop 
>> session open.
>> 
>> tcp   host81-153-16-165.range81-153.btcen:3191 
>> resmanager.eccotours.local:3389          ESTABLISHED
>> 
>> anyone know how I can just this kill this NATTED connection.
>> 
>> Any advice would be most appreciated.
>> 
>> Kind Regards
>> Brent Clark
>> 
>

- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                         -Tom Robins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCOKVgst+vzJSwZikRAtsiAJwIN9YEcGcpb70X5RHcnCHFXFPAJACcDd/9
yv9SoQijvEiajlSpfooL+qM=
=a34B
-----END PGP SIGNATURE-----

