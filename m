From: Jonathan Humphrey <jhumphrey@codemasters.com>
Subject: RE: Today's Brain Teaser.
Date: Wed, 12 Mar 2003 09:20:38 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4D613EBFB75BD6118A5B00508BEEC62C0111CBC1@JESS>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2E878.574506BA"
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2E878.574506BA
Content-Type: text/plain

As a company we have two t1's (greedy i know!)

the aaa.aaa.aaa.aaa address range is the external address's for one T1
xxx.xxx.xxx.xxx is the address range for the other T1

Does that make sense!

-----Original Message-----
From: Raymond Leach [mailto:raymondl@knowledgefactory.co.za]
Sent: 12 March 2003 09:09
To: Netfilter Mailing List
Subject: Re: Today's Brain Teaser.


On Wed, 2003-03-12 at 10:35, Jonathan Humphrey wrote:
> I've been struggling with this one for some time, i am currently at
> the end of my teather so if anyone has any great ideas about why this
> happens let me know.
>  
> Basically, i have a linux server that has three interfaces;
>  
>     eth1          aaa.aaa.aaa.202        External Facing network
>     eth0          bbb.bbb.bbb.254        Internal protected network
>     eth1:0       aaa.aaa.aaa.197        External IP Address for
> FTPServer
>  
> I have a device that sits on xxx.xxx.xxx.5 that cannot get to any
> service on aaa.aaa.aaa.197, however every other ip address i have
> tried can.  I suspect that if i release the real ip address of
> aaa.aaa.aaa.197 then everyone reading this list could too.
>  
> And it's on the .5 address, if i try from xxx.xxx.xxx.15 i can
> connect.
Where is xxx.xxx.xxx.5? Is it on the internal or external network?

>  
> Nothing is being show as dropped in the logs either.    
>  
> Thanks,
>  
> Jonathan Humphrey
>  
> 
> **********************************************************************
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the system manager.
> 
> This footnote also confirms that this email message has been swept by
> MIMEsweeper for the presence of computer viruses.
> 
> **********************************************************************

------_=_NextPart_001_01C2E878.574506BA
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2656.60">
<TITLE>RE: Today's Brain Teaser.</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>As a company we have two t1's (greedy i know!)</FONT>
</P>

<P><FONT SIZE=3D2>the aaa.aaa.aaa.aaa address range is the external =
address's for one T1</FONT>
<BR><FONT SIZE=3D2>xxx.xxx.xxx.xxx is the address range for the other =
T1</FONT>
</P>

<P><FONT SIZE=3D2>Does that make sense!</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Raymond Leach [<A =
HREF=3D"mailto:raymondl@knowledgefactory.co.za">mailto:raymondl@knowledg=
efactory.co.za</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: 12 March 2003 09:09</FONT>
<BR><FONT SIZE=3D2>To: Netfilter Mailing List</FONT>
<BR><FONT SIZE=3D2>Subject: Re: Today's Brain Teaser.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>On Wed, 2003-03-12 at 10:35, Jonathan Humphrey =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; I've been struggling with this one for some =
time, i am currently at</FONT>
<BR><FONT SIZE=3D2>&gt; the end of my teather so if anyone has any =
great ideas about why this</FONT>
<BR><FONT SIZE=3D2>&gt; happens let me know.</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; Basically, i have a linux server that has three =
interfaces;</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
eth1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
aaa.aaa.aaa.202&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; External =
Facing network</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
eth0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
bbb.bbb.bbb.254&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internal =
protected network</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp;&nbsp; =
eth1:0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
aaa.aaa.aaa.197&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; External IP =
Address for</FONT>
<BR><FONT SIZE=3D2>&gt; FTPServer</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; I have a device that sits on xxx.xxx.xxx.5 that =
cannot get to any</FONT>
<BR><FONT SIZE=3D2>&gt; service on aaa.aaa.aaa.197, however every other =
ip address i have</FONT>
<BR><FONT SIZE=3D2>&gt; tried can.&nbsp; I suspect that if i release =
the real ip address of</FONT>
<BR><FONT SIZE=3D2>&gt; aaa.aaa.aaa.197 then everyone reading this list =
could too.</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; And it's on the .5 address, if i try from =
xxx.xxx.xxx.15 i can</FONT>
<BR><FONT SIZE=3D2>&gt; connect.</FONT>
<BR><FONT SIZE=3D2>Where is xxx.xxx.xxx.5? Is it on the internal or =
external network?</FONT>
</P>

<P><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; Nothing is being show as dropped in the logs =
either.&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; Thanks,</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; Jonathan Humphrey</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; =
**********************************************************************</=
FONT>
<BR><FONT SIZE=3D2>&gt; This email and any files transmitted with it =
are confidential and</FONT>
<BR><FONT SIZE=3D2>&gt; intended solely for the use of the individual =
or entity to whom they</FONT>
<BR><FONT SIZE=3D2>&gt; are addressed. If you have received this email =
in error please notify</FONT>
<BR><FONT SIZE=3D2>&gt; the system manager.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; This footnote also confirms that this email =
message has been swept by</FONT>
<BR><FONT SIZE=3D2>&gt; MIMEsweeper for the presence of computer =
viruses.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; =
**********************************************************************</=
FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2E878.574506BA--

