From: alucard@kanux.com
Subject: Re: forwarding
Date: Tue, 18 May 2004 14:21:37 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4290.192.168.74.21.1084904497.squirrel@192.168.74.21>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105> 
    <1084891180.6410.18.camel@localhost> 
    <34012.200.44.170.105.1084892235.squirrel@200.44.170.105> 
    <1084892325.6417.40.camel@localhost> 
    <34103.200.44.170.105.1084893176.squirrel@200.44.170.105> 
    <1084895498.7289.7.camel@localhost> 
    <34404.200.44.170.105.1084898303.squirrel@200.44.170.105>
    <1084899777.7261.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084899777.7261.17.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

> OK - it's good to simplify :-)
> You should not need to INPUT rule for 8080.
I=B4t=B4s commented, it=B4s an old rule for something I used to have in tha=
t server

> The delay in finding the default route is route's attempt at reverse
> name resolution.  Use route -n instead.

Indeed, this is what I get in server2

--------
[root@linserv root]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.0.1     0.0.0.0         UG    0      0        0 eth0
--------

> Our next step is to trace.  From what address are you attempting to
> telnet and where does that address live?

I=B4m using a completly different address to try to access the server from
the outside, to be more specific, I'm doing this at work and I'm using the
computers in my house to do this test and nothing happens. If I telnet
port 80 server2 directly from server1 I get this -to make sure it's
working-:

--------
root@mail:~# telnet 192.168.0.2 80
Trying 192.168.0.2...
Connected to 192.168.0.2.
Escape character is '^]'.
^]
telnet>
--------

Thanks dude
Peace
Juan
Programmin' Python is like sugar... Sweet! ;)

