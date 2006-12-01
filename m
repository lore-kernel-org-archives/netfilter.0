From: "victor oliveira" <victor.oliveira@concretesolutions.com.br>
Subject: Re: ROUTE target and kernel 2.6.19
Date: Fri, 1 Dec 2006 14:02:57 -0300
Message-ID: <b020b8120612010902j3f5a7223te0fc4f8e4e5990f3@mail.gmail.com>
References: <35999.195.55.244.106.1164965401.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <35999.195.55.244.106.1164965401.squirrel@www.arcoscom.com>
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
To: linux@arcoscom.com
Cc: netfilter@lists.netfilter.org

What I did in a similar problem was to create more than one routing
table and then choose the routing table on the mangle:
# Adicionando a rota de sa=EDda da embratel na tabela 4
ip route add table 4 default via 5.5.5.1 dev eth0
ip rule add fwmark 4 table 4
iptables -t mangle -A PREROUTING -p tcp --dport msnp -j MARK --set-mark 4

Regards,
Victor

On 12/1/06, ArcosCom Linux User <linux@arcoscom.com> wrote:
> Hi, I'm using:
>   iptables 1.3.5 (FC5 distro with ROUTE target enabled)
>   kernel 2.6.19
>   pom-ng 20061129
>
> My box is a dual xeon machine (SMP kernel).
>
> I'm using 2 uplinks to connect my network to internet and its working
> fine, but some disconnection isues using messenger (amsn, gaim, m$msn,
> msn-messenger, etc...) needs I route all -p tcp --dport msnp over one
> uplink.
>
> To solve this problem, I want to try -j ROUTE target, to route all msnp
> traffic only for one uplink (I don't know if this will solve the problem,
> but I want to try). For this purpose, I wrote:
>
> iptables -t mangle -A PREROUTING -p tcp --dport msnp -j ROUTE --gw
> <uplink> --continue
>
> The error is:
> iptables: Unknown error 4294967295
>
> In dmesg:
> ipt_ROUTE: targinfosize 0 !=3D 40
>
> Any help about this?
>
> Thanks
>
>
>

