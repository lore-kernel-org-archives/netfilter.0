From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: How iptables know when an UDP connection is closed ?
Date: Fri, 26 Dec 2003 13:41:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312262141.hBQLfSTS011481@server5.bandwidthco.com>
References: <1072463937.3743.6.camel@gamux>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072463937.3743.6.camel@gamux>
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
To: 'Eddahbi Karim' <installation_fault_association@yahoo.fr>, netfilter@lists.netfilter.org

Netfilter/IPTables works at layers three & four of the OSI model - not =
at
layer seven.  So, if I understand your question correctly, the answer =
would
be NO, because it knows nothing about what is happening above layer =
four.
However, if you have an application that is programmed to always use the
same use the same source & destination ports for it's socket channels, =
then
this could be defined as such within an iptables rule as an application =
an
handled accordingly. It would not be able to distinguish them from =
similar
crafted packets though.  Having said that, the "limit match is available =
to
handle packet "flooding" as you describe it here. Basically, you have
entered the realm of what an IDS/IPS, such as Snort, do best.  A Snort
preprocessor could well handle this activity.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Eddahbi Karim
Sent: Friday, December 26, 2003 10:39 AM
To: netfilter@lists.netfilter.org
Subject: RE: How iptables know when an UDP connection is closed ?

Le jeu 25/12/2003 =E0 20:27, Mark E. Donaldson a =E9crit :
> Correct.  The UDP state machine is based on "timers".=20

Ok, so I've another question.
Can Iptables make a difference between packets of the real application =
and a
packet generator ?

For example :

X communicates with Y with the application Mooh-1.0 which sends UDP =
packets
via the port 789 and receives packets from the port 987.

Then Z sends UDP packets to X with a packet generator. The UDP packets
sended have the same dport and sport.

Can Iptables make a difference between "Mooh-1.0" and the packet =
generator
to avoid flood ?

--
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France




