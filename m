From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Slow FTP through NAT box...
Date: Fri, 13 Sep 2002 23:52:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPKEJNCOAA.stewart.thompson@shaw.ca>
References: <3D8299CC.1CFC740A@itdimensions.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3D8299CC.1CFC740A@itdimensions.com>
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
To: Marian Stepka <marians@itdimensions.com>, netfilter@lists.netfilter.org

Hi Marian:

	Are you loading ip_conntrack_ftp and ip_nat_ftp?
What to you get if you do an lsmod, are they there?

Stu..........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Marian Stepka
Sent: September 13, 2002 7:07 PM
To: netfilter@lists.netfilter.org
Subject: Slow FTP through NAT box...

Hi List;

I'm fighthing with NATing issues almost 3 days. Now I'm facing problem,
that It take extremly long to get passive ftp access to the machine
after NAT box. I can access it just using ftp command line client from
Linux machine and none from Win working even PASV mode is enabled. But
anyway initial handshaking take a pretty long, let's say 2 minutes. Box
do nothing else just translate range from priavte IP range to normal
Inet range.

Other services works pretty well as ssh, web. But FTP driving me
slightly mad. Do anybody out there have any idea what I did wrong or
when I can find some info about? Probably I read whole Google. Or I'm
blind or what...

Marian

--
*IN ROOT WE TRUST*
Marian Stepka <mailto:stepka@tris.sk>


