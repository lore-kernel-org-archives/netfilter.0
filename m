From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 15:26:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c260f4$c5861260$0801a8c0@s3ac>
References: <20020920215417.UBMV295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20020920215417.UBMV295.mta06-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


> I think the problem is your physical network setup - you=20
> should not have a=20
> direct link between the internal and external interfaces of=20
> your firewall.


True, but shouldn't I be able to separate the networks using subnets
check out my setup below


Internal Net

DHCP assignes settings below also internet DNS

Network 192.168.1.0
Subnet  255.255.255.0
Gateway 192.168.1.1



Firewall=20

Internal Interface 192.168.1.1
Subnet             255.255.255.0
External Interface  **.**.76.66
Subnet             255.255.255.248 (ISP Assigned)
Internet Gateway    **.**.76.65


Since I'm cheap I don=92t want to purchase another hub, I have my T1,
connected to a hub with my Firewall extif, my VPN extif and the hub is
connected to my switch this allows my to access the net directly and
through the firewall from my station, this is for diagnostic purposes so
I don=92t have to play cable switcher.=20


