From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: FTP/SSL
Date: Thu, 16 Oct 2003 11:40:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E6A@alderaan.smgtec.com>
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
To: "Sean E. Covel" <seanecovel@comcast.net>
Cc: NetFilter-List <netfilter@lists.netfilter.org>

SSL based protocols are designed to be resilient against
man-in-the-middle attacks. The firewall would be that man in the middle.

The only ways to solve your problems that I can see are:

1. Bite the bullet, open the ports
2. Force users to use Active mode FTP, so they open all those ports
instead of you
3. See if your SFTP server has an option to force users to use specific
ports. This may make opening the interfaces a little easier.
4. Put the SFTP server on your firewall. This is hardly ideal, but
better than the alternatives?
5. Offer regular FTP-through-VPN instead of SFTP

>So am I correct that the only option is to open a large chunk of ports
>so that the data connection can be established?  This seems like 2
steps
>forward and 1 step back!


