From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: SMTP Redirect - 'This is it'...
Date: Sat, 5 Aug 2006 15:45:45 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127F5@knowledge.wizdom.nu>
References: <44D46A61.10606@bowenvale.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Don Gould <don@bowenvale.co.nz>, netfilter@lists.netfilter.org

Assuming eth0 is the NIC that your internal clients connect to and that =
it has IP 192.168.1.1:
=20
REDIRECT or NAT any traffic coming into eth0 on port 25 to your =
firewall:
iptables -t nat -A PREROUTING -i eth0 p tcp --dport 25 -j DNAT --to =
192.168.1.1:25
ALLOW the connections to your firewall:
iptables -t filter -A INPUT -i eth0 -p tcp -d 192.168.1.1 --dport 25 -j =
ACCEPT
=20
This should take care of redirecting port 25 traffic to your firewall. =
Configuration of your smtp server is outside scope of this mailing list.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Don Gould
Sent: Sat 05-Aug-06 11:52
To: netfilter@lists.netfilter.org
Subject: SMTP Redirect - 'This is it'...



Hi,

Is there a way to fool the mail client into thinking that a call to
'smtp.someonelse.whateva.com' is my local server?

I have people visiting my network with laptops.

Getting mail off their POP server is no problem.

Sending mail is a problem as my up stream provider blocks links....

So I want my server on my network to intercept the call on port 25 for a
remote smtp server and then just lie to the laptop.

This gives me the advantage of not having to reconfigure the users
machine when they leave my network.

Cheers Don
--
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz -
www.bowenvale.co.nz - www.hearingbooks.co.nz - SkypeMe:  =
ThinkDesignPrint





