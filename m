From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Re(3): Making this list more readable
Date: Wed, 8 Jan 2003 18:02:44 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFCF211CF9.23DB3D05-ON88256CA9.000AF47D-88256CA9.000B3CB7@deepwoods.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_mixed 000B3CB088256CA9_="
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
To: Athan <netfilter@miggy.org>
Cc: Ian Batterbee <ian.batterbee@aut.ac.nz>, netfilter@lists.netfilter.org

--=_mixed 000B3CB088256CA9_=
Content-Type: multipart/alternative; boundary="=_alternative 000B3CB088256CA9_="


--=_alternative 000B3CB088256CA9_=
Content-Type: text/plain; charset="us-ascii"

Thanks, Athan...

I try to get it in digest so I can read it all at once at the end of the 
day.  When I was getting it message-by-message, I was finding messages 
getting lost in my voracious spam-killing mode.  I'm trying to learn 
iptables by watching how you experts help other folks' questions.

Question:  Would anybody be interested in a more user-friendly web-based 
solution for this list, so people could go back and read old threads 
instead of posing the same questions over 'n' over again?  I've got a free 
one available to me, if you'd like to try it.

--Carol Anne 
Carol Anne Ogdin
http://www.net-working.com
530/295-3657
Deep Woods Technology, Inc.
http://www.deepwoods.com
CAOgdin@deepwoods.com
Leveraging technology to restore the soul of the organization





Athan <netfilter@miggy.org>
01/08/2003 05:27 PM

 
        To:     Ian Batterbee <ian.batterbee@aut.ac.nz>
        cc:     netfilter@lists.netfilter.org, Athan <netfilter@miggy.org>, Carol Anne 
Ogdin <caogdin@deepwoods.com>
        Subject:        Re: Subject: Re: Making this list more readable





On Thu, Jan 09, 2003 at 12:37:32PM +1300, Ian Batterbee wrote:
> I see the problem as well.. I think it's caused by the fact that many of 

> the individual messages in the  are content-transfer-encoding: 
> quoted-printable, but the digest has no content-transfer-encoding in the 

> header, so the quoted-printable data inside the messages included in the 

> digest is treated as plain text and incorrectly formatted.
> 
> If we know that ALL messages contained in the digest are 
> quoted-printable, then it would just be a matter of changing the 
> content-type of the digest, but I've noticed the problem doesn't occur 
> on all messages.. some are fine.. so...  I guess people's mailers are 
> simply posting as quoted-printable, and the digest process is just 
> including the message body as-is

  Having checked and found this list is run with mailman, and then
checked the options for a list I have admin access to the solution is to
just make the digests 'plain' rather than 'mime'.  I presume the former
means you get one big file in mbox style, which may cause some people
problems too I guess.  This list is mailman 2.0.11, the one I checked is
2.0.12, so there's not going to be any extra options in this list's
config for it.

  Of course you could just read it in normal mode rather than digest ;).

-Ath
-- 
- Athanasius = Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
                    "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME



