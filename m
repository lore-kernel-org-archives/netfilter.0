From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Broken ftp through iptables
Date: Tue, 26 Aug 2003 12:59:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <035b01c36beb$09b417f0$49caa8c0@caris.priv>
References: <000701c36be5$b629a050$6901a8c0@Station13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Landon Chelf <landonc@starrobbins.com>, netfilter@lists.netfilter.org

If you want to use passive ftp you have to allow stuff destined to port 21
and you also have to allow ( for the commands) traffic to come in on some
port that you don't get to pick.  The way to to this without actually
opening a whole bunch of ports is like this

From inside network going out and on forward chain
    -p tcp --dport  21 -j ACCEPT
    -p tcp -m state --state RELATED - j ACCEPT

FROM outside network back in on the Forward chain
   -p tcp -m state --state ESTABLISHED -j ACCEPT


If you want to do Active ftp .... well .... trust me, you dont want to do
this :)


----- Original Message -----
From: "Landon Chelf" <landonc@starrobbins.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 26, 2003 12:21 PM
Subject: Broken ftp through iptables


> Hello,
>
> I've ran into a recent problem both on rh8 and rh9 using iptables.  I've
> setup my firewall to drop everything incomming and forward and am only
> allowing certain ports to be open.  I've opened ftp (port 21 tcp) and I
> can connect via FTP from one machine and authenticate, but when I issue
> my first command like "ls" for instance the connection locks up and
> won't do anything.  Is there a way to fix this?
>
> Landon
>
>


