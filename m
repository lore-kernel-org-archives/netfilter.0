From: "Anderson, Ray" <rsa@prideindustries.com>
Subject: RE: Time changes
Date: Thu, 23 Oct 2003 07:22:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9FEBBE3B5C27D311B0B90050041E59B00439EFAF@ziggy.prideindustries.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_6Il5KrbxM9zimaZh/szlzw)"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: firewalldude@newkirk.us, sbisgaard@xtrasource.com
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Boundary_(ID_6Il5KrbxM9zimaZh/szlzw)
Content-type: text/plain

Just a side note, if the kid isn't savvy today he will be tomorrow, and
could change the ip address of his machine.

If you have other machines and allow your internal class C to get out, you
could restrict the kid's machine by mac address matching, as it is a little
harder to forge.  Not impossible, but harder than changing an IP address.

Just my $.02.

-=Ray
---------------------------------------
[Inexperienced] pilots are really blind in the air for the first couple of
months.
Colonel Erich "Bubi" Hartmann, GAF, World's Leading Ace, Luftwaffe, WWII,
352 Victories


> -----Original Message-----
> From: Joel Newkirk [mailto:firewalldude@newkirk.us] 
> Sent: Wednesday, October 22, 2003 5:35 PM
> To: sbisgaard@xtrasource.com
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Time changes
> 
> 
> On Wed, 2003-10-22 at 15:44, Steffen Bisgaard - Xtrasource wrote:
> > Hallo list,
> >  
> > A quick question: Is it possible to block access to and 
> from a PC (say
> > 10.2.0.3) at a specific time, for example 21:00, and re-enable it at
> > 08:00 the next day using iptables - and if so how?? Yes this is the
> > kids PC...
> > It used to be real simple with ipfw - I can't remember the 
> syntax but
> > something along the lines of ipfw -add (or -remove) deny (or allow)
> > 10.2.0.3 all
> >  
> > Any ideas? Or do I need two separate iptables scripts?
> 
> Not full scripts.  Try creating two cron jobs - one running 
> at 21:00 the
> other at 08:00.  One is just:
> iptables -I FORWARD 1 -s 10.2.0.3 -j REJECT
> the other
> iptables -D FORWARD -s 10.2.0.3 -j REJECT
> 
> j
> 
> 
> 

--Boundary_(ID_6Il5KrbxM9zimaZh/szlzw)
Content-type: text/html
Content-transfer-encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2657.73">
<TITLE>RE: Time changes</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Just a side note, if the kid isn't savvy today he =
will be tomorrow, and could change the ip address of his =
machine.</FONT>
</P>

<P><FONT SIZE=3D2>If you have other machines and allow your internal =
class C to get out, you could restrict the kid's machine by mac address =
matching, as it is a little harder to forge.&nbsp; Not impossible, but =
harder than changing an IP address.</FONT></P>

<P><FONT SIZE=3D2>Just my $.02.</FONT>
</P>

<P><FONT SIZE=3D2>-=3DRay</FONT>
<BR><FONT SIZE=3D2>---------------------------------------</FONT>
<BR><FONT SIZE=3D2>[Inexperienced] pilots are really blind in the air =
for the first couple of months.</FONT>
<BR><FONT SIZE=3D2>Colonel Erich &quot;Bubi&quot; Hartmann, GAF, =
World's Leading Ace, Luftwaffe, WWII, 352 Victories</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Joel Newkirk [<A =
HREF=3D"mailto:firewalldude@newkirk.us">mailto:firewalldude@newkirk.us</=
A>] </FONT>
<BR><FONT SIZE=3D2>&gt; Sent: Wednesday, October 22, 2003 5:35 =
PM</FONT>
<BR><FONT SIZE=3D2>&gt; To: sbisgaard@xtrasource.com</FONT>
<BR><FONT SIZE=3D2>&gt; Cc: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>&gt; Subject: Re: Time changes</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; On Wed, 2003-10-22 at 15:44, Steffen Bisgaard - =
Xtrasource wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Hallo list,</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; A quick question: Is it possible to block =
access to and </FONT>
<BR><FONT SIZE=3D2>&gt; from a PC (say</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 10.2.0.3) at a specific time, for example =
21:00, and re-enable it at</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 08:00 the next day using iptables - and if =
so how?? Yes this is the</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; kids PC...</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; It used to be real simple with ipfw - I =
can't remember the </FONT>
<BR><FONT SIZE=3D2>&gt; syntax but</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; something along the lines of ipfw -add (or =
-remove) deny (or allow)</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 10.2.0.3 all</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Any ideas? Or do I need two separate =
iptables scripts?</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Not full scripts.&nbsp; Try creating two cron =
jobs - one running </FONT>
<BR><FONT SIZE=3D2>&gt; at 21:00 the</FONT>
<BR><FONT SIZE=3D2>&gt; other at 08:00.&nbsp; One is just:</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -I FORWARD 1 -s 10.2.0.3 -j =
REJECT</FONT>
<BR><FONT SIZE=3D2>&gt; the other</FONT>
<BR><FONT SIZE=3D2>&gt; iptables -D FORWARD -s 10.2.0.3 -j =
REJECT</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; j</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
</P>

</BODY>
</HTML>=

--Boundary_(ID_6Il5KrbxM9zimaZh/szlzw)--

