From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DMZ Scenario
Date: Thu, 14 Nov 2002 20:29:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211142029.57679.netfilter@newkirk.us>
References: <000c01c28c3e$ab3603a0$64dc0a0a@i>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c28c3e$ab3603a0$64dc0a0a@i>
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
To: Ryan Beisner <ryanb@thedataarc.com>, netfilter@lists.netfilter.org

On Thursday 14 November 2002 07:33 pm, Ryan Beisner wrote:
> Hi
>
> I have successfully installed a mail + web server in my new dmz, filter=
ed
> by netfilter in Redhat 7.3.  My problem is, the request addresses show =
up
> as the dmz interface's ip address (of the packet filter box).  This

> $ipt -A PREROUTING -t nat -d $PRESext -j DNAT --to $PRESdmz
> $ipt -A POSTROUTING -t nat -d $PRESdmz -j SNAT --to $PRESext

> $ipt -A PREROUTING -t nat -d $KEYext -j DNAT --to $KEYdmz
> $ipt -A POSTROUTING -t nat -d $KEYdmz -j SNAT --to $KEYext

Drop the SNAT rules.  In the PRE you take anything coming in the 'real' I=
P and=20
change it's destination to the dmz IP.  But in the POST you take those sa=
me=20
packets and change their source to the real IP.  If you drop the POST rul=
es,=20
then the packets will just pass on to $PRESdmz with their (presumably) re=
al=20
source IP intact.

j

