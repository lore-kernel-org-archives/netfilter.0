From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: [Users] ipsec auto problem
Date: Fri, 9 Jul 2004 14:59:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407091459.09571.gdh@acentral.co.uk>
References: <289377461.12932@nwpu.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <289377461.12932@nwpu.edu.cn>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 09 July 2004 13:51, =C2=DE=BB=DB=C3=F4 wrote:
> In my "ipsec.conf",there exists one connection:
>
> conn test
>     left=3D202.117.83.1
>     right=3D202.117.83.2
>     authby=3Dsecret
>     reykey=3Dyes
>
> To load the connection by using "ipsec auto --add test",what is the defau=
lt
> arithmetic of the connction?
>
> How do i add esp=3D3des-md5 in "ipsec.conf"?
> Thanks!


http://www.freeswan.org/freeswan_trees/freeswan-2.06/doc/HowTo.html suggests

esp=3D3des-md5-96

Simply put it as another config line underneath "conn test"

gdh

