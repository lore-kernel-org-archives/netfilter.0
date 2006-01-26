From: Christos Panagiotakis <chrismfz@gmail.com>
Subject: NAT with iptables / linux
Date: Thu, 26 Jan 2006 22:19:02 +0200
Message-ID: <dac71d7b0601261219q39b58368w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello people!
I just buy my first 16 static ip pack and I am wondering what can I do
to assign these ips to some workstation that I have.
Something like this

=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D             =3D
=3D   Lan     =3D     =3D=3D Linux Box =3D=3D=3D Modem/router =3D=3D=3D Int=
ernet >>>
=3D             =3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Lets say I have local ips like 10.0.0.0/24 and "real" static ips like
195.170.2.1 , 195.170.2.2 and so on....
And I want for every local ip to assing a static one.
In a few words I want every single workstation to have its own static ip..
A friend of mine told to that I have to use POSTROUTING and PREROUTING
and here is that I confused...
Anyone can help me / tell me what exactly have to do to make this work ?

Thanks in advance and forgive me for my awful english :-)

Christos Panagiotakis

