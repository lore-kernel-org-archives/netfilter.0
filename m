From: Frank Nijenhuis <f.nijenhuis@zx.nl>
Subject: Re: RES: Too scared....
Date: Tue, 11 Jun 2002 01:28:10 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020611012640.02784f18@mail.bos.nl>
References: <1023788396.2050.21.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.samba.org

we cat the date upon starting the firewall script to a file .buttsave :)
A cronjob runs every minute which checks for the .buttsave file, if it's=20
present, it will flush the firewall.
So, directly after running the firewall script we have to rm the .buttsave=
=20
file.
The cron is called savemybutt.sh ofcourse :)

Frank

At 08:25 AM 6/11/2002 -0300, you wrote:
>Hi,
>
>What i do is to place, at the bottom of my firewall script, few more
>lines like this:
>
>----------- (start of script)
>...
>... (various commands)
>
>echo "Finished"
>
>sleep 120
>
>shutdown -r now
>
>------------ (end of script)
>
>Once I see the finished echoed I kill (ctrl-C) the ongoing program.
>
>---> For the gurus out there:
>
>Is there a problem on doing that?
>
>It has never let me down so far.
>
>Hope it helps.
>
>Rgds,
>
>Roberto Campos
>_______________________________________________________________
>Meu  Provedor Tecnologias e Informatica ltda.
>Rua Camerino, 128 Gr. 302 - Centro
>Rio de Janeiro - RJ - CEP 20080-010
>Tel.: 21 - 25181011     Fax: 21 - 25181911
>
>-----Mensagem original-----
>De: netfilter-admin@lists.samba.org
>[mailto:netfilter-admin@lists.samba.org] Em nome de Tony Earnshaw
>Enviada em: ter=E7a-feira, 11 de junho de 2002 06:40
>Para: Kjetil Kjernsmo
>Cc: netfilter@lists.samba.org
>Assunto: Re: Too scared....
>
>man, 2002-06-10 kl. 22:07 skrev Kjetil Kjernsmo:
>
> > I hope someone can take my paw and help me through the iptables setup,
>
> > because I'm a bit scared of the possibility of locking myself out of
>my
> > box...
>
>Den som intet v=E5ger, intet vinner :c)
>
>Do it.
>
>1: Make sure that you have a cron/at job running that kills and restarts
>your firewall scripts at intervals known to you. If you only have a
>minimum of services, they are patched up to the last version and all is
>more or less safe, then a ten-minute gap now and then can't hurt until
>your routine is established;
>
>2: If you're using ssh (which you are) to get to the machine, and since
>no-one can see what you're doing, cut out ftp and use scp - which also
>goes to port 22 and is *much* safer and better;
>
>3: In your firewall script, build in a rule that only lets in your IP
>number - or, even better, if your admin machine uses Ethernet for the
>connection, your MAC number.
>
>I've done all this out of Utrecht in Holland to a slave DNS name server
>in Dortmund, Germany, including weekly scp backups and goodness knows
>what else. I had no possibility of getting to that machine, once it was
>placed, and everything worked perfectly for months - never ever went
>wrong.
>
>Just leave yourself a back door, if you need it, until you've gained the
>confidence you need.
>
>Best,
>
>Tonni
>
>Sogning
>
>--
>
>Tony Earnshaw
>
>e-post:         tonni@billy.demon.nl
>www:            http://www.billy.demon.nl
>gpg public key: http://www.billy.demon.nl/tonni.armor
>
>Telefoon:       (+31) (0)172 530428
>Mobiel:         (+31) (0)6 51153356
>
>GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
>3BE7B981


