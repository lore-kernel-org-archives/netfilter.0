From: Glenn Hancock <ghancock@softeksoftware.com>
Subject: Re: iptables question
Date: 14 Aug 2003 02:53:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060844036.2080.0.camel@localhost.localdomain>
References: <Pine.LNX.4.44.0308141100450.31438-100000@localhost>
Reply-To: ghancock@softeksoftware.com
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MEVyeX05vmtABKTvse/D"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0308141100450.31438-100000@localhost>
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


--=-MEVyeX05vmtABKTvse/D
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Chris,

Thanks to you and to the other gentleman.  That fixed me and seems to be
working perfectly.

Thanks,

Glenn

On Thu, 2003-08-14 at 06:17, Chris Wilson wrote:

> Hi Glenn,
> 
> > I have my rules setup the way I would guess they should be based on 5
> > tutorials, 1 book and the man pages.  However, I still can't seem to get
> > the thing to do what I want.  Could someone please help me?
> > 
> > I will make this very simple:
> > 1)  I want to allow all incoming requests to port 80
> > 2) I want to allow all outgoing requests .... period.
> > 
> > I want to drop all other incoming requests not addressed to port 80.
> 
> Did you see Rob Sterenborg's response to your previous post? The ruleset 
> which you sent didn't appear to be complete. You also don't mention if the 
> machine you're running the firewall on is the same one that's running the 
> web server, and that you're trying to make outgoing requests from. 
> Assuming that it is, the following rules should work:
> 
>   iptables -F
>   iptables -P INPUT DROP
>   iptables -P OUTPUT ACCEPT
>   iptables -P FORWARD DROP
>   iptables -A INPUT -m state --state established -j ACCEPT
>   iptables -A INPUT -i lo -j ACCEPT
>   iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> 
> If, on the other hand, you have another network behind your Linux box, and 
> machines on that network need to get through the Linux box to the 
> Internet, then you will need the following additional rules:
> 
>   iptables -A FORWARD -i <internal-interface> -o <external-interface> \
> 	-j ACCEPT
>   iptables -A FORWARD -m state --state established -j ACCEPT
> 
> and if the internal machines have private IP addresses:
> 
>   iptables -t nat -A POSTROUTING -o <external-interface> -j MASQUERADE
> 
> By the way, I don't like my first impression of your challenge-response
> spam filter. You might want to try SpamAssassin, it's much less intrusive 
> to people trying to e-mail you.
> 
> Cheers, Chris.

-- 
Glenn Hancock
SofTek Software International, Inc.
813 Pavilion Court
T: 678-583-5720
I: ghancock@softeksoftware.com
www.softeksoftware.com
www.Spambite.com
NOTE: My email address is currently protected by Spambite. If
you send me an email, you will be asked to validate your email
address on the Spambite network AND re-send you original email
to me. Or, you can pro-actively register your email address on
the Spambite network by visiting the website:
www.spambite.com
When visiting the website, please feel free to look around to
learn about this exciting new technology.

--=-MEVyeX05vmtABKTvse/D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.7">
</HEAD>
<BODY>
Chris,<BR>
<BR>
Thanks to you and to the other gentleman.&nbsp; That fixed me and seems to be working perfectly.<BR>
<BR>
Thanks,<BR>
<BR>
Glenn<BR>
<BR>
On Thu, 2003-08-14 at 06:17, Chris Wilson wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>Hi Glenn,

&gt; I have my rules setup the way I would guess they should be based on 5
&gt; tutorials, 1 book and the man pages.  However, I still can't seem to get
&gt; the thing to do what I want.  Could someone please help me?
&gt; 
&gt; I will make this very simple:
&gt; 1)  I want to allow all incoming requests to port 80
&gt; 2) I want to allow all outgoing requests .... period.
&gt; 
&gt; I want to drop all other incoming requests not addressed to port 80.

Did you see Rob Sterenborg's response to your previous post? The ruleset 
which you sent didn't appear to be complete. You also don't mention if the 
machine you're running the firewall on is the same one that's running the 
web server, and that you're trying to make outgoing requests from. 
Assuming that it is, the following rules should work:

  iptables -F
  iptables -P INPUT DROP
  iptables -P OUTPUT ACCEPT
  iptables -P FORWARD DROP
  iptables -A INPUT -m state --state established -j ACCEPT
  iptables -A INPUT -i lo -j ACCEPT
  iptables -A INPUT -p tcp --dport 80 -j ACCEPT

If, on the other hand, you have another network behind your Linux box, and 
machines on that network need to get through the Linux box to the 
Internet, then you will need the following additional rules:

  iptables -A FORWARD -i &lt;internal-interface&gt; -o &lt;external-interface&gt; \
	-j ACCEPT
  iptables -A FORWARD -m state --state established -j ACCEPT

and if the internal machines have private IP addresses:

  iptables -t nat -A POSTROUTING -o &lt;external-interface&gt; -j MASQUERADE

By the way, I don't like my first impression of your challenge-response
spam filter. You might want to try SpamAssassin, it's much less intrusive 
to people trying to e-mail you.

Cheers, Chris.</I></FONT></PRE>
</BLOCKQUOTE>
<PRE><TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Glenn Hancock
SofTek Software International, Inc.
813 Pavilion Court
T: 678-583-5720
I: ghancock@softeksoftware.com
www.softeksoftware.com
www.Spambite.com
NOTE: My email address is currently protected by Spambite. If
you send me an email, you will be asked to validate your email
address on the Spambite network AND re-send you original email
to me. Or, you can pro-actively register your email address on
the Spambite network by visiting the website:
www.spambite.com
When visiting the website, please feel free to look around to
learn about this exciting new technology.</PRE>
</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-MEVyeX05vmtABKTvse/D--


