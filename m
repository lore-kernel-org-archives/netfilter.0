From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT a range of  ports to another range of portts
Date: Mon, 25 Nov 2002 09:09:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211250909.03520.netfilter@newkirk.us>
References: <A4C806B83AC1974E8A2AC21267B922D62D27DC@exchange.int.ngi.be>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A4C806B83AC1974E8A2AC21267B922D62D27DC@exchange.int.ngi.be>
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
To: jrw@ngi.be, netfilter@lists.netfilter.org

On Monday 25 November 2002 07:44 am, jrw@ngi.be wrote:
> Hi all
> I want to DNAT a connection to range of ports to another server but the=
re
> with others ports

> This rule will nat with the same range of ports
> ${IPTABLES} -t nat -I PREROUTING -p TCP -i $INET_IFACE -s 0/0 -d $INET_=
IP
> --dport $START_PORT:$END_PORT -j DNAT --to $APPL_IP
>
> I'm able to dnat for a range of port to the same range, but how could I
> change it?
> Is it possible?

You should be able to use "-j DNAT --to $APPL_IP:$DSTART-$DEND"

and DNAT to the range of ports from DSTART to DEND.=20

j

