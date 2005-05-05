From: "Robert Becskei" <brobiwbe@stcable.co.yu>
Subject: Re: Iptables, php , realtime bandwidth usage
Date: Thu, 5 May 2005 14:00:14 +0200
Message-ID: <001a01c55169$ff137b90$1701a8c0@info2000256>
References: <000e01c5515e$b0b62570$1701a8c0@info2000256>
	<1115291894.21073.4.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="utf-8"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

 thank you for the fast response, I've tried ntop already, its to much fo=
r=20
this thing.

 I would only like to see that user_a(b,c,d,e,f,g...etc) is currently=20
downloading and uploading at kbyte/s (not really important if not possibl=
e=20
in realtime)

 it would be nice to see via a webpage that what is actualy happening on =
a=20
per user basis, without even logging anything.

 Sincerely
 Robert B

----- Original Message -----=20
From: "Jose Maria Lopez Hernandez" <jkerouac@bgsec.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, May 05, 2005 13:18
Subject: Re: Iptables, php , realtime bandwidth usage


El jue, 05-05-2005 a las 12:39 +0200, Robert Becskei escribi=C3=B3:
> Hello everyone,
>
>
>  I wonder if someone could help me find something similiar to this :
>
>  -can monitor bandwidthd usage in real time (php maybe...)
>
>  -if possible it could resolve ip address to dns name ? ( I have setup =
my=20
> own dynamicdns dhcp server combo )
>
>
>
>  I found a tool if someone would like to try it, but it is not a soluti=
on=20
> to my current problem.
>
>  http://web4.hm/index.php?http://web4.hm/html/webserver_root.html

Best think I know to monitor bandwidth is Ntop, but it's not realtime,
it's based in rrdtool so you have data each some minutes.

To monitor realtime bandwidth you could use pmacct in a Cacti script,
and watch the results graphically with a browser.

>  Sincerely
>  Robert B

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"




