From: Zacky <nospam2day@gmail.com>
Subject: Advice on setting up a firewall for a Windows Domain Controller
Date: Wed, 12 Oct 2005 10:04:09 -0700
Message-ID: <531442a50510121004i2229579fv8bb1cae2cd1b456a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

I was asked to set up a firewall for a Win2K domain controller, which
also acts as a print server, web server and SQL server... Last year, I
was assigned a similar project but never got around to work on it.
However, I did some research on the topic and I was directed to this
KB article that lists the ports I have to open for the DC to work
behind the firewall:

http://support.microsoft.com/kb/179442/

While I have set up firewalls in the past, I'm not very familiar with
Windows networks and I would like to hear your opinions on how to go
about setting up the firewall.

  Here's some info about the network. The DC and all the 25 Windows XP
desktops that connect to the DC have public IP addresses, but only the
DC has a FQDN. The requirement is to keep the desktops' public IP
addresses and just move the DC behind the firewall.

Again, any tips will be greatly appreciated.
Thanks,
-G

