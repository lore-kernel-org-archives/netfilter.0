From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: netfiltering and ethernet bridging doesn't appear to work as
	advertised, help!
Date: Wed, 21 Jan 2004 14:20:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074691222.745.4.camel@elendil.intranet.cartel-securite.net>
References: <747032.1074683300483.JavaMail.root@newdil25>
	 <x7zncha3z2.fsf@speech.braille.uwo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <x7zncha3z2.fsf@speech.braille.uwo.ca>
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
To: Kirk Reiser <kirk@braille.uwo.ca>
Cc: netfilter@lists.netfilter.org

Le mer 21/01/2004 =E0 13:19, Kirk Reiser a =E9crit :
[...]
> iptables -A INPUT -s www.xxx.yyy.zzz -m mac --mac-source
> xx:xx:xx:xx:... -d 0/0 -j ACCEPT -v
> iptables -A INPUT -i $netaddress -s ! my-net-and-mask -d 0/0 -j ACCEPT
[...]

Bridge traffic appears within FORWARD chain only.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

