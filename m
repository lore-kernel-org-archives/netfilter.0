From: "Jason Pappas" <jpappas@sharemedia.com>
Subject: Re: Too scared....
Date: Tue, 11 Jun 2002 10:50:57 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000c01c21157$68d85470$6400780a@win.pappasfamily.net>
References: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
Cc: netfilter@lists.samba.org

There's really nothing wrong with this, however....  You could end up
locking yourself out of your firewall with this too.  Instead of doing a
shutdown on the system... Why don't you flush your ruleset...  You don't
take down the entire system because one rule got messed up.  Just from my
personal preference, I don't like to reboot systems unless I have to.  It
seems too microsoftish.

Example

#!/bin/sh
# Start of script

# Various commands

# End of firewall commands

sleep 60
iptables -F <your chains here>
----- Original Message -----
From: "Roberto Campos" <roberto@meuprovedor.com.br>
To: "'Tony Earnshaw'" <tonni@billy.demon.nl>
Cc: <netfilter@lists.samba.org>
Sent: Tuesday, June 11, 2002 7:25 AM
Subject: RES: Too scared....


> Hi,
>
> What i do is to place, at the bottom of my firewall script, few more
> lines like this:
>
> ----------- (start of script)
> ...
> ... (various commands)
>
> echo "Finished"
>
> sleep 120
>
> shutdown -r now
>
> ------------ (end of script)
>
> Once I see the finished echoed I kill (ctrl-C) the ongoing program.
>
> ---> For the gurus out there:
>
> Is there a problem on doing that?
>
> It has never let me down so far.
>
> Hope it helps.
>
> Rgds,
>
> Roberto Campos
> _______________________________________________________________
> Meu  Provedor Tecnologias e Informatica ltda.
> Rua Camerino, 128 Gr. 302 - Centro
> Rio de Janeiro - RJ - CEP 20080-010
> Tel.: 21 - 25181011     Fax: 21 - 25181911
>
> -----Mensagem original-----
> De: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] Em nome de Tony Earnshaw
> Enviada em: ter=E7a-feira, 11 de junho de 2002 06:40
> Para: Kjetil Kjernsmo
> Cc: netfilter@lists.samba.org
> Assunto: Re: Too scared....
>
> man, 2002-06-10 kl. 22:07 skrev Kjetil Kjernsmo:
>
> > I hope someone can take my paw and help me through the iptables setup,
>
> > because I'm a bit scared of the possibility of locking myself out of
> my
> > box...
>
> Den som intet v=E5ger, intet vinner :c)
>
> Do it.
>
> 1: Make sure that you have a cron/at job running that kills and restarts
> your firewall scripts at intervals known to you. If you only have a
> minimum of services, they are patched up to the last version and all is
> more or less safe, then a ten-minute gap now and then can't hurt until
> your routine is established;
>
> 2: If you're using ssh (which you are) to get to the machine, and since
> no-one can see what you're doing, cut out ftp and use scp - which also
> goes to port 22 and is *much* safer and better;
>
> 3: In your firewall script, build in a rule that only lets in your IP
> number - or, even better, if your admin machine uses Ethernet for the
> connection, your MAC number.
>
> I've done all this out of Utrecht in Holland to a slave DNS name server
> in Dortmund, Germany, including weekly scp backups and goodness knows
> what else. I had no possibility of getting to that machine, once it was
> placed, and everything worked perfectly for months - never ever went
> wrong.
>
> Just leave yourself a back door, if you need it, until you've gained the
> confidence you need.
>
> Best,
>
> Tonni
>
> Sogning
>
> --
>
> Tony Earnshaw
>
> e-post: tonni@billy.demon.nl
> www: http://www.billy.demon.nl
> gpg public key: http://www.billy.demon.nl/tonni.armor
>
> Telefoon: (+31) (0)172 530428
> Mobiel: (+31) (0)6 51153356
>
> GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
> 3BE7B981
>
>
>
>
>
>


