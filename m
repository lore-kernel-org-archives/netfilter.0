From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 10:35:43 +0000
Message-ID: <20050309103543.GU4657@metastasis.org.uk>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<1110359242.7542.7.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
In-Reply-To: <1110359242.7542.7.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wed, Mar 09, 2005 at 10:07:22AM +0100, Jose Maria Lopez Hernandez wrote:
> El mi=E9, 09-03-2005 a las 07:25 +0100, Sebastian Docktor escribi=F3:

> > I want to allow a Dynamic DNS Client to Access the SSH-Server on my
> > Firewall. But I don't want to open SSH for all IPs, Is it possible
> > that iptables always looks up the ip address from the hostname, so
> > that only the ip has access which is registrated under the dyndns?
>=20
> I don't understand your problem. If you know your IP you can block
> based on that IP.

The OP's problem is that the DNS will stay the same, say
hostname.dyndns.net, but that the IP address associated with that name
will change.  So as soon as the IP address changes, his rulebase is out
of date.

> DNS, dynamic or not, has nothing to do with that.  Just everytime you
> change your IP use the scripts used to to that to update the iptables
> rules, it can be even done if you are using DHCP to get the IP.

This means the rulebase administrator has to know when the IP address
changes and has to be able to run the script to deal with that change.
And if the change is to *their* IP address, that means they can no
longer access their firewall host.

Sebastian, I'd suggest two solutions, the easy one is to run your
firewall script every minute, or two minutes, or five minutes, whatever
suits.  That way your firewall will look up the IP address for the
hostname and change its rulebase accordingly.

The harder but more elegant solution is to write a script in your
favourite programming language that does the following:

look up IP address for hostname.dyndns.net
write that IP address to a file
start an infinite loop here
wait for a period of time
look up IP address for hostname.dyndns.net
if the IP address matches that in the file, do nothing
otherwise do the following:
     - write the new IP address to a file
     - run the firewall script again
go back to the beginning of the infinite loop

And seeing as its sshd, watch hosts.allow and your sshd_config as well.

--=20
http://www.bash.org/?quote=3D29355


