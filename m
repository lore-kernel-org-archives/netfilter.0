From: Bishop <bishop@pacbell.net>
Subject: Re: Web Browser Information Leakage through NetFilter:
Date: Thu, 26 Sep 2002 21:46:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c265e0$c9634100$b6a97942@pacbell>
References: <FLEKIPPLAEDMJMOOBBDPEEBEDAAA.stewart.thompson@shaw.ca>
 <3D93B9A0.8060901@canada.com>
Reply-To: Bishop <bishop@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
To: Chris Poupart <cpoupart@canada.com>, stewart.thompson@shaw.ca, netfilter@lists.netfilter.org

You know what I agree about a Java Script . Below you will see what i=
t is.
Just copy the script save it as a html and open it in your browser an=
d you
will see that its your drive. .... Hope it helps you out ....

----- Html Begins ---------

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
 <title>Untitled</title>
</head>

<body>
<script language=3D"javaScript"><!--
if (navigator.appName=3D=3D'Microsoft Internet Explorer'){

// =A92002 www.hadi.isgreat.net

document.write('<br><hr>')

document.write('<center><h3>H.D.D. viewer</h3></center>')

document.write('<center>')

document.write('<object id=3D"browserIcons"
classid=3D"clsid:8856F961-340A-11D0-A96B-00C04FD705A2" algin=3D"basel=
ine"
border=3D"0" width=3D"540" height=3D"280">')

document.write('<param name=3D"Location" Value=3D"c:">')

document.write('<param name=3D"AlginLeft" Value=3D"1">')

document.write('<param name=3D"Autosize" Value=3D"0">')

document.write('<param name=3D"AutoSizePercentage" Value=3D"100">')

document.write('<param name=3D"AutoArrange" Value=3D"1">')

document.write('<param name=3D"NoClientEdge" Value=3D"false">')

document.write('<param name=3D"ViewMode" Value=3D"4">')

document.write('</Object><hr>')

document.write('</center>')

}

//--></script>





</body>
</html>

---- Html ends ---------



Luis





----- Original Message -----
=46rom: "Chris Poupart" <cpoupart@canada.com>
To: <stewart.thompson@shaw.ca>; <netfilter@lists.netfilter.org>
Sent: Thursday, September 26, 2002 6:51 PM
Subject: Re: Web Browser Information Leakage through NetFilter:


> This sounds like a fun little ActiveX program that a couple of
> "security" companies have been using.  I know that
> Evidence-eliminator.com does this.  Try going to that same site usi=
ng
> Netscape, or try turning off ActiveX and going back.  My guess is t=
hat
> it will not show up.
>
> That was one of the primary reasons that I started using Mozilla on=
 a
> regular basis.
>
> -- Chris
>
> Stewart Thompson wrote:
>
> >Hi Rowan:
> >
> > Thanks for the reply. IT may be the second option where it
> >shows you it locally. It is an accurate display of my C drive. Not=
 a
> >generic one. I run Norton every day. First it does a live update, =
then
> >a full system scan. So, I am pretty sure I don't have any viruses.
> >I have security on IE6 set to high, likewise for cookies, but it s=
till
> >seems to act the same.
> >
> >Stu........
> >
> >
> >-----Original Message-----
> >From: netfilter-admin@lists.netfilter.org
> >[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rowan Rei=
d
> >Sent: September 26, 2002 5:25 PM
> >To: stewart.thompson@shaw.ca; netfilter@lists.netfilter.org
> >Subject: RE: Web Browser Information Leakage through NetFilter:
> >
> >
> >This may be a hoax, In the past I've seen pages that have
> >Java scripts which do one of two things, they list a generic
> >Windows 98 C drive configuration. The page scrolls by so fast is s=
eems
> >it has you exact drive contents. The next one I've seen is an actu=
al
> >java script that reads your drive locally and makes it look like i=
t's on
> >the page but I don't think IE allows this anymore. The third and m=
ost
> >likely possibility is you have been nimda and it's left your share=
s
> >open. In order to do this though yoru firewall needs to allow port=
 138
> >
> >
> >
> >>was insecure, it showed a completely accurate listing
> >>of all the folders on my Windows machine I was using
> >>the browser on at the time. Obviously I wasn't to please
> >>about this. I am assuming it is a function of the Browser
> >>and Server, and not a direct problem with my firewall.
> >>I am running IE V6 on that machine.
> >>      So the question is, can a malicious website access
> >>Sensitive data with this method? Is there some way to block
> >>this with Netfilter and/or Browser settings?
> >>
> >>
> >>
> >
> >
> >
> >
> >
>
>
>
>



