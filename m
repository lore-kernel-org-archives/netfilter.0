From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Conntrack rule timeout problem
Date: Wed, 23 May 2007 14:47:29 +0200
Message-ID: <465437E1.9030600@freemail.hu>
References: <1179765250.12001.18.camel@thales.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1179765250.12001.18.camel@thales.lan>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pat Riehecky <prieheck@iwu.edu>
Cc: netfilter@lists.netfilter.org

Hi,

Pat Riehecky =EDrta:
> I seem to be capturing way more packets than I intend (or even expect!)=
=2E
> I am running squid and have the firewall rules below running on it.  Fo=
r
> some reason I am capturing hundreds of packets that I don't think shoul=
d
> be caught.
>  =20
Maybe someone is scanning you....
> I have increased the timeouts in /proc/ (via sysctl) to fix this, but n=
o
> dice.  Anyone have any idea why the sample packet below would be
> captured?  It is getting picked up by either the=20
> -A INPUT -p tcp -m tcp ! --syn -m conntrack --ctstate INVALID -j DROP
> but sometimes the
> -A INPUT -p tcp -m tcp ! --syn -m state --state NEW -j DROP
>  =20
Take a look on nmap...
> The packet looks to have been requested by squid, it is coming on port
> 80...  I also seem to be having the same behavior on the squid side
> where the FIN/ACK packets are being caught by the conntrack rule...
>
> I know I have something wrong, just what exactly is eluding me...
>
> Any help would be helpful!
>  =20
Swifty


