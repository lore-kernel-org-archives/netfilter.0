From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables and DNS
Date: Tue, 4 Jun 2002 13:28:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604172816.GV29214@cannon.eng.us.uu.net>
References: <scfc8dba.094@pzsj-office.pzs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <scfc8dba.094@pzsj-office.pzs.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Brian Ugie <bugie@pzs.com>
Cc: netfilter@lists.samba.org

On Tue, Jun 04, 2002 at 09:51:31AM -0700, Brian Ugie wrote:

> Hi,
>=20
>   I am hoping that someone can explain the role that DNS has in
> relation to iptables and if there is a way to stop iptables from
> resolving.=20
>=20
>   I have a network where a netscreen firewall sits in front or our
> servers. We map public IPs to the servers and do initial port filtering
> from the netscreen. We also want to have each machine filter just in
> case the windows box gets compromised ;). It has seemed to me that
> iptables will not first use /etc/hosts to resolve but will go straight
> to the DNS server. Is this a valid statement?

No. gethostbyaddr would go through the preference list in nsswitch.conf.
This is part of a library and iptables uses it. #include <netdb.h>

> nsswitch.conf lists file
> first. Since DNS will resolve the server to a public address but it is
> actually on a private address, iptables get confused and the net result
> is long delays on ssh and ftp logins and server time outs on DNS
> queries.=20

Do you have "hosts:  files dns" in your nsswitch.conf and have the
correct setup in /etc/hosts?

>=20
>   To test my theory I set the DNS record to the private ip and that
> worked like a champ. I feel that I am left with only the option to
> create views in bind.
>=20
>   Has anyone else out there seen this or know of a better solution?=20

You can also provide "-n" to the iptables command to avoid names:

man iptables:
...
       -n, --numeric
              Numeric output.  IP addresses and port numbers will
              be printed in numeric format.  By default, the pro=AD
              gram  will  try to display them as host names, net=AD
              work names, or services (whenever applicable).
...

Ramin

>=20
> Thanks in advance,
>=20
> Brian

