From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: PPTP reviisted
Date: Sun, 28 Sep 2003 00:27:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F768D64.3080703@smgtec.com>
References: <E1A3UZL-000289-3y@bear.dns-nac-zone.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070203060703060301000009"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1A3UZL-000289-3y@bear.dns-nac-zone.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Miller <cmiller@compuville.net>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------070203060703060301000009
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

If you want to enable conntrack for Linux you will need:

1. A Recent Kernel, I know anything later than 2.4.20 can work fine.
2. Kernel patches from pptpclient.sourceforge.net if you want the 
firewall itself setting up the pptp tunnel, if not, ignore this step
3. CVS download the netfilter code from netfilter.org
4. Apply the patch-o-matic directory to your kernel sources directory 
like so:
# KERNEL_DIR=/usr/src/<kerneldir> ./runme extra
5. Apply all patches that you really care for, but I would recommend 
anything that doesn't fail out on your configuration.Make sure to 
include the connectrack patch
6. Build the kernel with the new netfilter options turned on as modules
7. Install Kernel
8. Execute the following every time you want pptp (once per boot):
# modprobe ip_conntrack_proto_gre
# modprobe ip_nat_proto_gre
# modprobe ip_conntrack_pptp
# modprobe ip_nat_pptp

Chris Miller wrote:

> I've seen a few things in the netfilter archive about PPTP, but no one 
> has ever really said anything about getting it to work.
>
>  
>
> Here's the deal: I've got a Windows box (192.168.1.10) sitting behind 
> my Linux firewall. On the firewall runs Debian Woody with iptables 
> 1.2.6a. The Linux box acts as a NAT to all the hosts behind it. 
> Currently I forward TCP port 1723 to 192.168.1.10, but clients cannot 
> connect. I know it's got something to do with GRE?
>
>  
>
> I saw something on Google about an ip_conntrac_pptp module, or 
> something to that nature, but I've not been able to find it anywhere. 
> I'd love to compile it and give it a try if it's made to fix this issue.
>
>  
>
> So could someone fill me in with what my options are as far as getting 
> my VPN working through my NAT? What exactly is going on?
>
>  
>
>  
>
> Thanks,
>
>  
>
> Chris Miller
>
> Compuville Computers
>
> www.compuville.net
>
> 423.276.6692
>
>  
>

--------------070203060703060301000009
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
If you want to enable conntrack for Linux you will need:<br>
<br>
1. A Recent Kernel, I know anything later than 2.4.20 can work fine.<br>
2. Kernel patches from pptpclient.sourceforge.net if you want the
firewall itself setting up the pptp tunnel, if not, ignore this step<br>
3. CVS download the netfilter code from netfilter.org<br>
4. Apply the patch-o-matic directory to your kernel sources directory
like so:<br>
# KERNEL_DIR=/usr/src/&lt;kerneldir&gt; ./runme extra<br>
5. Apply all patches that you really care for, but I would recommend
anything that doesn't fail out on your configuration.Make sure to
include the connectrack patch<br>
6. Build the kernel with the new netfilter options turned on as modules<br>
7. Install Kernel<br>
8. Execute the following every time you want pptp (once per boot):<br>
# modprobe ip_conntrack_proto_gre<br>
# modprobe ip_nat_proto_gre<br>
# modprobe ip_conntrack_pptp<br>
# modprobe ip_nat_pptp<br>
<br>
Chris Miller wrote:<br>
<blockquote type="cite"
 cite="midE1A3UZL-000289-3y@bear.dns-nac-zone.com">
  <meta content="text/html; " http-equiv="Content-Type">
  <meta content="Microsoft Word 11 (filtered medium)" name="Generator">
  <style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
  </style>
  <div class="Section1">
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">I&#8217;ve seen a few things in
the netfilter archive about
PPTP, but no one has ever really said anything about getting it to work.<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">Here&#8217;s the deal: I&#8217;ve got
a Windows box
(192.168.1.10) sitting behind my Linux firewall. On the firewall runs
Debian
Woody with iptables 1.2.6a. The Linux box acts as a NAT to all the
hosts behind
it. Currently I forward TCP port 1723 to 192.168.1.10, but clients
cannot
connect. I know it&#8217;s got something to do with GRE?<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">I saw something on Google
about an ip_conntrac_pptp module,
or something to that nature, but I&#8217;ve not been able to find it
anywhere.
I&#8217;d love to compile it and give it a try if it&#8217;s made to fix this
issue.<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">So could someone fill me
in with what my options are as far
as getting my VPN working through my NAT? What exactly is going on?<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">Thanks,<o:p></o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">Chris Miller<o:p></o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">Compuville Computers<o:p></o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;"><a class="moz-txt-link-abbreviated" href="http://www.compuville.net">www.compuville.net</a><o:p></o:p></span></font></p>
  <p class="MsoAutoSig"><font face="Arial" size="2"><span
 style="font-size: 10pt; font-family: Arial;">423.276.6692<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font face="Times New Roman" size="3"><span
 style="font-size: 12pt;"><o:p>&nbsp;</o:p></span></font></p>
  </div>
</blockquote>
</body>
</html>

--------------070203060703060301000009--


