From: "Couchet J (Jorge)" <jorge.j.couchet@SHURU.SHELL.com>
Subject: LOG target and de-SNAT
Date: Thu, 26 Sep 2002 19:41:30 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AB711091BCDBD51199B80060943F1A3C472F9F@MVOS001>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello All,

I have two questions about Netfilter:

1) The first, perhaps isn=B4t 100% Netfilter, but is related. How do =
you
disable that the text log appear in the active tty when you use the LOG
target? (the text log appear in the active tty -with the an user in the
system or not- and in the message file, and I only want the text in the
message file).

2) Which is the specific place/time where the de-SNAT is done? The SNAT =
is
done in the POSTROUTING chain (in the nat table), and the de-SNAT =
where? How
do I catch the packet before the de-SNAT operation is carried out??.

Thanks in advance for your help.

Kind regards,

Jorge.


=20
Este mensaje es confidencial. Puede contener informacion amparada por =
el
secreto comercial. Si usted ha recibido este e-mail por error, por =
favor
comuniquenoslo via e-mail y tenga la amabilidad de eliminarlo de su =
sistema
; no debera copiar el mensaje ni divulgar su contenido a ninguna =
persona.
Muchas gracias.=20
 =20
This message is confidential. It may also contain information that is
privileged or not authorized to be disclosed. If you have received it =
by
mistake please let us know by e-mail inmediately and delete it from =
your
system. You should also not copy the message nor disclose its contents =
to
anyone. Many thanks.

