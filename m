From: caogdin@deepwoods.com
Subject: A Proper Syntax For iptables?
Date: Sun, 22 Sep 2002 07:54:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF999C1019.C1FE4849-ON88256C3C.004F0D1E-88256C3C.0051EED6@deepwoods.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0051EECE88256C3C_="
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
To: netfilter@lists.netfilter.org

This is a multipart message in MIME format.
--=_alternative 0051EECE88256C3C_=
Content-Type: text/plain; charset="us-ascii"

Like many other novices in this list, I've struggled with understanding 
iptables for several months.  Oskar Andreasson's tutorial has been a good 
guide...and, yet, I feel there's much I don't know about iptables works, 
so there's much of iptables/netfilter I'm not using.  Many people here 
have helped me develop my current (vague) understanding, but a successful 
software product (even an "open source" product) can't rely on one-on-one 
handholding with newbies to attract a following.

Is it important to Rusty and other experts in this forum, to see iptables 
more widely adopted?  It is important to see if we could lay plans for 
making iptables easier for people to adopt and use in the future.  If so, 
I've an idea, and I'll try to keep it brief, but I do want to present some 
background.

iptables--to my mind--implements a language of packet handling.  A 
language is defined by 1) syntax, 2) semantics, and 3) pragmatics.  The 
syntax represents the rules of how valid, meaningful statements in the 
language are made; syntax describes the meanings of those statements, and 
pragmatics are the rules of how special situations are handled (e.g., how 
one statement affects another, or how special variations on the syntax 
rules are built).

iptables appears to me to have a broad and ill-defined syntax (e.g., you 
can construct statements that are not meaningful), requires deep 
understanding of packets and routing to effectively apply (i.e., 
ill-defined semantics), and has a massive set of pragmatics (e.g., don't 
filter in PREROUTING or POSTROUTING chains, even though the syntax allows 
it).  That makes the language--and its underlying concepts--hard to 
master.  It also makes the code more complex, both as I read it, and as 
the authors have annotated in source-code comments.  It seems to me that 
much of the complexity in the code itself originates in lack of 
"filtering" of legitimately-structured commands in the syntax.  (Think of 
syntax as a firewall of meaning  :-)  ).

I propose a reversal of that pattern:  I'd like to see if we could, 
collectively, define a robust, formally-defined syntax which virtually 
prohibits people from making statements that are meaningless (i.e., which 
netfilter cannot legitimately interpret).  Then, the semantics become more 
"exposed," in that people just learning can be informed not only what isn't acceptable, but why it's not acceptable which would materially improve error messages to 
provide feedback that educates.  Finally, the remaing (few) pragmatics 
would take care of the special cases that are difficult or impossible to 
represent in syntactic rules.

For starters, I'd suggest we develop a formal syntax that's a legitimate 
subset of what's permitted by current iptables versions today, but which 
experts know represents the practical possibilities.  That would help 
people understand what they can legitimately write on an iptables command line, even though the program will accept 
others.  That may mean, in the short term, having a unique syntax for each 
kind of command.  Then, once that's done, we could then develop a "Version 
2" of the syntax that is even more well-structured and which could serve 
as a guide for developing a future implementation this is more robust, 
more easily documented, meets even more users' requirements, and becomes 
more widely adopted.

Does this sound like a legitimate endeavor of this list (should it be a 
different list)?  Would it be valuable to the developers of 
iptables/netfilter to have this input?  Is it an effort that's worth your 
time?

--Carol Anne 
Carol Anne Ogdin
http://www.net-working.com
530/295-3657
Deep Woods Technology, Inc.
http://www.deepwoods.com
CAOgdin@deepwoods.com
Leveraging technology to restore the soul of the organization

--=_alternative 0051EECE88256C3C_=
Content-Type: text/html; charset="us-ascii"


<br><font size=3 face="Times New Roman">Like many other novices in this list, I've struggled with understanding iptables for several months. &nbsp;Oskar Andreasson's tutorial has been a good guide...and, yet, I feel there's much I don't know about iptables works, so there's much of iptables/netfilter I'm not using. &nbsp;Many people here have helped me develop my current (vague) understanding, but a successful software product (even an &quot;open source&quot; product) can't rely on one-on-one handholding with newbies to attract a following.</font>
<br>
<br><font size=3 face="Times New Roman">Is it important to Rusty and other experts in this forum, to see iptables more widely adopted? &nbsp;It is important to see if we could lay plans for making iptables easier for people to adopt and use in the future. &nbsp;If so, I've an idea, and I'll try to keep it brief, but I do want to present some background.</font>
<br>
<br><font size=3 face="Times New Roman">iptables--to my mind--implements a language of packet handling. &nbsp;A language is defined by 1) syntax, 2) semantics, and 3) pragmatics. &nbsp;The syntax represents the rules of how valid, meaningful statements in the language are made; syntax describes the meanings of those statements, and pragmatics are the rules of how special situations are handled (e.g., how one statement affects another, or how special variations on the syntax rules are built).</font>
<br>
<br><font size=3 face="Times New Roman">iptables appears to me to have a broad and ill-defined syntax (e.g., you can construct statements that are not meaningful), requires deep understanding of packets and routing to effectively apply (i.e., ill-defined semantics), and has a massive set of pragmatics (e.g., don't filter in PREROUTING or POSTROUTING chains, even though the syntax allows it). &nbsp;That makes the language--and its underlying concepts--hard to master. &nbsp;It also makes the code more complex, both as I read it, and as the authors have annotated in source-code comments. &nbsp;It seems to me that much of the complexity in the code itself originates in lack of &quot;filtering&quot; of legitimately-structured commands in the syntax. &nbsp;(Think of syntax as a firewall of meaning &nbsp;:-) &nbsp;).</font>
<br>
<br><font size=3 face="Times New Roman">I propose a reversal of that pattern: &nbsp;I'd like to see if we could, collectively, define a robust, formally-defined syntax which virtually prohibits people from making statements that are meaningless (i.e., which netfilter cannot legitimately interpret). &nbsp;Then, the semantics become more &quot;exposed,&quot; in that people just learning can be informed not only <i>what</i> isn't acceptable, but <i>why</i> it's not acceptable which would materially improve error messages to provide feedback that educates. &nbsp;Finally, the remaing (few) pragmatics would take care of the special cases that are difficult or impossible to represent in syntactic rules.</font>
<br>
<br><font size=3 face="Times New Roman">For starters, I'd suggest we develop a formal syntax that's a legitimate subset of what's permitted by current iptables versions today, but which experts know represents the practical possibilities. &nbsp;That would help people understand what they can <i>legitimately</i> write on an iptables command line, even though the program will accept others. &nbsp;That may mean, in the short term, having a unique syntax for each kind of command. &nbsp;Then, once that's done, we could then develop a &quot;Version 2&quot; of the syntax that is even more well-structured and which could serve as a guide for developing a future implementation this is more robust, more easily documented, meets even more users' requirements, and becomes more widely adopted.</font>
<br>
<br><font size=3 face="Times New Roman">Does this sound like a legitimate endeavor of this list (should it be a different list)? &nbsp;Would it be valuable to the developers of iptables/netfilter to have this input? &nbsp;Is it an effort that's worth your time?</font>
<br><font size=3 face="Times New Roman"><br>
--Carol Anne </font>
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
--=_alternative 0051EECE88256C3C_=--

