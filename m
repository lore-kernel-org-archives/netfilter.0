From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: question about iptables log
Date: Tue, 4 Feb 2003 10:48:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302041048.17924.netfilter@newkirk.us>
References: <F152rVp85cWQyhb86m100003bc1@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F152rVp85cWQyhb86m100003bc1@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>, netfilter@lists.netfilter.org

On Tuesday 04 February 2003 04:38 am, SB CH wrote:
> Hello, all.
>
> When I see my iptables log, I found curious log like this.
> What's the meaning and how can I understand ?
>
> Thanks in advance.
>
> Feb  4 18:20:22 server kernel: [DROP] : IN=3Deth0 OUT=3D
> MAC=3D00:07:e8:03:a2:19:01:00:fd:08:c4:a0:08:00 SRC=3D144.59.12.19
> DST=3D192.168.0.3 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D126 ID=3D61588 =
PROTO=3DICMP
> TYPE=3D3 CODE=3D13 [SRC=3D192.168.0.3 DST=3D144.59.26.61 LEN=3D48 TOS=3D=
0x00
> PREC=3D0x00 TTL=3D61 ID=3D12004 PROTO=3DTCP INCOMPLETE [8 bytes] ]
>
> ps : TYPE 3 CODE=3D13 menas "Communication Administratively Prohibited"


The source of this ICMP message is 144.59.12.19, in reference to a TCP=20
packet it apparently received from 192.168.0.3.  Since the source of the=20
original TCP packet, and the destination of the ICMP msg, are a private=20
IP, I have to assume that the scenario is this:

192.168.0.3 tried to communicate with 144.59.12.19, and that dest=20
received an incomplete TCP packet, only 40 bits long.

If netfilter performed a reverseSNAT on the communication to send it to=20
192.168.0.3 then there must have been an established connection in=20
place. (unless you DNAT to 192.168.0.3?  Even then I don't think it=20
would NAT the source IP referenced in the message)

If you have a lot of these, see if the source IP (144.59.12.19) of the=20
messages is the same.  If so, and this is ongoing, try logging=20
connections _TO_ that IP in postrouting. If your box is performing SNAT=20
(and not DNATting to 192.168.0.3) see if they all reference 192.168.0.3. =
=20
If so, try logging connections _FROM_ that IP in prerouting, and check=20
the box itself.  (maybe look for a worm...)

j


