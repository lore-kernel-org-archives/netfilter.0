From: hclfm@pricol.co.in
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 10:41:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF756E6C6F.62479A21-ON65256E73.001C8B25@pricol.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
MIME-Version: 1.0
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

<P><FONT FACE=3D"Monospace,Courier">On Sat, 2004-04-10 at 20:54, Antony Sto=
ne wrote:<BR>&gt; Hi people.<BR>&gt;<BR>&gt; This is not strictly a netfilt=
er question, but I'm wondering if maybe someone<BR>&gt; can help or make a =
suggestion?<BR>&gt;<BR>&gt; I want to pick up a packet stream, but for an H=
TTPS connection, and using a<BR>&gt; standard packet sniffer like ethereal =
just gives me the encrypted SSLv3<BR>&gt; stuff, not the plaintext data whi=
ch I need to see.<BR>&gt;<BR>&gt; Can anyone think how I can see the conten=
t of packets from a browser running<BR>&gt; on my machine, which is posting=
 a form back to a remote server somewhere,<BR>&gt; using HTTPS?<BR>&gt;<BR>=
&gt; I can do anything I want on the client machine (and I can see the sour=
ce code<BR>&gt; of the form page too), however when I try sending what I th=
ink is the same<BR>&gt; data back to the server from a Perl program instead=
 of from my browser, the<BR>&gt; remote server complains at me (and not in =
a helpful way, either - it says<BR>&gt; &quot;500 Internal Server Error&quo=
t;).<BR>&gt;<BR>&gt; Any suggestions gratefully received :)<BR>&gt;<BR>&gt;=
 Regards,<BR>&gt;<BR>&gt; Antony.<BR></FONT></P><P><FONT FACE=3D"Monospace,=
Courier">Hi ,</FONT></P><P>&nbsp;</P><P><FONT FACE=3D"Monospace,Courier">I =
suggest to use ssldump tool. </FONT></P><P>http://www.rtfm.com/ssldump/</P>=
<P>regards,</P><P>U.SivaKumar..</P><P></P>=

