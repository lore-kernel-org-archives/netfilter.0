From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 11:04:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679349@alderaan.smgtec.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, =?iso-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?= <dcardenosa@cac.retecal.es>
Cc: netfilter@lists.netfilter.org

John A. Sullivan III wrote:
> I do not believe that is necessarily true.  I'm not the expert but I
> believe that if all you want is inbound access, connection tracking
> will take care of the source alteration.  You would only need SNAT if
> you wanted to originate outbound packets with the altered source.=20
> Someone please correct me if I am wrong - John   =20

If the default route does not route back through the Linux server, you =
are required to SNAT the packet back to thye firewall's address =
basically forcing the respondee to keep the firewall in-the-loop so to =
speak. Netfilter will NOT allow a one way stream into the system since =
the second packet sent by the client (ACK) is marked as INVALID by the =
state machine since it never received a SYNACK in response to the =
initial packet.