--=_alternative 000B3CB088256CA9_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Thanks, Athan...</font>
<br>
<br><font size=2 face="sans-serif">I try to get it in digest so I can read it all at once at the end of the day. &nbsp;When I was getting it message-by-message, I was finding messages getting lost in my voracious spam-killing mode. &nbsp;I'm trying to learn iptables by watching how you experts help other folks' questions.</font>
<br>
<br><font size=2 face="sans-serif">Question: &nbsp;Would anybody be interested in a more user-friendly web-based solution for this list, so people could go back and read old threads instead of posing the same questions over 'n' over again? &nbsp;I've got a free one available to me, if you'd like to try it.</font>
<br><font size=2 face="sans-serif"><br>
</font><font size=3 face="Times New Roman">--Carol Anne </font>
<table>
<tr>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>Carol Anne Ogdin</b></font>
<td bgcolor=#ffffdd><a href="http://www.net-working.com/"><font size=3 color=blue face="Times New Roman"><b><u>http://www.net-working.com</u></b></font></a>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>530/295-3657</b></font>
<tr>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>Deep Woods Technology, Inc.</b></font>
<td bgcolor=#ffffdd><a href=http://www.deepwoods.com/><font size=3 color=blue face="Times New Roman"><b><u>http://www.deepwoods.com</u></b></font></a>
<td bgcolor=#ffffdd><font size=3 face="Times New Roman"><b>CAOgdin@deepwoods.com</b></font>
<tr>
<td colspan=3 bgcolor=#ffffdd><font size=3 face="Times New Roman">Leveraging technology to restore the soul of the organization</font></table>
<br>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td>
<td><font size=1 face="sans-serif"><b>Athan &lt;netfilter@miggy.org&gt;</b></font>
<p><font size=1 face="sans-serif">01/08/2003 05:27 PM</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To: &nbsp; &nbsp; &nbsp; &nbsp;Ian Batterbee &lt;ian.batterbee@aut.ac.nz&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc: &nbsp; &nbsp; &nbsp; &nbsp;netfilter@lists.netfilter.org, Athan &lt;netfilter@miggy.org&gt;, Carol Anne Ogdin &lt;caogdin@deepwoods.com&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject: &nbsp; &nbsp; &nbsp; &nbsp;Re: Subject: Re: Making this list more readable</font></table>
<br>
<table>
<tr valign=top>
<td>
<td></table>
<br>
<br>
<p><font size=2 face="Courier New">On Thu, Jan 09, 2003 at 12:37:32PM +1300, Ian Batterbee wrote:<br>
&gt; I see the problem as well.. I think it's caused by the fact that many of <br>
&gt; the individual messages in the &nbsp;are content-transfer-encoding: <br>
&gt; quoted-printable, but the digest has no content-transfer-encoding in the <br>
&gt; header, so the quoted-printable data inside the messages included in the <br>
&gt; digest is treated as plain text and incorrectly formatted.<br>
&gt; <br>
&gt; If we know that ALL messages contained in the digest are <br>
&gt; quoted-printable, then it would just be a matter of changing the <br>
&gt; content-type of the digest, but I've noticed the problem doesn't occur <br>
&gt; on all messages.. some are fine.. so... &nbsp;I guess people's mailers are <br>
&gt; simply posting as quoted-printable, and the digest process is just <br>
&gt; including the message body as-is<br>
<br>
 &nbsp;Having checked and found this list is run with mailman, and then<br>
checked the options for a list I have admin access to the solution is to<br>
just make the digests 'plain' rather than 'mime'. &nbsp;I presume the former<br>
means you get one big file in mbox style, which may cause some people<br>
problems too I guess. &nbsp;This list is mailman 2.0.11, the one I checked is<br>
2.0.12, so there's not going to be any extra options in this list's<br>
config for it.<br>
<br>
 &nbsp;Of course you could just read it in normal mode rather than digest ;).<br>
<br>
-Ath<br>
-- <br>
- Athanasius = Athanasius(at)miggy.org / http://www.miggy.org/<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Finger athan(at)fysh.org for PGP key<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;And it's me who is my enemy. Me who beats me up.<br>
Me who makes the monsters. Me who strips my confidence.&quot; Paula Cole - ME<br>
</font>
<br>
<br>
--=_alternative 000B3CB088256CA9_=--

--=_mixed 000B3CB088256CA9_=
Content-Type: application/octet-stream; name="attorsoj.dat"
Content-Disposition: attachment; filename="attorsoj.dat"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjAuNiAoR05V
L0xpbnV4KQ0KQ29tbWVudDogRm9yIGluZm8gc2VlIGh0dHA6Ly93d3cuZ251cGcub3JnDQoNCmlF
WUVBUkVDQUFZRkFqNGMwQVVBQ2drUXpiYytJNVhmeEtkaml3Q2ZmMFQ3RzFNYUM5OUhsSTNaSG53
RE94NDANCms3Z0Ftd2F5OFBIOE5MVnBUNnNXYld5elhTTkxaNm16DQo9N21XWg0KLS0tLS1FTkQg
UEdQIFNJR05BVFVSRS0tLS0tDQo=
--=_mixed 000B3CB088256CA9_=--

