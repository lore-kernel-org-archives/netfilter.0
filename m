From: Eddahbi Karim <installation_fault_association@yahoo.fr>
Subject: RE: How iptables know when an UDP connection is closed ?
Date: Fri, 26 Dec 2003 19:38:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072463937.3743.6.camel@gamux>
References: <200312251927.hBPJRiTS000145@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312251927.hBPJRiTS000145@server5.bandwidthco.com>
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

Le jeu 25/12/2003 =E0 20:27, Mark E. Donaldson a =E9crit :
> Correct.  The UDP state machine is based on "timers".=20

Ok, so I've another question.
Can Iptables make a difference between packets of the real application
and a packet generator ?

For example :

X communicates with Y with the application Mooh-1.0 which sends UDP
packets via the port 789 and receives packets from the port 987.

Then Z sends UDP packets to X with a packet generator. The UDP packets
sended have the same dport and sport.

Can Iptables make a difference between "Mooh-1.0" and the packet
generator to avoid flood ?

--=20
--=20
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France


