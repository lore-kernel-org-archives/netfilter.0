From: =?us-ascii?Q?Account_fur_Maillinglisten?= <mailinglists@dmsb.de>
Subject: AW: a NAT question
Date: Thu, 15 Jul 2004 13:26:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A89E0296B649C4AAFD251222B1492906C4FD8@dmsbsrv1.intranet.dmsb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Payal Rathod <payalrathod@gmail.com>, netfilter <netfilter@lists.netfilter.org>

> Hi,
> We have been allocated 2 more IPs by our ISP for a period of 1 month
> for our purpose. Now these 2 IPs will be assigned to 2 Windows
> machines which are to be accessed from outside. We want port 21 or one
> machine to be accessed from outside and port 80 and 9001, 25 of other
> machine. Which is the best way to allow access to these machines from
> outside still having them under my firewall? I thought of having ip
> aliases on the Linux box and forwarding the connections to the
> respective windows box.
> Can someone explain an easy way for this?
> With warm regards,
> -Payal

Hi Payal,

you should go fort hat issue. Add virtual interfaces to your linuxbox,
assign them the ip-addresses and create some forwarding-rules for your
required ports=20

# virtual alias on your interface. check man ifconfig and alter my=20
# statements for your needs eq replace x.x.x.x with the correct values
ifconfig eth0:1 x.x.x.x
# This creates a duplicate interface of eth0 with a different ip-address

# (x.x.x.x). To remove one, simply put it down with ifconfig eth0:1 down

After that you've got an interface where you can bind your
forwardingrules to.

hth
-fe

