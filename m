From: Thierry ITTY <thierry.itty@besancon.org>
Subject: netfilter access control
Date: Thu, 06 Jun 2002 08:06:48
Sender: netfilter-admin@lists.samba.org
Message-ID: <3.0.1.16.20020606080648.252f8bd0@s-net-04.besancon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

Hello

I'm currently using squid with an ncsa_auth module so that any employee who
wants to surf the 'net has to identify himself as a person, no matter which
machine he's on. Doing so only http,https,http/ftp protocols are supported.

Now I need to open wider access with irc, realvideo, and other that very
important things ;-) and of course I think of netfilter/iptables, which I'm
used to by the way.

So I'd appreciate any advice which would help me setting up some kind of
signature system (preferably with a browser) allowing a given user (not a
machine) to go out (I don't need protocol specific permissions) for the
time of a session...

tia
			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE

