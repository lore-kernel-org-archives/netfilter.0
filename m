From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FTP and Masquerading
Date: Sun, 11 Jun 2006 12:15:57 +0200
Message-ID: <448BED5D.8010306@plouf.fr.eu.org>
References: <7e53eda20606110123v3b45c520g384338a877affcb0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7e53eda20606110123v3b45c520g384338a877affcb0@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hello,

Syed AbuBakr a =E9crit :
> I am  new to linux and need some guidance.

http://www.netfilter.org/documentation/index.html#documentation-howto

> PROBLEM:
> FTP is not working. My internal users can not connect external ftp and
> vice versa.

See the NAT HOWTO section, =A7 "7. Special Protocols".
Try to load the FTP connection tracking and NAT helper modules :
# modprobe ip_conntrack_ftp
# modprobe ip_nat_ftp

If it still does not work, you'll have to give more details.
What exactly in FTP does not work and how do you see it does not work ?
- Establish a control connection ?
- Download files (including directory listing) ?
- Upload files ?
- Passive mode, active mode ?
Are you internal users set up explicitly to use the proxy for FTP ?

> SCENARIO:
> 1. I am using SQUID for proxy services.

Which services ? HTTP only or also FTP ?

> 2. OS is FedoraCore 5
> 3. Using transparent proxy

Squid will do transparent proxy only for HTTP, so that should not=20
concern FTP.

> 4. Masquerading my out bound traffic.
> 5. All packages including kernel are same as they come with the
> standard distro of FC-5
> 6. Install time Firewall is disabled, so i have only a couple of rules
> in my ip tables.

Which rules ? You can list them with the command 'iptables-save'.

> I dont know how to recompile kernel or insert modules, So please do me
> a favour and give me a step by step how to of it.

Hopefully you don't need to recompile anything. And there is no step by=20
step procedure unless you give *full* information about your setup.

