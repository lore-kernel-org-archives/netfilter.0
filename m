From: "Benjamin RIOU" <pandolphe@pandolphe-vision.net>
Subject: Re: libipt_time.so
Date: Fri, 4 May 2007 21:03:21 +0200
Message-ID: <28c01a080705041203p74de7f41la760c91bae059c7b@mail.gmail.com>
References: <683717.39696.qm@web26303.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=TyaDhQcSVmlmhZDbyQa+yTSw/Ru3335ve64ksfLwn31pkbvsA3aHLPgX2TozJzE6i1/ilzRxD1dJh0B77s2fRB9uvgMtBV8n4nFK8g9XfTnoTXEE2WqNGLyCmGtb39LVZbQvE3IZJEXplza7vLIjY6xqIEz7sgTDhC0pUAGnElI=
In-Reply-To: <683717.39696.qm@web26303.mail.ukl.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Le 04/05/07, Darmoul Ramzi<dardiration@yahoo.fr> a =E9crit :
> I use Fedora 6
> i try to use ipatables -time but i have a problem libipt_time.so.
>
> please help me i peapare a QoS project
>
> Best Regards
>
> Darmoul Ramzi
>
Hi.

this module is'nt in the kernel by default.
You have to download the patch o matic and patch your kernel in order
to have this fonction added.

As I think you're French, I explained how to do in french (i'm unable
to do that in english :D)

++
Ben

Salut,


Le module n'est pas pr=E9sent dans le noyau par d=E9faut.
Tu dois :
 t=E9l=E9charger patch-o-matic sur le site netfilter,

1) R=E9cup=E9rer une archive r=E9cente du patch-o-matic-ng dans
<http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/> (pas ceux qui
font 46 octets, ils sont vides).
2) D=E9compresser l'archive.
3) Ex=E9cuter "./runme --download" pour t=E9l=E9charger le patch conlimit.
4) Ex=E9cuter "./runme connlimit" pour appliquer le patch connlimit aux
sources du noyau.
5) Configurer le noyau pour activer la correspondance connlimit en dur
ou en module.
6) Compiler et installer le noyau.

Je suis dessus en ce moment d'ailleurs.

++
Ben
 patcher les sources de ton noyau,
 recompiler ton noyau.

Si tu veux pas t'embeter, il reste CRON pour modifier tes regles...

