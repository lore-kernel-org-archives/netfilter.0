From: Unknown <unknown@unknown.invalid>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 00:55:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39338.2292976186$1073800748@news.gmane.org>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com>
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
To: =?iso-8859-1?q?H=E5kan=20Engblom?= <cynic_0@hotmail.com>, netfilter@lists.netfilter.org

On January 10, 2004 06:20 pm, H=E5kan Engblom wrote:
> Hi,
>
> I've run in to a strange problem. I have a dhcp-server on a 2.4.22 kernel
> with a 1.2.8 iptables. The dhcp-server is configured only to offer
> IP-addresses to one single mac-address (it is a single host on a private
> network)
>
>
> Does anyone have a clue ?
>
> br H=E5kan Engblom
>
> Some "logs" :

	<relevant info snipped, since it has been through the list several times>

	Can I think out loud for a moment???

	have dhcpd listen on a *different* port than normal
	have iptables grab relevant mac address broadcasts and redirect to appropr=
iate port?

	drop anything not in relevant mac address range?

	Perhaps this might work???=20
	anyone care to try?? --my personal net is static ... thankgod its only 5 b=
oxen=20
=09
	Alistair Tonner

