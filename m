From: Arthur Meyer <arthur.meyer@tbz.ch>
Subject: Re: Passive FTP Problem in NAT.
Date: Thu, 16 Sep 2004 08:58:18 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409160858.18046.arthur.meyer@tbz.ch>
References: <84F19A978A20454D96263C93109EE76937CE@telex.atom01.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <84F19A978A20454D96263C93109EE76937CE@telex.atom01.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Is the nat-ftp-helper module loades?

insmod ip_nat_ftp

Arthur Meyer

On Wednesday 15 September 2004 16:51, Svavar =D6rn Eysteinsson wrote:
> Hi.
>
> Could someone help me or give me advice regarding NAT on a FTP server
> located in my DMZ.
>
> This is my setup :
>
> My Firewall(Linux 2.4.22-1) :
>
> - eth0 =3D Public Interface (x.x.x.66 / 26 )
>
> - eth1 =3D DMZ Interface (172.16.100.254 / 24 )
>
> - eth2 =3D My Internal Network ( 192.168.1.1 / 24 )
>
>
> I have a FTP server located on my DMZ Network. The server is listening
> on a "non-standard" ftp port. It listens on port : 2121.
>
> To generate my firewall config I use FwBuilder. I've tried many
> configurations but, I never get the data port to open( e.g. to list a
> directory)
>
> In my configuration I've allowed, and NAT'ed the following services
> to my FTP server located on the DMZ  :
>
> FTP =09=09=3D =09TCP Destination Port : Start : 2121 - End : 2121
> FTP_DATA=09=3D=09TCP Source Port : Start : 20 - End : 20
> =09=09=09        Destination : Start : 1024 - End : 65535
>
> I can connect, but cannot list the directories.
>
> p.s. I'm running Proftpd on my FTP server. I have also tried to configu=
re
> the "PassivePorts=3D 60000 65534" to configure a group of the passive p=
orts.
> But it's the same issue with the directory listening.
>
> Any help would be much appreciated.
>
>
> Best regards to all,
>
> Svavar O
> Reykjavik - Iceland

--=20

This email was created using 100% recycled electrons.


