From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Preferred way of preserving firewall rules on system reboots?
Date: Thu, 13 May 2004 11:44:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131144.15574.Alistair@nerdnet.ca>
References: <40A38ABF.4090907@pbl.ca> <1084460291.1771.183.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084460291.1771.183.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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

On May 13, 2004 10:58 am, Cedric Blancher wrote:
> Le jeu 13/05/2004 =E0 16:48, Aleksandar Milivojevic a =E9crit :
> > What is your preferred way of preserving firewall configuration on
> > firewall reboots?  I know this is probably distribution specific.
>
> Every time I need to save the ruleset :
>
> 	iptables-save > /etc/firewall
>
> Then, in a startup script (/etc/init.d/networking on my Debian), I add :
>
> 	iptables-restore < /etc/firewall

	I've modified my scripts, in the 'shutdown' routines it rotates the last 7=
=20
saved files and then saves the current with iptables-save,=20
	startup calls the most recent file by default ... If I manually modify the
	firewall I can call the save function with init.d script, and it DOESN'T=20
overwrite the current config, it rotates the files.

	Just *my* two cents worth


	Alistair

