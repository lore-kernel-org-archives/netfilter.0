From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: iptables with alias?
Date: Sat, 05 Oct 2002 14:52:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPKEHADBAA.stewart.thompson@shaw.ca>
References: <20021005205315.FLSK7631.mta03-svc.ntlworld.com@there>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021005205315.FLSK7631.mta03-svc.ntlworld.com@there>
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
To: Antony Stone <antony@soft-solutions.co.uk>, netfilter@lists.netfilter.org

Hi Antony:

=09This just a test. My posts don't seem to be showing up on the list=
.

Regards,

Stu........


-----Original Message-----
=46rom: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: October 5, 2002 1:53 PM
To: netfilter@lists.netfilter.org
Subject: Re: iptables with alias?

On Saturday 05 October 2002 9:37 pm, Jeppe S=F8rensen wrote:

> Hello
>
> I have a little question that perhaps someone can help me with
>
> I have a interface to the inet with 4 dynamic ip addr
> eth0 =3D first dynamic ip addr
> eth0:0 =3D second dynmaic ip addr
> and so on
>
> I want to make 1 on 1 nat on the frist 2 aliass and the last 2 alia=
s are
> for the rest of the network 192.168.1.5 nat to eth0
> 192.168.1.6 nat to eth0:0
> 192.168.1.7-to-15 nat to eth0:1
> 192.168.1.16-to-30 nat to eth0:2

You're right - netfilter doesn't accept : characters in interface nam=
es.

I suggest you create a script to (re)write appropriate SNAT rules, wh=
ich is
called by dhcpcd, or whatever else you use to acquire your dynamic
addresses...

Antony.

--

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.



