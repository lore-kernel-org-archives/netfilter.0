From: Gustav Svensson <gurra16@spray.se>
Subject: Control outbound access on a per-application level
Date: Wed, 2 Oct 2002 15:46:01 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033569217024171@spray.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Caramail_0241711033569217_ID"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Caramail_0241711033569217_ID
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is it possible to set "outbound" rules based on what binary application it is that
wants to access the Internet?
Just like what I'm used to when I run win32. In every firewall application there, I
get a message when some program is trying to access the internet. Then I can decide
whether to procede the action, or block it. On Linux I see nothing like this.
I'm having a concern with the RealPlayer. I would like to block it to reach any other
addresses but those to my favourite stations.
Sure, I could set up a rule for the port that RealPlayer is supposed to use, but what
guarantee do I have that it isn't capable of using some other port, like 80 for example?
Assume it does use the port 80. Then it would be imposible to stop without a rule like
mentioned here. Because I would want Galeon to have access to any address on port 80,
so I have to leave it wide open. It would be better if I could allow this privilege to
Galeon only, not to any program that uses port 80. Is this feasible, if so how?

Gustav
______________________________________________________
H=E4r b=F6rjar internet! 
Skaffa gratis e-mail och internet p=E5 Spray http://www.spray.se


--=_NextPart_Caramail_0241711033569217_ID--


