From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Re: Start Up Script
Date: Thu, 6 Mar 2003 07:28:53 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF2810B678.44A17623-ON88256CE1.0053F7FC-88256CE1.00550AAE@deepwoods.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 00550AA788256CE1_="
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
To: Brian Bunnell <bbunnell@iastate.edu>
Cc: netfilter@lists.netfilter.org

This is a multipart message in MIME format.
--=_alternative 00550AA788256CE1_=
Content-Type: text/plain; charset="us-ascii"

I put a collection of bash scripts (containing all my iptables and ip and 
other configuration commands) in a unique directory that I can use at 
bootup.  I have a shorter bash script that invokes those specific bash 
scrips from the startup process.
Specifically, at /etc/rc.d/rc2.d/ (and at .../rc3.d/..., .../rc4.d/... and 
.../rc5.d/...) I have a script named S11dwt that contains the following 
commands:
        #!/bin/bash
        pushd . &>/dev/null

        cd /etc/sysconfig/network-scripts/DWT

        bash Kernel
        bash Firewall
        bash NICs
        bash Routes

        popd &>/dev/null

The four referenced scripts set certain Kernel configuration parameters, 
setup the Firewall iptables chains, enable the NICs, and then establish 
the Routes.

Hope this helps...most Linux documentation is written for people who 
already know how to do things, so it can be hard to ferret out simple 
things like this.

--Carol Anne 
Carol Anne Ogdin
http://www.net-working.com
530/295-3657
Deep Woods Technology, Inc.
http://www.deepwoods.com
CAOgdin@deepwoods.com
Leveraging technology to restore the soul of the organization
Message: 2
From: "Brian Bunnell" <bbunnell@iastate.edu>
To: <netfilter@lists.netfilter.org>
Subject: Start Up Script
Date: Sun, 2 Mar 2003 12:43:02 -0600

Hello

Thank you very much for helping me.  I have a perfectly good netfilter
script that I run from the command line and everything works fine.  I 
would
like this script to run when I boot up the computer.  I am having a lot of
trouble finding quality resources on the net about this.

There are great resources for learning how to use netfilter.  However, 
when
it comes to startup scripts, all the examples seem to be 25 pages long and
incomprehensible or wnat me to completely rewrite the script I already 
have.

Why can't I just tell the computer to run my script instead of the "Let 
the
world in" script it runs at boot?

Does anyone have any recommendations, resources or better yet, a good
concise example for run level 3?

Thank you very much
Brian Bunnell
---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.445 / Virus Database: 250 - Release Date: 1/21/03
--=_alternative 00550AA788256CE1_=
Content-Type: text/html; charset="us-ascii"


<br><font size=3 face="Times New Roman">I put a collection of bash scripts (containing all my iptables and ip and other configuration commands) in a unique directory that I can use at bootup. &nbsp;I have a shorter bash script that invokes those specific bash scrips from the startup process.</font>
<p><font size=3 face="Times New Roman">Specifically, at /etc/rc.d/rc2.d/ (and at .../rc3.d/..., .../rc4.d/... and .../rc5.d/...) I have a script named S11dwt that contains the following commands:<br>
 &nbsp; &nbsp; &nbsp; &nbsp;</font><font size=2><tt>#!/bin/bash</tt></font>
<p><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; pushd . &amp;&gt;/dev/null</tt></font>
<br>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; cd /etc/sysconfig/network-scripts/DWT</tt></font>
<br>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; bash Kernel</tt></font>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; bash Firewall</tt></font>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; bash NICs</tt></font>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; bash Routes</tt></font>
<br>
<br><font size=2><tt>&nbsp; &nbsp; &nbsp; &nbsp; popd &amp;&gt;/dev/null</tt></font>
<br>
<br><font size=3 face="Times New Roman">The four referenced scripts set certain Kernel configuration parameters, setup the Firewall iptables chains, enable the NICs, and then establish the Routes.</font>
<br>
<br><font size=3 face="Times New Roman">Hope this helps...most Linux documentation is written for people who already know how to do things, so it can be hard to ferret out simple things like this.</font>
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
<br><font size=2 face="Courier New">Message: 2<br>
From: &quot;Brian Bunnell&quot; &lt;bbunnell@iastate.edu&gt;<br>
To: &lt;netfilter@lists.netfilter.org&gt;<br>
Subject: Start Up Script<br>
Date: Sun, 2 Mar 2003 12:43:02 -0600<br>
<br>
Hello<br>
<br>
Thank you very much for helping me. &nbsp;I have a perfectly good netfilter<br>
script that I run from the command line and everything works fine. &nbsp;I would<br>
like this script to run when I boot up the computer. &nbsp;I am having a lot of<br>
trouble finding quality resources on the net about this.<br>
<br>
There are great resources for learning how to use netfilter. &nbsp;However, when<br>
it comes to startup scripts, all the examples seem to be 25 pages long and<br>
incomprehensible or wnat me to completely rewrite the script I already have.<br>
<br>
Why can't I just tell the computer to run my script instead of the &quot;Let the<br>
world in&quot; script it runs at boot?<br>
<br>
Does anyone have any recommendations, resources or better yet, a good<br>
concise example for run level 3?<br>
<br>
Thank you very much<br>
Brian Bunnell<br>
---<br>
Outgoing mail is certified Virus Free.<br>
Checked by AVG anti-virus system (http://www.grisoft.com).<br>
Version: 6.0.445 / Virus Database: 250 - Release Date: 1/21/03</font>
--=_alternative 00550AA788256CE1_=--

