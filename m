From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Slightly delayed dns response packets getting delayed - how to handle them?
Date: Thu, 22 Apr 2004 15:26:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F46@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: ste@smxy.org, netfilter@lists.netfilter.org

Shaun T. Erickson wrote:
> I have an RH9 system with three nics: 1 WAN & 2 LANs. One lan is
> really locked down - the only thing allowed into it are responses to
> traffic initiated frm that lan.
>=20
> The DNS server is on the other LAN. I'm seeing occaisional dns packets
> being blocked from entering the locked down LAN. My assumption,
> correct or not, is that these are slightly delayed packets that are
> arriving after the state has been torn down, and they are thus
> blocked. I see something like 30 or so of these every 8 hours or so.
>=20
> Is this something people see a lot? If so, what is the best way to dal
> with it?

If you're using a POM patched kernel, you could change the timeout
values of:
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream
These are measured in seconds.

The actual reason for taking so long between responses is strange
though. You can't really stop these packets from happening though.
Another way to handle them is to not log the packets and feel
comfortably numb. If you really want to be anal about it, you may want
to ethereal the interface and analyze the packets that're generating the
problem.=20

