From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Universal Address Translation
Date: Sat, 24 Jul 2004 19:15:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090689346.2228.94.camel@anduril.intranet.cartel-securite.net>
References: <200407242032.35573.rio@martin.mu>
	 <1090676859.2228.62.camel@anduril.intranet.cartel-securite.net>
	 <200407242055.51714.rio@martin.mu>
	 <1090687880.2228.83.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090687880.2228.83.camel@anduril.intranet.cartel-securite.net>
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
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

And one thing I forgot... I didn't solve IP addresses collisions (two
clients can have the same IP), but here are some ideas. You have to
isolate clients one from any other.

On wired network, it's what Cisco calls Private VLAN settings : a given
ethernet port is only allowed to speak to gateway's port. Only the
gateway can see all ports.

On wireless network, you have to forbid frames bridging between clients.
At Cisco's, they call this PSPF (Publicly Secure Packet Forwarding). If
you use hostap[1] driver, you just have to set related sysctl entry
(don't remember name, but it's self explanary) to 0 and you're done.

-- 
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

