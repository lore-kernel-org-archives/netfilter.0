From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: loadbalancing for firewall
Date: Tue, 12 Aug 2003 08:58:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3634@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?J=E9r=F4me_GAUTHIER?= <JGAUTHIER@sqli.com>, netfilter@lists.netfilter.org

Have you looked at the Linux Virtual Server?

http://www.linuxvirtualserver.org/


-----Original Message-----
From: J=E9r=F4me GAUTHIER [mailto:JGAUTHIER@sqli.com]=20
Sent: Tuesday, August 12, 2003 3:35 AM
To: 'netfilter@lists.netfilter.org'
Subject: loadbalancing for firewall

Hi,

first sorry for my english !!

I want to make a loadbalancing cluster of 2 firewall on redhat 8.0.

each firewall have 5 interface.
    -Lan interface
    -DMZ interface=20
    -External interface
    -RAS
    -semi-private

I use keepalived for manage vrrp.

Does keepalived can do loadbalancing ?? ( there is no realserver )
if yes, where find some sample configuration
if not, what product can i use ?

Thanks a lot !


Best Regards

jerome=20


