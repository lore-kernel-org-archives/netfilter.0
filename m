From: DEXTER <dexter@fiktiv.szgtikol.kando.hu>
Subject: Re: largescale NAT
Date: Tue, 27 Dec 2005 18:50:12 +0100
Message-ID: <43B17ED4.5020104@fiktiv.szgtikol.kando.hu>
References: <43B16A57.508@fiktiv.szgtikol.kando.hu>
	<5d369d900512270859j45bc26f7i32397c1c6a6e12ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d369d900512270859j45bc26f7i32397c1c6a6e12ea@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Alex Sirbu <alex.sirbu@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thank you for your answer, but what if we have only one public(external)
ip? :)

Alex Sirbu wrote:
> Hi,
>  
> I have a situation similar with yours : I have almost 1024 computers
> connected to Internet through a single ( but powerful ) NAT box. To
> solve the problem, I use multiple IP addresses for NAT . I have a rule
> that sound like this ( it's just an example, not the real world ) :
>  
> iptables -t nat -A POSTROUTING  -s 192.160.100.0/22
> <http://192.160.100.0/22> -o eth0 -j SNAT --to-source 10.0.0.1-10.0.0.63
>  
> Obviously, you should replace 192.160.100.0/22
> <http://192.160.100.0/22>  with your internal IP address pool  and
> 10.0.0.1 <http://10.0.0.1> with your external IP. Note that the more
> external IP-s you use, the less chances to have port conflict on the NAT
> box.
>  
> Normally, on every IP you can have a fixed number of ports usable at the
> same time. If you just multiply the number of the IP addresses used for
> NAT , you will have more available ports, so more resources for new
> connections. But be aware that you will need a huge amount of memory to
> handle the connection tracking.  My NAT box have 2GB bytes of RAM , and
> it use more than 1.2 GB for NAT , on an average of 25.000-30.000
> simultaneous connections, using 65% of a 100FDX Internet connection ,
> running QoS too ( IMQ and HTB ).
>  
>  
>  
> 
> 
>  
> On 12/27/05, *DEXTER* <dexter@fiktiv.szgtikol.kando.hu
> <mailto:dexter@fiktiv.szgtikol.kando.hu>> wrote:
> 
>     -----BEGIN PGP SIGNED MESSAGE-----
>     Hash: SHA1
> 
>     Okay. As nobody answered my question - except one in private - i'll try
>     to rephrase it.
> 
>     So.. there is a dormitory about 400+ students in it. They are always
>     like to play games on net, and when one starts something like GameSpy it
>     connects to a whole bunch of servers on all kinds of ports, and it is
>     just ONE user, and not to mention other p2p programs like DC, Emule,
>     Bittorrent, etc. Than you can imagine what happens when 100 or more
>     users want to play online at the same time -> it eats up lots of
>     port on
>     the NAT box (all of the ports).
> 
>     and this is where the problem lies.
> 
>     The documenation on NAT is great
>     (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html
>     <http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.html>) but
>     it is
>     good when you have only few machines, or lots of machines but not with
>     gamers, downloaders....
>     Why isn't there any documentation on how linux handles free, and
>     occupied ports on a NAT box, how to fine tune the box when lots of user
>     are behind it, etc..?
> 
>     So my question is: How to handle this situation? I mean, just 1 NAT
>     linux box is able to handle all the 400+ users with the above
>     situations? Or we have to do something like CONNLIMIT on source ips? Is
>     there possibilities to balance the traffic on 2 or more NAT box?
> 
>     thx.
> 
>     - --
>     You can find my public PGP key here:
>     Tu peux trouver mon public PGP clef ici:
>     A nyilvanos PGP kulcsomat innen tudod letolteni:
> 
>     http://koli.kando.hu/dexter/publickey.asc
>     http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xBC788404
>     <http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xBC788404>
> 
> 
> 
> 
> -- 
> 
> Alex Sirbu

- --
You can find my public PGP key here:
Tu peux trouver mon public PGP clef ici:
A nyilvanos PGP kulcsomat innen tudod letolteni:

http://koli.kando.hu/dexter/publickey.asc
http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xBC788404

.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDsX7Ud/8YWbx4hAQRAoHlAJ4xIe+TD/dtyawFYVMkX25emzUg4QCgmgjC
09UvtS5lYpMWnLDDA1aH6iA=
=DALM
-----END PGP SIGNATURE-----

