From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: sending packet in round robin...
Date: Sat, 12 Mar 2005 22:09:59 +0100
Message-ID: <27913.5843077258$1110661805@news.gmane.org>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49B70@knowledge.wizdom.nu>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49B70@knowledge.wizdom.nu>
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

Hi,

that what you would like to do is called link aggregation ( IMHO ).... =
here
is a link that explains how to make this:
http://linux-ip.net/html/ether-bonding.html

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Sietse van =
Zanen
Sent: Samstag, 12. M=E4rz 2005 22:01
To: netfilter@lists.netfilter.org
Subject: RE: sending packet in round robin...

No you can not.

What you are aiming at is some sort of load balancing / nic teaming.=20
Your switch should also support this, preferably.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of M. A. Imam
Sent: Saturday, March 12, 2005 7:39 PM
To: netfilter@lists.netfilter.org
Subject: sending packet in round robin...

Hello list,

Can anyone tell me if i can route packets from two interfaces in Round
Robin=20
fashion.

here is the scenario. i have two linux machines with two ethernet cards
each.=20
i do an ftp from machine1(client) to request a file from
machine2(server). i=20
can do this on either links separately. what i want is to that machine2
when=20
sends an ftp packet, it send it in around robin fashion. that is it
sends one=20
packet from one interface and the second packet from the second
interface.How=20
can i achieve this.

Can i use two default routes... or may some kind of iptables...

appreciate an early response

Muhammad A Imam





