From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 18:59:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048849173.1476.62.camel@vincentlim>
References: <3E83FC78.7080801@ms.sapientia.ro>
	 <1048840079.1236.45.camel@vincentlim>  <3E841938.3050708@ms.sapientia.ro>
	 <1048846747.1476.57.camel@vincentlim>
	 <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Budai Laszlo <lbudai@ms.sapientia.ro>, netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-03-28 at 18:43, Cedric Blancher wrote:
> Le ven 28/03/2003 =E0 11:19, Vincent Lim a =E9crit :
> > RELATED is for the ftp-data connection that is established after initial
> > connection attempt.
>=20
> To be precise, RELATED is only for the packet that initiates ftp-data
> connection. Following ones will be ESTABLISHED.
>=20
> A RELATED packet is similar to a NEW one, except that conntrack was
> waiting for him.

The below excerpt is taken from this url:
http://www.linuxsecurity.com/resource_files/firewalls/IPTables-Tutorial
/iptables-tutorial.html#STATEMACHINE
(url is wrapped)

RELATED
<snipped beginning>
..that it is RELATED. Some good examples of connections that can be
considered as RELATED are the FTP-data connections that are considered
RELATED to the FTP control port, and the DCC connections issued through
IRC. This could be used to allow ICMP replies, FTP transfers and DCC's
to work properly through the firewall. Do note that most TCP protocols
and some UDP protocols that rely on this mechanism are quite complex and
send connection information within the payload of the TCP or UDP data
segments, and hence require special helper modules to be correctly
understood.

So, initially..the replying packets need to match the ESTABLISHED?
(I'm asking this because Budai's initial rules only had RELATED and his
ftp wasn't working)

Then after establishing the RELATED ftp-data, subsequent packets match
the ESTABLISHED again?

--=20
Vincent Lim <vincent.lim@nestac.com>
NESTAC Solution Sdn Bhd


