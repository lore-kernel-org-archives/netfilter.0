From: Kai Weber <kai.weber@glorybox.de>
Subject: Re: What is missed for port forwarding
Date: Sun, 7 Mar 2004 16:49:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040307154907.GA1978@glorybox.de>
References: <20040306183657.GB836@glorybox.de> <200403061847.28569.Antony@Soft-Solutions.co.uk> <20040307094013.GA3156@glorybox.de> <200403070953.52863.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403070953.52863.Antony@Soft-Solutions.co.uk>
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

* Antony Stone <Antony@Soft-Solutions.co.uk>:

> Are you testing both SSH/10143 and HTTP/8888 from the same client machine=
 out=20
> on the Internet?

Thanks for the tip. It works from outside. I tested only from "inside".

Why does DNAT not work when trying from inside?  The webserver is on
192.168.1.2. The DNAT and MASQUERADE rules have no specific source and
destination interfaces defined. When I try from outside the port
forwarding does work. Connecting from a PC inside trying with the
outside address does not. I do not unterstand this behaviour. What
document should I read?

-- =20
  Kai Weber
=BB kai.weber@glorybox.de   http://www.glorybox.de   gpg-key: 0x594D4132

