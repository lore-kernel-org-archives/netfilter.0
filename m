From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IP tracking
Date: 04 May 2003 01:22:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052004121.25876.27.camel@elendil.intranet.cartel-securite.net>
References: <20030503180002.30563.49757.Mailman@kashyyyk>
	 <025501c311a5$ad236580$6400a8c0@S>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <025501c311a5$ad236580$6400a8c0@S>
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
To: Hannu Sehm <hannus@heth.org>
Cc: netfilter@lists.netfilter.org

Le sam 03/05/2003 =E0 20:56, Hannu Sehm a =E9crit :
> I need to track MAC and IP addresses of incoming traffic. And I need to
> forward these parameters to an other program for tracking issues. Can I=
 do
> this with netfilter/iptables?

Spot packets in INPUT chain with mac match and source IP match. Then, if
you only need parameters, but no action on packet, you can use ULOG
target :

	http://gnumonks.org/projects/project_details?p_id=3D1

You can write your own "listener" and have it listen to ulog socket.

Or you can send packet to userland using QUEUE target, treat it with
your own application and maybe reinject it. You can find sample code at
:

	http://gnumonks.org/projects/project_details?p_id=3D3
	http://gnumonks.org/projects/project_details?p_id=3D2

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

