From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FTP Redirect IP:Port
Date: Thu, 08 Jan 2004 09:05:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073549109.767.19.camel@elendil.intranet.cartel-securite.net>
References: <01a101c3d5b5$d35fe5a0$63000a0a@pooh>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01a101c3d5b5$d35fe5a0$63000a0a@pooh>
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
To: John Paul <john@pinoylinux.sytes.net>
Cc: netfilter@lists.netfilter.org

Le jeu 08/01/2004 =E0 08:05, John Paul a =E9crit :
> I want to redirect FTP access from my BOX to other machine. How can i
> make this possible?
> external IP ---> 202.x.x.x port 21 (redirect) ---> 192.168.0.10 port21
> I have tried:
> iptables -A PREROUTING -p tcp -d 202.x.x.x --dport 21 -j DNAT --to
> 192.168.0.10:21
> this seems to be not working. what could it be?

There's a typo here : you did not specify you're working on nat table.

	iptables -t nat -A PREROUTING -p tcp -d 202.x.x.x --dport 21 \
		-j DNAT --to 192.168.0.10:21

Then you have to check IP forwarding is OK and FORWARD filtering rules
are letting this trafic go through. Finally, for FTP needs a helper, you
have to check that ip_nat_ftp module is loaded.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

