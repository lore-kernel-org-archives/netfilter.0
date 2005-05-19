From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 10, Issue 55
Date: Thu, 19 May 2005 10:19:27 +0400
Message-ID: <9927912d0505182319751fde16@mail.gmail.com>
References: <428c120d.0348edab.6531.ffff81edSMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428c120d.0348edab.6531.ffff81edSMTPIN_ADDED@mx.gmail.com>
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
To: netfilter@lists.netfilter.org

> On Wed, May 18, 2005 at 10:22:20AM +0400, Visham Ramsurrun wrote:
> > Also, I wanted to know if connection tracking still works for a TCP
> > connection where the SYN packet passes through stateful firewall FW1,
> > the SYN/ACK packet passes through stateful firewall FW2, the ACK
> > passes again through FW1 and the first data packet passes through FW2.
> > Is the connection considered as ESTABLISHED at that point on both
> > firewalls?
>=20
> absolutely not.


What if I don't use the conntrack helper module for TCP and I use the
default connection tracking mechanism of ip_conntrack. Then I'm sure
it has to work.

Just wasn't sure abt the TCP conntrack helper module..

Many thx for the reply...

Best regards,
Visham

