From: Henrik Martin <henrik@netgate.net>
Subject: Re: Yet another local nat/port redirecting question
Date: Thu, 26 Apr 2007 11:49:14 -0700
Message-ID: <200704261149.15667.henrik@netgate.net>
References: <200704241701.28038.henrik@netgate.net>
	<46307AA2.5080007@freemail.hu>
Reply-To: Henrik Martin <henrik@netgate.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46307AA2.5080007@freemail.hu>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


On Thursday 26 April 2007 03:10, G=E1sp=E1r Lajos wrote:

> As Martijn wrote: the problem could be that you run the web server
> binded to a specific IP.
>
> What is the ouput of this? :
>
> netstat -a -n | grep 8080
>
>
> Swifty

As I mentioned in the follow-up posting, I've tried forwarding to
ports that are bound to 0.0.0.0, 127.0.0.1, the 192.168.x.x address,
etc. There's absolutely no difference in behavior, it all fails with
the same symptoms. Here's netstat's output:

cobra:/home/basil # netstat -ant
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:6010          0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:3306          127.0.0.1:24451        =20
ESTABLISHED
tcp        0      0 :::225                  :::*                    LISTEN
tcp        0      0 127.0.0.1:8005          :::*                    LISTEN
tcp        0      0 :::8009                 :::*                    LISTEN
tcp        0      0 :::8080                 :::*                    LISTEN
tcp        0      0 ::1:25                  :::*                    LISTEN
tcp        0      0 ::1:6010                :::*                    LISTEN
tcp        0      0 :::8443                 :::*                    LISTEN

I've tried forwarding port 80 to basically every one of these ports
and then attempted a telnet connection to that port. If I do it from
the "outside", the connection just hangs like the port is being
filtered. If I do a "telnet localhost 8080" I get:

Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused
Trying ::1...
telnet: connect to address ::1: Connection refused

According to the iptables man page, locally generated packets are
mapped to the 127.0.0.1 address, so this should work I'd think.

There's got to be other people running OpenSuSE 10.X out there that
are trying to do the same thing. Does anyone have a success story for
port forwarding on that platform? I've scoured the SuSE blogs and
support sites, but haven't really found anything. And Novell makes you
go through hoops just to sign up so you can post things to their
forums :-(
Thanks,

/Henrik


