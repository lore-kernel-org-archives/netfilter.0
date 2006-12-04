From: "victor oliveira" <victor.oliveira@concretesolutions.com.br>
Subject: Re: -i interface filter not working for firewall
Date: Mon, 4 Dec 2006 10:41:41 -0300
Message-ID: <b020b8120612040541w4b969840qc1d6abdef3db099b@mail.gmail.com>
References: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>
	<b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>
	<4572F669.1000206@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4572F669.1000206@rtij.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

eth2 and eth3 are both connected to the same switch, and are not
virtual. Each with a different IP.
eth2 has the IP 10.10.1.8 and eth3 has the ip 10.10.1.9.
I=B4m using for testing a putty application from another machine, also
connected to the same switch.
I know it should be working but it is not.
Furthermore, I tested the mangle rules for multiple tables and it only
works without the -i option.
My "solution" was to change to different subdomains and just not use
the -i restriction...
any thoughts ?

On 12/3/06, Martijn Lievaart <m@rtij.nl> wrote:
> victor oliveira wrote:
>
> > My problem is the following: I am able to connect from my machine to
> > the firewall using both eth2 and eth3. However, note that the INPUT
> > default is DROP, and the only rule on the INPUT SHOULD be filtering
> > and only allowing connections to the eth2 and not the eth3
> > interface...
>
>
> You rules are a bit messy, but it should probably work. Are you sure you
> connect through eth3? You do say it is from the same machine, if you are
> connected to eth2 and address the ip addres of eth3, you still come in
> through eth2.
>
> HTH,
> M4
>
>



--=20
Victor Hugo de Oliveira

Concrete Solutions
+55 21 22402030
R. S=E3o Jos=E9 90, 2121
20010-020
Rio de Janeiro, RJ, Brasil

