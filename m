From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Block clients for mac address
Date: Wed, 12 Feb 2003 18:16:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302121816.38077.netfilter@newkirk.us>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV5MKAAAAQAAAAzY+/7SPK+EejvgTLR+/cPQEAAAAA@prodigy.net.mx>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAFXnZnPTWmEuxnKJINDeV5MKAAAAQAAAAzY+/7SPK+EejvgTLR+/cPQEAAAAA@prodigy.net.mx>
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
To: Juan Carlos Hernandez Gonzalez <acuario1965@prodigy.net.mx>, netfilter@lists.netfilter.org

On Wednesday 12 February 2003 01:37 pm, Juan Carlos Hernandez Gonzalez=20
wrote:
> Hi list:
>
> I have a linux red hat and need configure my iptables for permit only
> mac address of clients .. some know how make this .. Thanks

Try using the mac match.  something like:

/sbin/iptables -A FORWARD -m mac --mac-source 00:02:E3:11:C2:46 -j ACCEPT

This will only work properly if the clients are on a local ethernet to=20
you.

j


