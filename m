From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: Patch-o-matic
Date: Thu, 14 Nov 2002 17:54:44 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200FAA488DE0D41194F10010B597610D445FE2@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28BAA.B6F49A60"
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
To: netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28BAA.B6F49A60
Content-Type: text/plain;
	charset="iso-8859-1"

Man!!!!! ,
 
I am sick of patch-o-matic and it's patches.. no matter how many times I
upgrade my kernel (even a fresh copy) and time get a latest copy of iptables
with it's patch-o-matic version, I am never able to patch the newnat stuff
including the H323 patches..
 
What is missing???
 
I'm on (soon to be running, patching atm) Linux 2.4.19 with iptables 1.2.7a
and it's patch-o-matic version....
 
I get this every damn time....
 
Testing... z-newnat16.patch NOT APPLIED (106 rejects out of 110 hunks)
The submitted/z-newnat16 patch:
   Status: Submitted for 2.4.20-pre1
   Implementation of the new nat API for kernel 2.4.19-pre4 and above.
   - enables us to have multiple related expectations
   (necessarry for H.323, real IRC and PPTP tracking, ...)
   - allows expectations to have timeouts
   - adds full SACK support to the NAT code (we no longer strip
   SACKPERM option out of all SYN patckes for ftp/irc connections)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch submitted/z-newnat16.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.
 
[Press enter to continue]
 
 
H323 Patch gets this (obviously coz it needs newnat16)... Grrr!!!
 
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch extra/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.
 
[Press enter to continue]
 
 
what the hell is going on!?
 
Thanks,
 
George VIeira
 

------_=_NextPart_001_01C28BAA.B6F49A60
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>Man!!!!! 
,</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>I am sick of 
patch-o-matic and it's patches.. no matter how many times I upgrade my kernel 
(even a fresh copy) and time get a latest copy of iptables with it's 
patch-o-matic version, I am never able to patch the newnat stuff including the 
H323 patches..</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>What is 
missing???</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>I'm on (soon to be 
running, patching atm) Linux 2.4.19 </FONT></SPAN><SPAN 
class=767424606-14112002><FONT face=Arial size=2>with iptables 1.2.7a and it's 
patch-o-matic version....</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>I get this every 
damn time....</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>Testing... 
z-newnat16.patch NOT APPLIED (106 rejects out of 110 hunks)<BR>The 
submitted/z-newnat16 patch:<BR>&nbsp;&nbsp; Status: Submitted for 
2.4.20-pre1<BR>&nbsp;&nbsp; Implementation of the new nat API for kernel 
2.4.19-pre4 and above.<BR>&nbsp;&nbsp; - enables us to have multiple related 
expectations<BR>&nbsp;&nbsp; (necessarry for H.323, real IRC and PPTP tracking, 
...)<BR>&nbsp;&nbsp; - allows expectations to have timeouts<BR>&nbsp;&nbsp; - 
adds full SACK support to the NAT code (we no longer strip<BR>&nbsp;&nbsp; 
SACKPERM option out of all SYN patckes for ftp/irc 
connections)<BR>-----------------------------------------------------------------<BR>Do 
you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y<BR>Testing patch 
submitted/z-newnat16.patch...<BR>Failed to patch copy of /usr/src/linux<BR>TEST 
FAILED: patch NOT applied.</FONT></SPAN></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>[Press enter to 
continue]</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>H323 Patch gets this 
(obviously coz it needs newnat16)... Grrr!!!</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2>-----------------------------------------------------------------<BR>Do 
you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y<BR>Testing patch 
extra/h323-conntrack-nat.patch...<BR>&nbsp;&nbsp; Placed new Config.in 
line<BR>&nbsp;&nbsp; Placed new Config.in line<BR>&nbsp;&nbsp; Placed new 
Configure.help entry<BR>&nbsp;&nbsp; Placed new Makefile line<BR>Could not find 
place to slot in ip_conntrack.h line<BR>Could not find place to slot in 
ip_conntrack.h line<BR>Could not find place to slot in ip_conntrack.h 
line<BR>TEST FAILED: patch NOT applied.</FONT></SPAN></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>[Press enter to 
continue]</FONT></SPAN></DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=767424606-14112002><FONT face=Arial size=2>what the hell is 
going on!?</FONT></SPAN></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=674251008-03092002>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=674251008-03092002>George 
VIeira</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C28BAA.B6F49A60--

