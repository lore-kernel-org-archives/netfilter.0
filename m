From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Block/Accept by MAC Address
Date: Mon, 30 Sep 2002 22:24:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209302224.30664.netfilter@newkirk.us>
References: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02>
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

On Monday 30 September 2002 09:33 pm, Jim Gifford wrote:
> Is it possible to block or accept information from specific MAC Address=
es.
>
> Here is what I would like to do. Is to create a exempt and complete blo=
ck
> policy by mac address. I have a guy who keeps hacking my machine and hi=
s IP
> address is always changing and so does his hostname. The only thing tha=
t
> was common was his MAC address.
>
> Thank you in advance for your help.

For the preparation- and research-impaired, read the oft-referenced tutor=
ial at:
http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutori=
al.html

especially section 5.4.3.1 about the "iptables -A INPUT -m mac --mac-sour=
ce 00:00:00:00:00:01" usage... (for
the keyboard impaired, try http://www.netfilter.org/documentation/tutoria=
ls/blueflux/iptables-tutorial.html#AEN1864 )

Or any of at least a dozen other places I could think of offhand. For the=
 search-impaired:
http://www.google.com/linux?hl=3Den&lr=3D&ie=3DISO-8859-1&q=3Diptables+ma=
c&num=3D100

j

