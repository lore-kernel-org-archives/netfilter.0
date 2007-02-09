From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables proxy to a different network
Date: Fri, 09 Feb 2007 20:56:19 +0100
Message-ID: <45CCD1E3.6010800@plouf.fr.eu.org>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>	<45CC5A91.4090200@plouf.fr.eu.org><Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>	<45CC919C.7030104@plouf.fr.eu.org><D392D4803D14354CBC49D772E19DD0CD45660B@zeus.w2k.nrlmry.navy.mil>	<45CCA8CC.6060205@plouf.fr.eu.org>
	<D392D4803D14354CBC49D772E19DD0CD45660D@zeus.w2k.nrlmry.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D392D4803D14354CBC49D772E19DD0CD45660D@zeus.w2k.nrlmry.navy.mil>
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
To: netfilter@lists.netfilter.org

Andrus, Mr. Brian (Contractor) a =E9crit :
>=20
> In the diagram:
> System A: Client
> System B: Proxy
> System C: Server
[...]
>>+---------------+
>>|   System A    |
>>+-------+-------+
>>        |
>>{=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
>>{    Internet   }
>>{=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
>>        |
>>+---------------+        +---A.B.C.x-----+
>>|    Router     +--------|   System B    +
>>+-------+-------+        +---------------+
>>        |
>>+-------+-------+
>>|   System C    |
>>+---X.Y.Z.x-----+

If you have the following rule in system B's nat table :

-A PREROUTING -p tcp --dport 80 -j DNAT --to ip_C

you just need to add the following rule :

-A POSTROUTING -d ip_C -p tcp --dport 80 -j SNAT --to ip_B

System C will see ip_B as the client address and will send the replies=20
back to it, so system B can put back the original addresses.

I suppose you are aware that the router would be a much better place to=20
to the DNAT that system B. Actually you would not need system B. I am=20
not sure I understand the purpose of this setup.

