From: David Gubler <dg@doodle.com>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Mon, 04 Feb 2013 12:29:31 +0100
Message-ID: <510F9B9B.8070907@doodle.com>
References: <51014395.1000101@doodle.com> <510E4F4C.50202@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <510E4F4C.50202@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

Thanks for your response. Here's exactly what I'm doing and what I get.

# uname -a
Linux 3.2.0-36-generic #57-Ubuntu SMP Tue Jan 8 21:44:52 UTC 2013 x86_6=
4 x86_64 x86_64 GNU/Linux (Ubuntu 12.04)

# iptables -A INPUT -p tcp --syn --dport 8080 -m connlimit --connlimit-=
above 4 -j REJECT --reject-with tcp-reset

# conntrack -L | grep 8080
conntrack v1.0.0 (conntrack-tools): 62 flow entries have been shown.

Starting four downloads with wget --limit-rate=3D1:

# conntrack -L | grep 8080
tcp      6 431994 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
tcp      6 431994 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0278 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60278 [ASSURED] mark=3D0 use=3D1
tcp      6 431995 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
tcp      6 431999 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1

Starting a fifth download fails:

$ wget --limit-rate=3D1  http://localhost:8080/....
--2013-02-04 11:48:41--  http://localhost:8080/...
Aufl=F6sen des Hostnamen =BBlocalhost (localhost)=AB... 127.0.0.1
Verbindungsaufbau zu localhost (localhost)|127.0.0.1|:8080... fehlgesch=
lagen: Verbindungsaufbau abgelehnt.
(connection rejected)

# conntrack -L | grep 8080
tcp      6 431949 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
tcp      6 431990 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0278 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60278 [ASSURED] mark=3D0 use=3D1
tcp      6 431956 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
tcp      6 431963 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1
tcp      6 71 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60291 dp=
ort=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dpo=
rt=3D60291 mark=3D0 use=3D1

Note: The rejected connection is in the conntrack table in the state SY=
N_SENT.

Killing one of the four running downloads with CTRL+C:

# conntrack -L | grep 8080
tcp      6 431950 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
tcp      6 7 CLOSE src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60278 dport=3D=
8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D60278 [ASSURE=
D] mark=3D0 use=3D1
tcp      6 431958 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
tcp      6 431965 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1
tcp      6 17 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60291 dp=
ort=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dpo=
rt=3D60291 mark=3D0 use=3D1

Now we have a connection in state CLOSED and one in state SYN_SENT in t=
he table. wget still fails as it did before.

After making a few connect attempts with wget (all failing):

# conntrack -L | grep 8080
tcp      6 431946 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
tcp      6 87 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60294 dp=
ort=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dpo=
rt=3D60294 mark=3D0 use=3D1
tcp      6 431954 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
tcp      6 431961 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1
tcp      6 117 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60298 d=
port=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dp=
ort=3D60298 mark=3D0 use=3D2
tcp      6 14 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60292 dp=
ort=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dpo=
rt=3D60292 mark=3D0 use=3D1
tcp      6 117 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60299 d=
port=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dp=
ort=3D60299 mark=3D0 use=3D1
tcp      6 116 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60295 d=
port=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dp=
ort=3D60295 mark=3D0 use=3D1
tcp      6 116 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60296 d=
port=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dp=
ort=3D60296 mark=3D0 use=3D1
tcp      6 117 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60297 d=
port=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dp=
ort=3D60297 mark=3D0 use=3D1
tcp      6 86 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60293 dp=
ort=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dpo=
rt=3D60293 mark=3D0 use=3D2

=2E.. waiting for about two minutes ...

# conntrack -L | grep 8080
conntrack v1.0.0 (conntrack-tools): 57 flow entries have been shown.
tcp      6 431983 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
tcp      6 431991 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
tcp      6 431998 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D6=
0285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1

=2E.. and now I can start another wget download.


On 03.02.2013 12:51, Pascal Hambourg wrote:
 >
 > This is not the expected behaviour. AFAIK, when a packet creating a =
new
 > connection is DROPPed or REJECTed, the conntrack entry should be
 > deleted. This is what I observe on my system.

Ok this is weird. I have made a similar (although not exactly the same)=
 attempt on "Linux 2.6.32-5-amd64 #1 SMP Sun Sep 23 10:07:46 UTC 2012 x=
86_64 GNU/Linux" (Debian stable with stock kernel). On that kernel it b=
ehaves as you describe it! No=20
SYN_SENT entries pop up in the conntrack table, instead the denied conn=
ections directly go into TIME_WAIT, and the connection limit works fine=
=2E

On "Linux 3.2.0-2-amd64 #1 SMP Mon Jun 11 17:24:18 UTC 2012 x86_64 GNU/=
Linux" (Debian stable with backports kernel), on the other hand, I get =
the exact same behavior as with 3.2 in Ubuntu (broken). Which makes me =
guess that this is not caused by some=20
weird Ubuntu specific default setting, but rather a general problem in =
Linux 3.2.

Bug...?

Thanks,

David

--=20
David Gubler
Senior Software & Operations Engineer
MeetMe: http://doodle.com/david
E-Mail: dg@doodle.com
