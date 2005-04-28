From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: iptables mac destination filtering
Date: Thu, 28 Apr 2005 07:10:18 -0400
Message-ID: <876ef97a0504280410210fc94e@mail.gmail.com>
References: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
	<20050428095710.GA7741@l01.thnet>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050428095710.GA7741@l01.thnet>
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
To: netfilter <netfilter@lists.netfilter.org>

On 4/28/05, Michael Tautschnig <michael.tautschnig@zt-consulting.com> wrote=
:
> Could you please explain, why one would do that? IMHO the only possible u=
se is
> an interface in promiscous mode.

Not really. I know of a project that wanted this functionality in
order to be able to determine if the next hop was terminal, and if so,
do some IDS scanning on it. This was in the context of AODV-assembled
wireless LANs.

--
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

