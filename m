From: Jason Opperisano <opie@817west.com>
Subject: Re: howto stop this packet
Date: Fri, 14 Jan 2005 09:11:20 -0500
Message-ID: <1105711880.3661.7.camel@hubcap.ljm.dom>
References: <20050114051726.D6E3E66F@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114051726.D6E3E66F@mail.817west.com>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Fri, 2005-01-14 at 00:22, jqb@markor.net wrote:
> netfilter=EF=BC=81
>     howto stop this packet on iptables firewall;
> tcpdump capture packet example:
> 10:35:31.881722 IP 218.6.45.6.51755 > 228.71.74.201.7777: S 1432831257:=
1432831257(0) win 16384 <mss 1460,nop,nop,sackOK>
>=20
> 10:35:36.214120 IP 219.147.192.18.1272 > 228.71.74.201.7777: S 490321:4=
90321(0) win 6400 <mss 1460,nop,nop,sackOK>

  iptables -I INPUT -p tcp --syn -s 218.6.45.6 -d 228.71.74.201 \
    --dport 7777 -j DROP

or maybe:

  iptables -I FORWARD -p tcp --syn -s 218.6.45.6 -d 228.71.74.201 \
    --dport 7777 -j DROP

-j

--
"Beer. Now there's a temporary solution."
	--The Simpsons


